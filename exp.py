import argparse
import os
import json
import subprocess
import time
import multiprocessing
import queue


from src.corekit import get_ctx
from src.instance.generators import register_default_generators
from src.runtime.verifier import compare_sql

def test_one_parseval(schema, gold, pred, dialect, maxiter, output):
    # ctx = get_ctx(log_level = 'INFO', result_path = 'results/dail')
    register_default_generators()
    from src.parseval.generator import Generator
    try:
        generator = Generator(schema, gold, dialect)
        result1 = generator.generate(max_iter=maxiter)
        db_path = os.path.join(output["path"], f"{output['name']}_gold.sqlite")
        if os.path.exists(db_path):
            os.remove(db_path)
        result1.to_db(output["path"], f"{output['name']}_gold")
        result = [compare_sql(output["path"], f"{output['name']}_gold.sqlite", gold, pred)]
    except Exception as e:
        print("Error during generation or comparison for gold query:", e)
        result = [{'state': 'ERROR', 'msg': str(e)}]
    if result[0]['state'] == 'EQ' or result[0]['state'] == 'UNKNOWN' or result[0]['state'] == 'ERROR':
        try:
            generator = Generator(schema, pred, dialect)
            result2 = generator.generate(max_iter=maxiter)
            db_path = os.path.join(output["path"], f"{output['name']}_pred.sqlite")
            if os.path.exists(db_path):
                os.remove(db_path)
            result2.to_db(output["path"], f"{output['name']}_pred")
            result.append(compare_sql(output["path"], f"{output['name']}_pred.sqlite", gold, pred))
        except Exception as e:
            print("Error during generation or comparison for pred query:", e)
            import traceback
            traceback.print_exc()
            result.append({'state': 'ERROR', 'msg': str(e)})
    return result

def worker_wrapper(q, func, *args, **kwargs):
    try:
        result = func(*args, **kwargs)
        q.put(result)
    except Exception as e:
        q.put([{"state": "ERROR", "msg": str(e)}])
    

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="ParSEval: Plan-aware test database generation for query equivalence")
    parser.add_argument('--dialect', type=str,  help="Query Dialect", default='sqlite')
    parser.add_argument('--dataset', type=str, help="experiment dataset", default='bird')
    parser.add_argument('--method', type=str, default="parseval")
    parser.add_argument('--maxiter', type=int,  default=8)
    parser.add_argument('--timeout', type=int,  default=300)
    
    args = parser.parse_args()
    
    dataset_path = os.path.join("dataset", args.dataset)
    with open(os.path.join(dataset_path, "gold.sql")) as f:
        gold_sqls = f.readlines()
    with open(os.path.join(dataset_path, "pred.sql")) as f:
        pred_sqls = f.readlines()
    
    if args.method == "parseval":
        test_func = test_one_parseval
    else:
        raise NotImplementedError(f"Method {args.method} not implemented.")
    
    progress_file = os.path.join("results", args.dataset, f"{args.method}-progress.txt")
    
    for i, (gold_sql, pred_sql) in enumerate(zip(gold_sqls, pred_sqls)):
        with open(progress_file, "w") as f:
            f.write(f"{i}\n")

        database = gold_sql.split("----- SQL-EVAL -----")[1].strip()
        with open(os.path.join(dataset_path, "schema", f"{database}.sql")) as f:
            schema = f.read()
            
        output = {
            "path": os.path.join("results", args.dataset, args.method),
            "name": f"q{i}"
        }
        os.makedirs(output["path"], exist_ok=True)
        
        if os.path.exists(os.path.join(output["path"], f"q{i}_result.json")):
            continue
        
        q = multiprocessing.Queue()
        
        p = multiprocessing.Process(
            target=worker_wrapper, 
            args=(q, test_func, schema, gold_sql, pred_sql, args.dialect, args.maxiter, output)
        )
        
        p.start()
        
        p.join(timeout=args.timeout)

        if p.is_alive():
            print(f"Query {i} TIMEOUT, killing process...")
            p.terminate() 
            p.join() 
            result = [{"state": "TIMEOUT"}]
        else:
            try:
                result = q.get_nowait()
            except queue.Empty:
                result = [{"state": "ERROR", "msg": "Process crashed without output"}]
        
        with open(os.path.join(output["path"], f"q{i}_result.json"), "w") as f:
            json.dump(result, f, indent=4)
        print(f"completed {i}: {result}")
        time.sleep(1)
