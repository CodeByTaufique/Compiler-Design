%{
    #include<stdio.h>
    #include<string.h>
    #include<stdlib.h>
    void yyerror(const char *s);
    int yylex(void);
%}

%union {
    char* str;
    int num;
};

%token <num> NUM
%token <str> STR
%token PRINT SET ADD AND TO EXIT

%type <num> line
%type <num> lines
%type <num> program

%%

program
        : lines
        ;

lines
        : lines line
        | line
        ;

line
        : PRINT STR
            { printf("Printing....... %s\n", $2); free($2); }
        | SET NUM TO STR
            { printf("%s = %d\n", $4, $2); free($4); }
        | ADD NUM AND NUM
            { printf("SUM = %d\n", $2 + $4); }
        | EXIT
            { printf("Exit........\n"); exit(0); }
        ;

%%

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

int main() {
    printf("Command Line Interpreter\n");
    printf("Enter a command:\n");
    return yyparse();
}
