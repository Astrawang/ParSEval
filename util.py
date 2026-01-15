import re

def add_backticks(name):
    """移除引用符并添加反引号"""
    clean_name = re.sub(r'["\'\[\]`]', '', name.strip())
    return f'`{clean_name}`'

def remove_comments(sql_str):
    """移除单行注释"""
    return re.sub(r'--.*$', '', sql_str, flags=re.MULTILINE)

def split_sql_definitions(body_str):
    """智能拆分：根据逗号分割，但跳过括号内的逗号"""
    definitions = []
    current_chars = []
    paren_depth = 0
    
    for char in body_str:
        if char == '(':
            paren_depth += 1
            current_chars.append(char)
        elif char == ')':
            paren_depth -= 1
            current_chars.append(char)
        elif char == ',' and paren_depth == 0:
            definitions.append("".join(current_chars).strip())
            current_chars = []
        else:
            current_chars.append(char)
            
    if current_chars:
        s = "".join(current_chars).strip()
        if s: definitions.append(s)
        
    return definitions

def clean_ddl_for_calcite(ddl_str):
    # 0. 预处理
    ddl_str = remove_comments(ddl_str).strip() + ';'

    table_pattern = re.compile(r'CREATE\s+TABLE\s+(?:IF\s+NOT\s+EXISTS\s+)?(.+?)\s*\((.*?)\)\s*;', re.IGNORECASE | re.DOTALL)
    
    formatted_tables = []
    
    for match in table_pattern.finditer(ddl_str):
        raw_table_name = match.group(1)
        raw_body = match.group(2)
        
        table_name = add_backticks(raw_table_name)
        definitions = split_sql_definitions(raw_body)
        new_definitions = []
        # 用于暂存提取出来的行内（Inline）外键，以便最后追加
        extracted_fks = []
        
        for line in definitions:
            line = re.sub(r'\s+', ' ', line).strip()
            upper_line = line.upper()
            
            # --- 表级约束处理 (Existing Table Level) ---
            if upper_line.startswith('UNIQUE'):
                continue 
                
            if upper_line.startswith('PRIMARY KEY'):
                if ',' in line:
                    continue # 移除复合主键
                else:
                    pk_match = re.search(r'\((.*?)\)', line)
                    if pk_match:
                        pk_col = add_backticks(pk_match.group(1))
                        new_definitions.append(f"PRIMARY KEY ({pk_col})")
                    else:
                        new_definitions.append(line)
                    continue
            
            if upper_line.startswith('FOREIGN KEY'):
                fk_match = re.search(r'FOREIGN\s+KEY\s*\((.*?)\)\s*REFERENCES\s+(\S+)\s*\((.*?)\)', line, re.IGNORECASE)
                if fk_match:
                    cols = [add_backticks(c) for c in fk_match.group(1).split(',')]
                    ref_table = add_backticks(fk_match.group(2))
                    ref_cols = [add_backticks(c) for c in fk_match.group(3).split(',')]
                    new_line = f"FOREIGN KEY ({', '.join(cols)}) REFERENCES {ref_table} ({', '.join(ref_cols)})"
                    new_definitions.append(new_line)
                else:
                    new_definitions.append(line)
                continue
            
            if upper_line.startswith('KEY ') or upper_line.startswith('INDEX '):
                continue

            # --- 列定义处理 ---
            col_match = re.search(r'^(".*?"|`.*?`|\[.*?\]|\w+)\s+(.*)$', line)
            
            if col_match:
                raw_col_name = col_match.group(1)
                col_rest = col_match.group(2)
                
                col_name = add_backticks(raw_col_name)
                
                # 特性1: DATETIME -> TIMESTAMP
                col_rest = re.sub(r'\bDATETIME\b', 'TIMESTAMP', col_rest, flags=re.IGNORECASE)

                # 移除 autoincrement
                col_rest = re.sub(r'\bAUTOINCREMENT\b', '', col_rest, flags=re.IGNORECASE)
                
                # 移除 unique (列级)
                col_rest = re.sub(r'\bUNIQUE\b', '', col_rest, flags=re.IGNORECASE)
                
                # default 调整
                swap_pattern = re.compile(r'\bDEFAULT\s+(.+?)\s+NOT\s+NULL', re.IGNORECASE)
                col_rest = swap_pattern.sub(lambda m: f"NOT NULL DEFAULT {m.group(1)}", col_rest)

                # ★★★ 新特性2改进：提取行内REFERENCES为表级外键 ★★★
                # 匹配：REFERENCES table(col) ...
                # .* 贪婪匹配到末尾（为了移除 ON DELETE CASCADE 等）
                inline_fk_pattern = re.compile(r'\bREFERENCES\s+(".*?"|`.*?`|\[.*?\]|\S+)\s*\((.*?)\).*', re.IGNORECASE)
                
                fk_found = inline_fk_pattern.search(col_rest)
                if fk_found:
                    ref_table = add_backticks(fk_found.group(1))
                    ref_col = add_backticks(fk_found.group(2))
                    
                    # 生成标准的表级外键语句，存入暂存区
                    extracted_fk_sql = f"FOREIGN KEY ({col_name}) REFERENCES {ref_table} ({ref_col})"
                    extracted_fks.append(extracted_fk_sql)
                    
                    # 从列定义中彻底删除 REFERENCES ... 部分
                    # 使用 fk_found.group(0) 可以删除匹配到的整个子串(包含后续的 cascade)
                    col_rest = col_rest.replace(fk_found.group(0), '')
                
                # 清理
                col_rest = re.sub(r'\s+', ' ', col_rest).strip()
                new_definitions.append(f"{col_name} {col_rest}")
            else:
                new_definitions.append(line)

        # ★★★ 最后将提取出来的外键追加到定义列表中 ★★★
        new_definitions.extend(extracted_fks)

        # 格式化拼接
        body_str = ",\n    ".join(new_definitions)
        format_sql = f"CREATE TABLE {table_name}\n(\n    {body_str}\n);"
        formatted_tables.append(format_sql)

    return "\n\n".join(formatted_tables)
