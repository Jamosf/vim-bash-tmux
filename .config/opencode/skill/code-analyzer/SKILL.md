---
name: code-analyzer
description: Skill for analyzing project source code to understand structure, main functions, module relationships, and processes. Use when you need to quickly get an overview of a codebase, identify key components, and map out how different parts interact. Triggered by requests to analyze code, understand project architecture, or clarify module relationships and workflows.
---

# Code Analyzer

## Overview

This skill enables quick analysis of project source code to understand the overall structure, main functionalities, relationships between modules, and key processes. It provides a systematic approach to codebase exploration using various tools for efficient comprehension.

## Workflow Decision Tree

Choose the analysis path based on your needs:

- **Quick Overview**: Need a high-level understanding → Start with Project Structure Analysis
- **Deep Dive**: Want detailed functionality → Start with Main Functions Analysis
- **Relationships**: Focus on interactions → Start with Module Relationships Mapping
- **Processes**: Understand workflows → Start with Process Flow Analysis

## Project Structure Analysis

1. **Directory Structure**: Use `glob` to list all files and directories, categorize by type (.py, .js, .tsx, etc.)
2. **Entry Points**: Identify main entry files (main.py, index.js, app.py, etc.)
3. **Configuration Files**: Locate and analyze config files (package.json, requirements.txt, settings.py, etc.)
4. **Build/Deploy Scripts**: Find build files (Makefile, docker-compose.yml, webpack.config.js, etc.)

## Main Functions Analysis

1. **Key Classes/Modules**: Use `lsp_document_symbols` to get hierarchical outlines
2. **Public APIs**: Identify exported functions, classes, and interfaces
3. **Business Logic**: Search for core business functions using `grep` or `ast_grep`
4. **Data Models**: Analyze models, schemas, and data structures

## Module Relationships Mapping

1. **Import/Export Analysis**: Use `lsp_find_references` to trace dependencies
2. **Call Graphs**: Map function calls between modules
3. **Data Flow**: Identify how data moves between components
4. **Architecture Patterns**: Recognize MVC, layered, microservices, etc.

## Process Flow Analysis

1. **Entry Points**: Trace from main entry to key functions
2. **User Flows**: Identify user interaction paths
3. **Data Processing**: Map data transformation pipelines
4. **Error Handling**: Analyze exception flows and error recovery

## Tools and Techniques

### Primary Tools
- `glob`: File discovery and categorization
- `grep`/`ast_grep`: Pattern-based code search
- `lsp_document_symbols`: File structure analysis
- `lsp_find_references`: Dependency tracing
- `lsp_goto_definition`: Symbol navigation

### Advanced Analysis
- `explore` agent: Contextual codebase understanding
- `librarian` agent: External library documentation
- `oracle` agent: Architecture guidance

## Resources

### scripts/
- `analyze_structure.py`: Automated directory and file analysis
- `generate_module_graph.py`: Creates visual module relationship graphs

### references/
- `analysis-patterns.md`: Common analysis techniques and patterns
- `architecture-examples.md`: Examples of different architecture types

### assets/
- `graph-template.dot`: Template for generating module relationship diagrams
- `analysis-report-template.md`: Template for structured analysis reports

