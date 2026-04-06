%option noyywrap

%{
/* −−−−−−−−−−−−−−−−−−−−−−−−−− Definitions −−−−−−−−−−−−−−−−−−−−−−−−−− */
#include<stdio.h>
%}

delim [ \t\n]
ws {delim}+
digit [0-9]
num ("+"|"-")?{digit}+("."{digit}+)?("E"("+"|"-")?{digit}+)?
other .


%%
%{
/* −−−−−−−−−−−−−−−−−−−−−−−−−−−−− Rules −−−−−−−−−−−−−−−−−−−−−−−−−−−−− */
%}
{num} { fprintf(yyout, "%s (NUMBER)\n", yytext); }
{ws} {}
{other} { fprintf(yyout, "Lexical error. Input -> \"%s\"\n", yytext); }


%%
/* −−−−−−−−−−−−−−−−−−−−−−−− User subrotines −−−−−−−−−−−−−−−−−−−−−−−− */
int main(int argc, char *argv[]){
    yyin = fopen(argv[1], "r");
    yyout=stdout;
    yylex();
    fclose(yyin);
    return 0;
}
