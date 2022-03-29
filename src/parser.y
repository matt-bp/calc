/* simplest version of calculator */
%{
#include <iostream>

extern int yylex();
void yyerror(const char*);
%}

/* declare tokens */
%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL

%%

calclist
  : /* nothing */                         // matches at beginning of input
  | calclist exp EOL { std::cout << "= " << $2 << std::endl; }   // EOL is end of an expression
  ;

exp
  : factor //default $$ = $1 
  | exp ADD factor { $$ = $1 + $3; }
  | exp SUB factor { $$ = $1 - $3; }
  ;

factor
  : term //default $$ = $1 
  | factor MUL term { $$ = $1 * $3; }
  | factor DIV term { $$ = $1 / $3; }
  ;

term
  : NUMBER //default $$ = $1 
  | ABS term   { $$ = $2 >= 0? $2 : - $2; }
  ;

%%

void yyerror(const char *msg)
{
  std::cerr << "From Parser: " <<  msg << std::endl;
}