%{
    #include "commandLine.tab.h"
    #include <string.h>
    #include <stdlib.h>
%}

%%
"print"             { return PRINT; }
"set"               { return SET; }
"to"                { return TO; }
"add"               { return ADD; }
"and"               { return AND; }
"exit"              { return EXIT; }

[0-9]+              { yylval.num = atoi(yytext); return NUM; }

[a-zA-Z0-9]+        { yylval.str = strdup(yytext); return STR; }

[ \n\t]+            { /* ignore */ }

.                   { return yytext[0]; }

%%

int yywrap() {
    return 1;
}
