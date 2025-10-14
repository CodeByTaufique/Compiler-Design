%{
#include <stdio.h>
int keyword_count=0;
int identifiers_count=0;
int operators_count=0;
int numbers_count=0;
int delimeter_count=0;
%}

%%
"if"|"else"|"while"|"int"|"float"|"break"|"continue"        { keyword_count++;  printf("Keyword : %s\n", yytext);}
"=="|"<="|">="|"!="|"<"|">"|"="|"++"|"--"|"+"|"-"|"*"|"/"   { operators_count++; printf("Operator : %s\n", yytext);}

[a-zA-Z_][a-zA-Z0-9]*           { identifiers_count++; printf("Identifiers : %s\n", yytext); }
[0-9]+\.[0-9]+                  { numbers_count++; printf("Numbers : %s\n", yytext); }   
[0-9]+                          { numbers_count++; printf("Numbers : %s\n", yytext); } 
[;,\{\}\(\)]                    { delimeter_count++; printf("Delimeters : %s\n", yytext); } 
[ \t\n]+                        { /* skip whitespace */ }
.                               { printf("Invalid Input : %s\n", yytext); }
%%

int main() {
    printf("Enter Input : ");
    yylex();

    printf("\nKeyword Count: %d", keyword_count);
    printf("\nIdentifier Count: %d", identifiers_count);
    printf("\nOperator Count: %d", operators_count);
    printf("\nNumber Count: %d", numbers_count);
    printf("\nDelimiter Count: %d\n", delimeter_count);

    return 0;
}

int yywrap() {
    return 1;
}
