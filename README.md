# Compiler-Labs
Repository with assignments, projects, and implementations from a Compilers course, including lexical analysis, parsing, and code generation.

# Repository Stucture-Tree
```
compiler-labs/
├── README.md
├── .gitignore
├── Lexical_Analyzer/
│   ├── ex1.l
└   └── ex2.l
```

## Lexical_Analyzer

This directory contains `.l` files related to practical assignments and studies on lexical analysis using the Flex tool.

**ex1.l:** A lexical analyzer that recognizes numeric digits and alphabetic characters while ignoring any whitespace (spaces, tabs, and newline characters). Any unrecognized input results in a lexical error.

**ex2.l:** A lexical analyzer that recognizes integer and floating-point numbers, as well as the `+` and `-` operators. It ignores both single-line and multi-line comments, along with whitespace (spaces, tabs, and newlines). Any invalid input triggers a lexical error, which reports the invalid lexeme along with its position (line and column).
