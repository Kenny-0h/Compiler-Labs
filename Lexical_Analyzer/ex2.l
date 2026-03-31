%option noyywrap yylineno

%{
/* −−−−−−−−−−−−−−−−−−−−−−−−−− Definitions −−−−−−−−−−−−−−−−−−−−−−−−−− */
#include<stdio.h>
int column = 1;
%}

delim [ \t\n]
ws {delim}+
comment ("//".*)|("/*".*"*/")
digit [0-9]
number {digit}+(\.{digit}+)?
letter [A-Za-z]
other .


%%
%{
/* −−−−−−−−−−−−−−−−−−−−−−−−−−−−− Rules −−−−−−−−−−−−−−−−−−−−−−−−−−−−− */
%}
{digit} { fprintf(yyout,"%d (DIGIT)\n",atoi(yytext)); column+=yyleng; }
{number} { fprintf(yyout,"%s (NUMBER)\n",yytext); column+=yyleng; }
{letter} { fprintf(yyout,"%s (LETTER)\n",yytext); column+=yyleng; }
"+" { fprintf(yyout,"PLUS\n"); column+=yyleng;}
"-" { fprintf(yyout,"MINUS\n"); column+=yyleng;}
\n { column = 1; }
{ws} {}
{comment} {}
{other} { fprintf(yyout, "Lexical error in line %d, and column %d. Input -> \"%s\"\n", yylineno, column, yytext); }


%%
/* −−−−−−−−−−−−−−−−−−−−−−−− User subrotines −−−−−−−−−−−−−−−−−−−−−−−− */
int main(int argc, char *argv[]){
    yyin = fopen(argv[1], "r");
    yyout=stdout;
    yylex();
    fclose(yyin);
    return 0;
}
