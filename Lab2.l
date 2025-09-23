%{
    #include<stdio.h>
%}

%%


[ \n\t]             { /* Skip Whitespace */ }
[0-9]+              {printf("Integer : %s\n", yytext);}
[0-9]+\.[0-9]+             {printf("Float : %s\n", yytext);}
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
