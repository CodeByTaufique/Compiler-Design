%{
    #include "bool.tab.h"
    #include<stdio.h>
%}

%%

"&&"                {return AND; }
"||"                {return OR;  }
"!"                 {return NOT; }
"("                 {return '('; }
")"         { return ')'; }

[0-1]               {yylval.num = atoi(yytext); return BOOL;}
[ \t]               {/*         ignore whitespace         */}
\n                  { return '\n'; }

.                   { printf("Unknown character: %s\n", yytext); }


%%

int yywrap() {
    return 1;
}