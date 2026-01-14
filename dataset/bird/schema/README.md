1. extracted from bird-bench with code

```python
import os
import sqlite3

for path in os.listdir("./data/bird-dev/database"):
    filepath = os.path.join("./data/bird-dev/database", path, f"{path}.sqlite")
    conn = sqlite3.connect(filepath)
    # 提取schema
    cursor = conn.cursor()
    cursor.execute("SELECT sql FROM sqlite_master WHERE type='table';")
    schema = cursor.fetchall()
    schema = ";\n\n".join([s[0] for s in schema if "sqlite_sequence" not in s[0]])
    print(schema)
    with open(f"output/{path}.sql", "w") as f:
        f.write(schema)
        
```

2. remove all `autoincrement` in ddl
3. `default x not null` -> `not null default x`
4. enclose all table name and column name in ddl with backquote(\`)