%option noyywrap

%{
/* −−−−−−−−−−−−−−−−−−−−−−−−−− Definitions −−−−−−−−−−−−−−−−−−−−−−−−−− */
#include<stdio.h>
%}

delim [,:;.]
blank [ \t\n]
ws {blank}+
letter [A-Za-z]
name {letter}+
id {letter}({letter}|{digit})*
func "_"{letter}({letter}|{digit})*
var "$"{letter}({letter}|{digit})*
text \"[^\"]*\"
digit [0-9]
number "-"?{digit}+
comment \#[^\#]*\#
other .


%%
%{
/* −−−−−−−−−−−−−−−−−−−−−−−−−−−−− Rules −−−−−−−−−−−−−−−−−−−−−−−−−−−−− */
%}

{ws} {}

%{
/* −−−−−−−−−−−−−−−−−−−−−−−−−−−−− 00 - DELIMITADOR −−−−−−−−−−−−−−−−−−−−−−−−−−−−− */
%}
{delim} { fprintf(yyout, "%s (DELIMITADOR)\n", yytext); }

%{
/* −−−−−−−−−−−−−−−−−−−−−−−−−−−−− 01 - OPERADOR RELACIONAL −−−−−−−−−−−−−−−−−−−−−−−−−−−−− */
%}
">=" { fprintf(yyout, "GE (OPERADOR_RELACIONAL)\n"); }
"<=" { fprintf(yyout, "LE (OPERADOR_RELACIONAL)\n"); }
">" { fprintf(yyout, "GT (OPERADOR_RELACIONAL)\n"); }
"<" { fprintf(yyout, "LT (OPERADOR_RELACIONAL)\n"); }
"=" { fprintf(yyout, "EQ (OPERADOR_RELACIONAL)\n"); }

%{
/* −−−−−−−−−−−−−−−−−−−−−−−−−−−−− 02 - OPERADOR ARITIMÉTICO −−−−−−−−−−−−−−−−−−−−−−−−−−−−− */
%}
"+" { fprintf(yyout, "PLUS (OPERADOR_ARITMETICO)\n"); }
"-" { fprintf(yyout, "MINUS (OPERADOR_ARITMETICO)\n"); }
"/" { fprintf(yyout, "DIV (OPERADOR_ARITMETICO)\n"); }
"*" { fprintf(yyout, "MUL (OPERADOR_ARITMETICO)\n"); }
"sqrt" { fprintf(yyout, "SQRT (OPERADOR_ARITMETICO)\n"); }
"sqr" { fprintf(yyout, "SQR (OPERADOR_ARITMETICO)\n"); }
"sin" { fprintf(yyout, "SIN (OPERADOR_ARITMETICO)\n"); }
"cos" { fprintf(yyout, "COS (OPERADOR_ARITMETICO)\n"); }
"tan" { fprintf(yyout, "TAN (OPERADOR_ARITMETICO)\n"); }

%{
/* −−−−−−−−−−−−−−−−−−−−−−−−−−−−− 03 - PALAVRA RESERVADA −−−−−−−−−−−−−−−−−−−−−−−−−−−−− */
%}
"begin" { fprintf(yyout, "BEGIN (PALAVRA_RESERVADA)\n"); }
"endif" { fprintf(yyout, "ENDIF (PALAVRA_RESERVADA)\n"); }
"end" { fprintf(yyout, "END (PALAVRA_RESERVADA)\n"); }
"for" { fprintf(yyout, "FOR (PALAVRA_RESERVADA)\n"); }
"do" { fprintf(yyout, "DO (PALAVRA_RESERVADA)\n"); }
"if" { fprintf(yyout, "IF (PALAVRA_RESERVADA)\n"); }
"then" { fprintf(yyout, "THEN (PALAVRA_RESERVADA)\n"); }
"elseif" { fprintf(yyout, "ELSEIF (PALAVRA_RESERVADA)\n"); }
"else" { fprintf(yyout, "ELSE (PALAVRA_RESERVADA)\n"); }
"while" { fprintf(yyout, "WHILE (PALAVRA_RESERVADA)\n"); }
"repeat" { fprintf(yyout, "REPEAT (PALAVRA_RESERVADA)\n"); }
"until" { fprintf(yyout, "UNTIL (PALAVRA_RESERVADA)\n"); }

%{
/* −−−−−−−−−−−−−−−−−−−−−−−−−−−−− 04 - TIPO DADO −−−−−−−−−−−−−−−−−−−−−−−−−−−−− */
%}
"integer" { fprintf(yyout, "INTEGER (TIPO_DADO)\n"); }
"real" { fprintf(yyout, "REAL (TIPO_DADO)\n"); }
"float" { fprintf(yyout, "FLOAT (TIPO_DADO)\n"); }
"double" { fprintf(yyout, "DOUBLE (TIPO_DADO)\n"); }
"char" { fprintf(yyout, "CHAR (TIPO_DADO)\n"); }
"string" { fprintf(yyout, "STRING (TIPO_DADO)\n"); }
"boolean" { fprintf(yyout, "BOOLEAN (TIPO_DADO)\n"); }

%{
/* −−−−−−−−−−−−−−−−−−−−−−−−−−−−− 05 - FUNCAO −−−−−−−−−−−−−−−−−−−−−−−−−−−−− */
%}
{func} { fprintf(yyout, "%s (FUNCAO)\n", yytext); }

%{
/* −−−−−−−−−−−−−−−−−−−−−−−−−−−−− 06- VARIAVEL −−−−−−−−−−−−−−−−−−−−−−−−−−−−− */
%}
{var} { fprintf(yyout, "%s (VARIAVEL)\n", yytext); }

%{
/* −−−−−−−−−−−−−−−−−−−−−−−−−−−−− 07- TEXTO −−−−−−−−−−−−−−−−−−−−−−−−−−−−− */
%}
{text} { fprintf(yyout, "%s (TEXTO)\n", yytext); }

%{
/* −−−−−−−−−−−−−−−−−−−−−−−−−−−−− 08- NUMERO −−−−−−−−−−−−−−−−−−−−−−−−−−−−− */
%}
{number} { fprintf(yyout, "%d (NUMERO)\n", atoi(yytext)); }

%{
/* −−−−−−−−−−−−−−−−−−−−−−−−−−−−− 09- NOME −−−−−−−−−−−−−−−−−−−−−−−−−−−−− */
%}
{name} { fprintf(yyout, "%s (NAME)\n", yytext); }

%{
/* −−−−−−−−−−−−−−−−−−−−−−−−−−−−− 10- COMENTARIO −−−−−−−−−−−−−−−−−−−−−−−−−−−−− */
%}
{comment} { fprintf(yyout, "%s (COMENTARIO)\n", yytext); }

%{
/* −−−−−−−−−−−−−−−−−−−−−−−−−−−−− 99- INVALIDO −−−−−−−−−−−−−−−−−−−−−−−−−−−−− */
%}
{other} { fprintf(yyout, "%s (INVALIDO)\"\n", yytext); }


%%
/* −−−−−−−−−−−−−−−−−−−−−−−− User subrotines −−−−−−−−−−−−−−−−−−−−−−−− */
int main(int argc, char *argv[]){
    yyin = fopen(argv[1], "r");
    yyout=stdout;
    yylex();
    fclose(yyin);
    return 0;
}
