/* recognize tokens for the calculator and print them out */
%{
#include "parser.hpp" // Has tokens defined
#include <iostream>
#include <string>
%}

/* Removes -lfl */
%option noyywrap

%%

"+"    { return ADD; }
"-"    { return SUB; }
"*"    { return MUL; }
"/"    { return DIV; }
"|"    { return ABS; }
[0-9]+ { yylval = std::stoi(yytext); return NUMBER; }
\n     { return EOL; }
[ \t]  { /* ignore whitespace */ }
.      { std::cout << "Mystery character " << *yytext << std::endl; }

%%
