%{
    #include<stdio.h>
%}

%%

[ \n\t]    { /* Skip Whitespace */ }

[a-zA-Z0-9%+_-]+@(gmail|hmail|yahoo|diu)\.(com|edu)\.(bd|us|usa) {
    printf("Email : %s\n", yytext);
}

.          { printf("Invalid Input : %s\n", yytext); }

%%

int main() {
    printf("Enter Input : ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
