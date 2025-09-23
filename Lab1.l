%{
    #include<stdio.h>
%}

%%

"if"                { printf("Keyword : %s\n", yytext); }
"else"              { printf("Keyword : %s\n", yytext); }
"while"|"for"       { printf("Keyword : %s\n", yytext); }

[a-zA-Z_][a-zA-Z0-9]*   { printf("Identifier : %s\n", yytext); }
[ \n\t]             { /* Skip Whitespace */ }
[0-9]+              {printf("Integer : %s\n", yytext);}
.                   { printf("Invalid Input : %s\n", yytext); }


%%

int main() {
    printf("Enter Input : ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
