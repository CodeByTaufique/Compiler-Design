%{
    #include "calc.tab.h"
%}

%%               
[0-9]+          {yylval.num = atoi(yytext); return NUM;}        // atoi -----> ASCII to INT
[ \t]+          {/*         ignore                   */}
\n              {return '\n';}
.               {return yytext[0];}

%%

int yywrap() {
    return 1;
}