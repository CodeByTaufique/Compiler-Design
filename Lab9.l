%{
#include <stdio.h>
%}

%%

\"[^\"]*\"        { printf("Double-quoted string: %s\n", yytext); }
\'[^\']*\'        { printf("Single-quoted string: %s\n", yytext); }
[ \t\n]           { /* skip whitespace */ }
.                 { /* ignore other characters */ }

%%

int main() {
    printf("Enter Input: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
