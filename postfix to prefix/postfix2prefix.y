%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void init(char **str);
int yylex(void);
void yyerror(const char *s) { fprintf(stderr, "Error: %s\n", s); }
%}

%union {
    char *str;
}

%token <str> NUMBER VAR
%type <str> expr

%%

file:
      file expr '\n' { printf("%s\n", $2); }
    | file '\n'
    |
    ;

expr:
      expr expr '+' { init(&$$); sprintf($$, "+ %s %s", $1, $2); }
    | expr expr '-' { init(&$$); sprintf($$, "- %s %s", $1, $2); }
    | expr expr '*' { init(&$$); sprintf($$, "* %s %s", $1, $2); }
    | expr expr '/' { init(&$$); sprintf($$, "/ %s %s", $1, $2); }
    | expr expr '^' { init(&$$); sprintf($$, "^ %s %s", $1, $2); }
    | NUMBER        { $$ = strdup($1); }
    | VAR           { $$ = strdup($1); }
    ;

%%

void init(char **str) {
    *str = (char *)malloc(100 * sizeof(char));
}
