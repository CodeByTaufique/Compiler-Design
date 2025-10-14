%{
    #include <stdio.h>
    int word_count = 0;
    int char_count = 0;
%}

%%

[a-zA-Z0-9]+         { word_count++; char_count=char_count+yyleng; }   /* Count words and their length */
[^a-zA-Z0-9]+        { /* ignore everything else */}  /* Invalid characters */
%%

int main() {
    printf("Enter Input : ");
    yylex();
    printf("\nTotal Words : %d\n", word_count);
    printf("\nTotal Characters : %d\n", char_count);
    return 0;
}

int yywrap() {
    return 1;
}
