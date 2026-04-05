# Infix to Postfix Converter

This folder contains a Lex and Yacc based converter that translates infix expressions into postfix notation.

## Files

- `postfix.l`: Lex file for tokenizing the infix expression.
- `postfix.y`: Yacc/Bison file with grammar rules to parse the tokenized input and output the postfix expression.

## Build and Run

You can build this project using flex and bison:

```bash
lex postfix.l
yacc -d postfix.y
cc lex.yy.c y.tab.c -o POSTFIX -ll
```

Run the resulting executable:
```bash
./POSTFIX
```
You can type expressions like `2 + 3 * 4` and it will output `2 3 4 * +`.
