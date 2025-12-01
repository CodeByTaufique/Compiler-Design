%{
    #include<stdio.h>
    #include<string.h>
    #include<stdlib.h>
    void yyerror(const char* s);
    int yylex(void);
%}

%union {
   int num;
};

%token <num> BOOL
%token AND OR NOT

%left AND
%left OR 
%right NOT

%type <num> expr

%%

program
        : input
        ;
input
        : input expr '\n'       {printf("%d\n",$2);}
        | /* empty */
        ;
expr
    : BOOL           { $$ = $1; }
    | expr AND expr  { $$ = $1 && $3; }
    | expr OR expr   { $$ = $1 || $3; }
    | NOT expr       { $$ = !$2; }
    | '(' expr ')'   { $$ = $2; }
    ;

%%

void yyerror(const char* s) {
     printf("Error: %s\n", s);
}

int main() {
    printf("Enter Input : ");
    return yyparse();
    return 0;
}
