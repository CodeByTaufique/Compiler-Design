%{
    #include<stdio.h>
    #include<string.h>
    #include<stdlib.h>
    void yyerror(const char *s);
    int yylex(void);
%}

%union {
    char* str;    // Name will be same
   // int val;  for int 
}

%token <str> ID
%token INT FLOAT CHAR

%%
program: 
        elements 
        ;

elements:
        elements element
        | element
        ;
element:
        INT ID              { printf("Found int Variable : %s\n", $2); free($2);}
        | FLOAT ID          { printf("Found float Variable : %s\n", $2); free($2);}
        | CHAR ID           { printf("Found Charcter Variable : %s\n", $2); free($2);}
        ;
%%

void yyerror(const char *s) {
    printf("Syntax Error: %s\n",s);
}

int main() {
    return yyparse();
    return 0;
}