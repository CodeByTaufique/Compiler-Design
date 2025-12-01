%{
    #include<stdio.h>
    #include<string.h>
    #include<stdlib.h>
    void yyerror(const char* s);
    int yylex(void);
%}

%union {
    char* str;
}

%token <str> KEYWORD
%token <str> ID

%%

program 
      : start
        ;

start 
    : start token 
    | token 
    ;

token
    : KEYWORD          { printf("Keyword: %s\n", $1); free($1); }
    | ID               { printf("Identifier: %s\n", $1); free($1); }
    ;

%%

void yyerror(const char* s) {
     printf("Error: %s\n", s);
}

int main() {
    printf("Enter Input : ");
    yyparse();
    return 0;
}
