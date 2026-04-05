# Postfix to Prefix Converter

This folder contains a Lex and Yacc based converter that translates postfix expressions into prefix notation.

## Files

- `postfix2prefix.l`: Lex file for tokenizing the postfix expression.
- `postfix2prefix.y`: Yacc/Bison file with grammar rules to parse the tokenized input and output the prefix expression.

## Build and Run

You can build this project using flex and bison:

```bash
lex postfix2prefix.l
yacc -d postfix2prefix.y
cc lex.yy.c y.tab.c -o POSTFIX -ll
```

Run the resulting executable:
```bash
./POSTFIX
```
You can type expressions like `2 3 4 * +` and it will output `+ 2 * 3 4`.
