import argparse, os
from src.corekit import get_ctx
from sqlglot import parse
from src.instance.generators import ValueGeneratorRegistry, register_default_generators
from src.runtime.verifier import compare_sql
import logging
logger = logging.getLogger('src.test')

PROJECT_DIR = os.getcwd()

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="ParSEval: Plan-aware test database generation for query equivalence")
    parser.add_argument('--dialect', type=str,  help="Query Dialect", default='sqlite')
    parser.add_argument('--schema', type=str, help="database schema")
    parser.add_argument('--gold', type=str,  help="the gold query")
    parser.add_argument('--pred', type=str,  help="the pred query", default= None)
    parser.add_argument('--offline', type=bool,  default= False)
    parser.add_argument('--name', type=str,  help="the name of generated instance", default= "test")
    parser.add_argument('--maxiter', type=int,  default= 8)


    
    args = parser.parse_args()

    if args.schema:
        with open(args.schema, "r") as f:
            args.schema = f.read()
    if args.gold:
        with open(args.gold, "r") as f:
            args.gold = f.read()
    if args.pred:
        with open(args.pred, "r") as f:
            args.pred = f.read()

    dialect = args.dialect
    maxiter = args.maxiter
    
    ctx = get_ctx(log_level = 'INFO', result_path = 'results/dail')
    register_default_generators()
    from src.parseval.generator import Generator
    schema = args.schema
    host_or_path = "examples"

    if args.offline:
        generator = Generator(schema, args.gold, dialect=args.dialect, name = 'test')
        result =generator.generate(max_iter= maxiter)

        filename = os.path.join(host_or_path, "test.sqlite")
        if os.path.exists(filename):
            os.remove(filename)
        result.to_db(host_or_path, "test")
    else:
        generator = Generator(schema, args.gold, dialect=args.dialect, name = 'test_gold')
        result1 =generator.generate(max_iter= maxiter)
        
        filename = os.path.join(host_or_path, "gold.sqlite")
        if os.path.exists(filename):
            os.remove(filename)
        result1.to_db(host_or_path, "gold")
        
        result = compare_sql(host_or_path, "gold.sqlite", args.gold, args.pred)
        print(result)
        import time
        time.sleep(5)
        # result = compare_sql(result1, args.gold, args.pred)
        if result['state'] == 'EQ' or result['state'] == 'UNKNOWN':
            generator = Generator(schema, args.pred, dialect=args.dialect, name = 'test_pred')
            result2 =generator.generate(max_iter= maxiter)

            filename = os.path.join(host_or_path, "pred.sqlite")
            if os.path.exists(filename):
                os.remove(filename)
            result1.to_db(host_or_path, "pred")

            result = compare_sql(host_or_path, "pred.sqlite", args.gold, args.pred)
            print(result)
        






