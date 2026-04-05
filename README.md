# Postfix Expression Interpreter

This repository contains Lex and Yacc based tools for converting and calculating mathematical expressions. 

It explores the different forms of mathematical expressions: infix, prefix, and postfix, and provides small Lex/Yacc applications for parsing and evaluating them.

## Folders

1. **infix to prefix**: Contains a tool (despite the folder name, based on the `.y` file content, it seems to be converting `infix` to `postfix` by constructing the string with operator at the end) to convert infix expressions to postfix format.
2. **postfix calculator**: Contains a tool to evaluate a postfix mathematical expression and compute its final integer result.
3. **postfix to prefix**: Contains a tool to convert postfix expressions into prefix format.

## General Build Instructions

For any of the tools, ensure you have `flex` (or `lex`) and `bison` (or `yacc`) installed. You can compile the tools generally by entering their respective directories and running:

```bash
lex <file>.l
yacc -d <file>.y
cc lex.yy.c y.tab.c -o POSTFIX -ll
```

Then execute the program:
```bash
./POSTFIX
```
