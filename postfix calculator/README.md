# Postfix Calculator

This folder contains a Lex and Yacc based interpreter that calculates the result of postfix expressions.

## Files

- `postfixexecute.l`: Lex file for tokenizing the postfix expression.
- `postfixexecute.y`: Yacc/Bison file with grammar rules that calculate the operations during finding matching patterns.

## Build and Run

You can build this project using flex and bison:

```bash
lex postfixexecute.l
yacc -d postfixexecute.y
cc lex.yy.c y.tab.c -o POSTFIX -ll
```

Run the resulting executable:
```bash
./POSTFIX
```
You can type postfix expressions like `2 3 +` and it will output `5`.
