%{
#include <stdio.h>
#include <stdlib.h>

//prototypes of the functions from user subroutines
int sum(int a,int b);
int sub(int a,int b);
int mul(int a,int b);
int divide_int(int a,int b);
int mod_int(int a,int b);
int power_int(int a,int b);
int minus_unar(int a);

int yylex(void);
void yyerror(const char *s){ fprintf(stderr,"Error: %s\n",s); }
%}

%union{
    int ival;
}

//defining the symbols
%token <ival> NUMBER

//defining non-terminals
%type <ival> expr form

%%

file:
    | file form '\n' { printf("%d\n",$2); }
    | file '\n'
    ;

form:
      expr { $$=$1; }
    ;

expr:
      NUMBER { $$=$1; }
    | expr expr '+' { $$=sum($1,$2); }
    | expr expr '-' { $$=sub($1,$2); }
    | expr expr '*' { $$=mul($1,$2); }
    | expr expr '/' { $$=divide_int($1,$2); }
    | expr expr '%' { $$=mod_int($1,$2); }
    | expr expr '^' { $$=power_int($1,$2); }
    | expr '~' { $$=minus_unar($1); }
    ;

%%

int sum(int a,int b)
{
    return a+b;
}

int sub(int a,int b)
{
    return a-b;
}

int mul(int a,int b)
{
    return a*b;
}

int divide_int(int a,int b)
{
    if(b==0)
    {
        printf("division by zero\n");
        exit(1);
    }
    return a/b;
}

int mod_int(int a,int b)
{
    if(b==0)
    {
        printf("modulo by zero\n");
        exit(1);
    }
    return a%b;
}

int power_int(int a,int b)
{
    int i;
    int result=1;
    for(i=0;i<b;i++)
    {
        result=result*a;
    }
    return result;
}

int minus_unar(int a)
{
    return -a;
}

int main()
{
    yyparse();
    return 0;
}