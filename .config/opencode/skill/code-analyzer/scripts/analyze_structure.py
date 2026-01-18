#!/usr/bin/env python3
"""
Project Structure Analyzer

Analyzes the directory structure and categorizes files by type.
Usage: python analyze_structure.py <root_directory>
"""

import os
import sys
from collections import defaultdict

def analyze_structure(root_dir):
    file_types = defaultdict(int)
    directories = set()
    total_files = 0

    for dirpath, dirnames, filenames in os.walk(root_dir):
        # Skip common ignore directories - necessary to avoid analyzing irrelevant build/artifacts folders
        dirnames[:] = [d for d in dirnames if not d.startswith('.') and d not in ['node_modules', '__pycache__', 'venv']]

        for dirname in dirnames:
            directories.add(os.path.join(dirpath, dirname))

        for filename in filenames:
            total_files += 1
            ext = os.path.splitext(filename)[1].lower()
            if ext:
                file_types[ext] += 1
            else:
                file_types['no_extension'] += 1

    return {
        'total_files': total_files,
        'directories': sorted(directories),
        'file_types': dict(sorted(file_types.items(), key=lambda x: x[1], reverse=True))
    }

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage: python analyze_structure.py <root_directory>")
        sys.exit(1)

    root_dir = sys.argv[1]
    if not os.path.exists(root_dir):
        print(f"Directory {root_dir} does not exist")
        sys.exit(1)

    result = analyze_structure(root_dir)

    print(f"Project Structure Analysis for: {root_dir}")
    print(f"Total files: {result['total_files']}")
    print(f"Total directories: {len(result['directories'])}")
    print("\nFile types:")
    for ext, count in result['file_types'].items():
        print(f"  {ext}: {count}")

    print("\nTop-level directories:")
    for d in result['directories'][:10]:  # Show first 10 directories to avoid overwhelming output
        rel_path = os.path.relpath(d, root_dir)
        if rel_path.count(os.sep) <= 1:  # Only show top-level directories for clarity
            print(f"  {rel_path}")