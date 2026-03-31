%option noyywrap

%{
/* −−−−−−−−−−−−−−−−−−−−−−−−−− Definitions −−−−−−−−−−−−−−−−−−−−−−−−−− */
#include<stdio.h>
%}

delim [ \t\n]
ws {delim}+
digit [0-9]
letter [A-Za-z]
other .


%%
%{
/* −−−−−−−−−−−−−−−−−−−−−−−−−−−−− Rules −−−−−−−−−−−−−−−−−−−−−−−−−−−−− */
%}
{digit} { fprintf(yyout,"%d (DIGIT)\n",atoi(yytext)); }
{letter} { fprintf(yyout,"%s (LETTER)\n",yytext); }
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
