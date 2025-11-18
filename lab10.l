%{
    #include "lab11.tab.h"
    #include<string.h>
%}

%%
"int"                   {return INT;}
"float"                 {return FLOAT;}
"char"                  {return CHAR;}
[a-zA-z_][a-zA-z0-9]*   {yylval.str = strdup(yytext); return ID;}
[ \n\t]+                {/*    skip whitespace */}
.                       {return yytext[0];}
%%

int yywrap() {
    return 1;
}