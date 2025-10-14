%{
    #include <stdio.h>
%}

%%

abb(a|b)*            { printf("Matiched 'abb': %s\n", yytext); }
a*b+                 { printf("Matiched 'a*b+' : %s\n", yytext); }
a+                   { printf("Matiched 'a+': %s\n", yytext); }
[ \n\t]+             { /* Skip Whitespace */ }
.                    { printf("Invalid Input : %s\n", yytext); }

%%

int main() {
    printf("Enter Input : ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
