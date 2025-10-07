%{
#include <stdio.h>
%}

%%
"if"                { printf("Keyword : %s\n", yytext); }
"else"              { printf("Keyword : %s\n", yytext); }
"while"             { printf("Keyword : %s\n", yytext); }
"int"               { printf("Keyword : %s\n", yytext); }
"float"             { printf("Keyword : %s\n", yytext); }
"break"             { printf("Keyword : %s\n", yytext); }
"continue"          { printf("Keyword : %s\n", yytext); }

"=="|"<="|">="|"!="|"<"|">"     { printf("Relational Operator : %s\n", yytext); }
"="                             { printf("Assignment Operator : %s\n", yytext); }
"++"|"--"|"+"|"-"|"*"|"/"       { printf("Arithmetic Operator : %s\n", yytext); }



[a-zA-Z_][a-zA-Z0-9]*           { printf("Identifier : %s\n", yytext); }
[0-9]+                          { printf("Integer : %s\n", yytext); }
[0-9]+\.[0-9]+  { printf("Float : %s\n", yytext); }
[;,\{\}\(\)]                    { printf("Delimeter : %s\n", yytext); }
[ \t\n]                         { /* skip whitespace */ }
.                               { printf("Invalid Input : %s\n", yytext); }
%%

int main() {
    printf("Enter Input : ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
