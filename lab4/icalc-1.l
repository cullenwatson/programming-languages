%{


#include <stdio.h>
#include "y.tab.h"

extern int yylval;

%}

%%

"+"	  { return PLUS; }
"-"	  { return MINUS; }
"*"	  { return MULTI; }
"/"	  { return DIV; }


"("	  { return LPAREN; }
")"	  { return RPAREN; }

[0-9]+    { 
            yylval = atoi(yytext); 
 	    return NUM; 
           }

[ \t\f\v]+	  { }

[^0-9+\-*/()]  { 
	            return yytext[0];
	        }		
