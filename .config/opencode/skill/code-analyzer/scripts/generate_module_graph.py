#!/usr/bin/env python3

import os
import re
from collections import defaultdict

def find_imports(file_path):
    imports = set()
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
            # Find import statements - necessary because regex handles both 'from X' and 'import X' patterns
            import_lines = re.findall(r'^(?:from\s+(\S+)|import\s+(\S+))', content, re.MULTILINE)
            for match in import_lines:
                module = match[0] or match[1]
                # Take first part before dot - necessary to get top-level module for dependency analysis
                module = module.split('.')[0]
                imports.add(module)
    except Exception:
        pass
    return imports

def generate_graph(root_dir):
    graph = defaultdict(set)
    for dirpath, _, filenames in os.walk(root_dir):
        for filename in filenames:
            if filename.endswith('.py'):
                file_path = os.path.join(dirpath, filename)
                rel_path = os.path.relpath(file_path, root_dir)
                module_name = rel_path.replace(os.sep, '.').replace('.py', '')
                imports = find_imports(file_path)
                for imp in imports:
                    graph[module_name].add(imp)
    return graph

if __name__ == '__main__':
    import sys
    if len(sys.argv) != 2:
        print("Usage: python generate_module_graph.py <root_directory>")
        sys.exit(1)
    root_dir = sys.argv[1]
    graph = generate_graph(root_dir)
    print("Module Dependencies:")
    for module, deps in graph.items():
        if deps:
            print(f"{module} -> {', '.join(deps)}")
