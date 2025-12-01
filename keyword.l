%{
    #include "keyword.tab.h"
    #include<stdio.h>
    #include<string.h>
    #include<stdlib.h>
%}

%%

"int"                 { yylval.str = strdup(yytext); return KEYWORD; }
"float"               { yylval.str = strdup(yytext); return KEYWORD; }
"char"                { yylval.str = strdup(yytext); return KEYWORD; }
"double"              { yylval.str = strdup(yytext); return KEYWORD; }
"if"                  { yylval.str = strdup(yytext); return KEYWORD; }
"else"                { yylval.str = strdup(yytext); return KEYWORD; }
"while"               { yylval.str = strdup(yytext); return KEYWORD; }
"for"                 { yylval.str = strdup(yytext); return KEYWORD; }
"return"              { yylval.str = strdup(yytext); return KEYWORD; }
"void"                { yylval.str = strdup(yytext); return KEYWORD; }

[a-zA-Z_][a-zA-Z0-9]*   { yylval.str = strdup(yytext); return ID; }

[ \t\n]+                { /* skip whitespace */ }

.                       { return yytext[0]; }

%%

int yywrap() {
    return 1;
}
