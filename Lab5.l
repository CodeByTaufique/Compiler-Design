%{
#include <stdio.h>
%}

%%
"//".*                          { /* ignore single line comment */ }

"/*"([^*]|\n)*"*/"               { /* ignore multi line comment */ }
[ \t\n]                         { /* skip whitespace */ }
.                               { printf("%s", yytext); }
%%



int main() {
    printf("Enter Input : ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
