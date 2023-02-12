%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
%}

%token LPAREN RPAREN LBRACKET RBRACKET
%token NUM


%left MINUS PLUS
%left MULTI DIV
%left NEG


%start repl

%%  

repl: { printf("icalc: "); }
         | repl input '\n'
         | repl error '\n' { yyerrok; printf("icalc: "); }
         ;

input:   expr { printf("%d \nicalc: ", $1); }
         ;

expr:      expr PLUS expr 		{ $$ = $1 + $3; }
         | expr MINUS expr        { $$ = $1 - $3;    }
         | expr MULTI expr 		{ $$ = $1 * $3; }
         | expr DIV expr 		{ $$ = $1 / $3; }
         | MINUS expr  %prec NEG { $$ = -$2;}
         | LPAREN expr RPAREN           { $$ = $2; }
	     | NUM 				{ $$ = $1; } 
          
	 ;

%% 

int yyerror (char* msg) { fprintf(stderr, "%s\n", msg); }
int yywrap () 		{ fprintf(stderr, "exiting...\n"); return (1); }


int main () { 
    printf("Welcome to iCalc. Use <ctrl-d> to exit.\n");
 
    yyparse();
}

