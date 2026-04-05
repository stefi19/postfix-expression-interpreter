%{
#include <stdio.h>
void init (char *str);
int yylex(void);
void yyerror(const char *s) { fprintf(stderr, "Error: %s\n", s);}
%}

%union {
    char *str;
}

%left '+' '-'
%left '*' '/'
%right '^'
%left MINUSUNAR

%token <str> NUMBER VAR //define the terminal symbols
%type <str> expr //define the non-terminals expression statement

%%

file: file expr '\n' {printf("%s\n", $2);}
| file '\n'
|
;

expr: expr '+' expr {init($$); sprintf($$, "%s %s +", $1, $3);}
| expr '-' expr {init($$); sprintf($$, "%s %s -", $1, $3);}
| expr '*' expr {init($$); sprintf($$, "%s %s *", $1, $3);}
| expr '/' expr {init($$); sprintf($$, "%s %s /", $1, $3);}
| expr '^' expr {init($$); sprintf($$, "%s %s ^", $1, $3);}
| '-' expr %prec MINUSUNAR {init($$); sprintf($$, "%s %s -", $2, $2);}
| '(' expr ')' {$$=$2;}
| NUMBER
| VAR
;

%%
void init (char *str) {
    str = (char *)malloc(100 * sizeof(char));
}
