import re

class DDLConverter:
    def __init__(self):
        self.pk_map = {}          # Stores {table_name_lower: primary_key_column}
        self.table_case_map = {}  # Stores {table_name_lower: original_table_name}

    def _clean_name(self, name):
        """Removes quotes/brackets and whitespaces."""
        if not name: return name
        return re.sub(r'["\'\[\]`]', '', name.strip())

    def _add_backticks(self, name):
        """Encloses the name in backticks."""
        return f'`{self._clean_name(name)}`'

    def _split_definitions(self, body_str):
        """Splits definitions by comma, ignoring commas inside parentheses."""
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

    def _remove_comments(self, sql_str):
        return re.sub(r'--.*$', '', sql_str, flags=re.MULTILINE)

    def scan_schema_metadata(self, ddl_str):
        """
        Pass 1: Scans the schema to record original table case and Primary Keys.
        This is necessary for fixing case mismatch and inferring implicit FK columns.
        """
        table_pattern = re.compile(r'CREATE\s+TABLE\s+(?:IF\s+NOT\s+EXISTS\s+)?(.+?)\s*\((.*?)\)\s*;', re.IGNORECASE | re.DOTALL)
        
        for match in table_pattern.finditer(ddl_str):
            raw_table_name = self._clean_name(match.group(1))
            
            # Map lowercase name to original name for case restoration
            self.table_case_map[raw_table_name.lower()] = raw_table_name
            
            body = match.group(2)
            definitions = self._split_definitions(body)
            pk_column = None
            
            for line in definitions:
                line_clean = re.sub(r'\s+', ' ', line).strip()
                upper_line = line_clean.upper()
                
                # Check table-level Primary Key
                if upper_line.startswith('PRIMARY KEY'):
                    # Skip composite keys for auto-inference
                    if ',' not in line_clean:
                        pk_match = re.search(r'\((.*?)\)', line_clean)
                        if pk_match:
                            pk_column = self._clean_name(pk_match.group(1))
                    break 
                
                # Check column-level Primary Key (Heuristic)
                if not (upper_line.startswith('FOREIGN KEY') or upper_line.startswith('UNIQUE') or upper_line.startswith('KEY') or upper_line.startswith('CHECK')):
                    if 'PRIMARY KEY' in upper_line:
                        col_match = re.search(r'^(".*?"|`.*?`|\[.*?\]|[\w]+)', line_clean)
                        if col_match:
                            pk_column = self._clean_name(col_match.group(1))
            
            if pk_column:
                self.pk_map[raw_table_name.lower()] = pk_column
            else:
                self.pk_map[raw_table_name.lower()] = 'id' # Default fallback

    def _get_canonical_table_name(self, raw_ref_name):
        """Returns the original table name defined in CREATE TABLE."""
        clean_ref = self._clean_name(raw_ref_name)
        return self.table_case_map.get(clean_ref.lower(), clean_ref)

    def process(self, ddl_str):
        # 0. Pre-processing: Remove comments and ensure valid termination
        ddl_str = self._remove_comments(ddl_str).strip() + ';'
        
        # 1. Scan metadata (PKs and Table Case)
        self.scan_schema_metadata(ddl_str)
        
        # 2. Main processing
        table_pattern = re.compile(r'CREATE\s+TABLE\s+(?:IF\s+NOT\s+EXISTS\s+)?(.+?)\s*\((.*?)\)\s*;', re.IGNORECASE | re.DOTALL)
        formatted_tables = []
        
        for match in table_pattern.finditer(ddl_str):
            raw_table_name = match.group(1)
            raw_body = match.group(2)
            
            table_name = self._add_backticks(raw_table_name)
            definitions = self._split_definitions(raw_body)
            new_definitions = []
            extracted_fks = []
            
            for line in definitions:
                line = re.sub(r'\s+', ' ', line).strip()
                upper_line = line.upper()
                
                # --- Skip specific constraints ---
                if upper_line.startswith('UNIQUE'): continue
                if upper_line.startswith('KEY ') or upper_line.startswith('INDEX '): continue
                if upper_line.startswith('CHECK'): continue
                
                # --- Handle Table-Level Primary Key ---
                if upper_line.startswith('PRIMARY KEY'):
                    if ',' in line: continue # Remove Composite PK
                    pk_match = re.search(r'\((.*?)\)', line)
                    if pk_match:
                        pk_col = self._add_backticks(pk_match.group(1))
                        new_definitions.append(f"PRIMARY KEY ({pk_col})")
                    else:
                        new_definitions.append(line)
                    continue

                # --- Handle Table-Level Foreign Key ---
                if upper_line.startswith('FOREIGN KEY'):
                    # Regex: Matches table names strictly (quoted or alphanumeric) to avoid matching "Player(id)" as a name
                    fk_pattern = r'FOREIGN\s+KEY\s*\((.*?)\)\s*REFERENCES\s+(".*?"|`.*?`|\[.*?\]|[\w]+)(?:\s*\((.*?)\))?'
                    fk_match = re.match(fk_pattern, line, re.IGNORECASE)
                    
                    if fk_match:
                        cols = [self._add_backticks(c) for c in fk_match.group(1).split(',')]
                        
                        raw_ref_table = fk_match.group(2)
                        # Fix Case Sensitivity
                        canonical_ref_table = self._get_canonical_table_name(raw_ref_table)
                        ref_table = self._add_backticks(canonical_ref_table)
                        
                        raw_ref_cols = fk_match.group(3)
                        
                        if raw_ref_cols:
                            ref_cols_str = ', '.join([self._add_backticks(c) for c in raw_ref_cols.split(',')])
                        else:
                            # Infer PK if missing
                            target_pk = self.pk_map.get(canonical_ref_table.lower(), 'id')
                            ref_cols_str = self._add_backticks(target_pk)
                            
                        new_definition = f"FOREIGN KEY ({', '.join(cols)}) REFERENCES {ref_table} ({ref_cols_str})"
                        new_definitions.append(new_definition)
                    else:
                        new_definitions.append(line)
                    continue

                # --- Handle Column Definitions ---
                col_match = re.search(r'^(".*?"|`.*?`|\[.*?\]|[\w]+)\s+(.*)$', line)
                if col_match:
                    raw_col_name = col_match.group(1)
                    col_rest = col_match.group(2)
                    col_name = self._add_backticks(raw_col_name)
                    
                    # Type and Constraint Cleaning
                    col_rest = re.sub(r'\bDATETIME\b', 'TIMESTAMP', col_rest, flags=re.IGNORECASE)
                    col_rest = re.sub(r'\bAUTOINCREMENT\b', '', col_rest, flags=re.IGNORECASE)
                    col_rest = re.sub(r'\bUNIQUE\b', '', col_rest, flags=re.IGNORECASE)
                    def default_swap(m): return f"NOT NULL DEFAULT {m.group(1)}"
                    col_rest = re.sub(r'\bDEFAULT\s+(.+?)\s+NOT\s+NULL', default_swap, col_rest, flags=re.IGNORECASE)
                    
                    # --- Extract Inline Foreign Keys ---
                    inline_fk_pattern = re.compile(
                        r'\bREFERENCES\s+(".*?"|`.*?`|\[.*?\]|[\w]+)(?:\s*\((.*?)\))?.*', 
                        re.IGNORECASE
                    )
                    fk_found = inline_fk_pattern.search(col_rest)
                    
                    if fk_found:
                        raw_ref_table = fk_found.group(1)
                        # Fix Case Sensitivity
                        canonical_ref_table = self._get_canonical_table_name(raw_ref_table)
                        ref_table_fmt = self._add_backticks(canonical_ref_table)
                        
                        ref_col_raw = fk_found.group(2)
                        
                        if ref_col_raw:
                            ref_col_fmt = self._add_backticks(ref_col_raw)
                        else:
                            # Infer PK if missing
                            target_pk = self.pk_map.get(canonical_ref_table.lower(), 'id')
                            ref_col_fmt = self._add_backticks(target_pk)
                        
                        extracted_fk = f"FOREIGN KEY ({col_name}) REFERENCES {ref_table_fmt} ({ref_col_fmt})"
                        extracted_fks.append(extracted_fk)
                        
                        # Remove the REFERENCES clause from the column definition
                        col_rest = col_rest.replace(fk_found.group(0), '')
                     
                    col_rest = re.sub(r'\s+', ' ', col_rest).strip()
                    new_definitions.append(f"{col_name} {col_rest}")
                else:
                    new_definitions.append(line)
            
            # Append extracted foreign keys to the end of table definition
            new_definitions.extend(extracted_fks)
            
            body_str = ",\n    ".join(new_definitions)
            formatted_tables.append(f"CREATE TABLE {table_name}\n(\n    {body_str}\n);")
            
        return "\n\n".join(formatted_tables)

# --- Test Execution ---
if __name__ == "__main__":
    input_str = """
    CREATE TABLE `League`
    (
        `id` INTEGER PRIMARY KEY,
        `country_id` INTEGER,
        `name` TEXT,
        FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) -- references lowercase schema
    );

    CREATE TABLE `Country`
    (
        `id` INTEGER PRIMARY KEY,
        `name` TEXT
    );
    
    CREATE TABLE `Player` (
        `id` INTEGER PRIMARY KEY,
        `player_api_id` INTEGER DEFAULT 0 NOT NULL, 
        `date_born` DATETIME
    );

    CREATE TABLE `Roster` (
        `id` INTEGER PRIMARY KEY AUTOINCREMENT,
        `pid` INTEGER REFERENCES Player -- Implicit PK, Inline FK
    );
    """

    converter = DDLConverter()
    print(converter.process(input_str))