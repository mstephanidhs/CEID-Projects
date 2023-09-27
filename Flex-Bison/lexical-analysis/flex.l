%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "bison.tab.h"

int lineno = 1;
void t_print();
extern void yyerror(char *message);
%}

%option noyywrap
%option yylineno

%x STATE_ONELINE_COMMENT
%x STATE_MULTILINE_COMMENT

letter	[a-zA-Z]|[0-9]
digit	[0-9]
pos_int {digit}+
ID	_*[a-zA-Z_][0-9a-zA-Z_]*

%%


"PROGRAM"	{t_print(); return T_PROGRAM;}	
"FUNCTION"	{t_print(); return T_FUNCTION;}
"VARS"		{t_print(); return T_VARS;}
"INT"		{t_print(); return T_INT;}
"CHAR"		{t_print(); return T_CHAR;}
"WHILE"		{t_print(); return T_WHILE;}
"ENDWHILE"	{t_print(); return T_ENDWHILE;}
"FOR"		{t_print(); return T_FOR;}
"counter"	{t_print(); return T_COUNTER;}
"TO"		{t_print(); return T_TO;}
"STEP"		{t_print(); return T_STEP;}
"ENDFOR"	{t_print(); return T_ENDFOR;}
"IF"		{t_print(); return T_IF;}
"THEN"		{t_print(); return T_THEN;}
"ELSEIF"	{t_print(); return T_ELSEIF;}
"ELSE"		{t_print(); return T_ELSE;}
"ENDIF"		{t_print(); return T_ENDIF;}
"SWITCH"	{t_print(); return T_SWITCH;}
"CASE"		{t_print(); return T_CASE;}
"DEFAULT"	{t_print(); return T_DEFAULT;}
"ENDSWITCH"	{t_print(); return T_ENDSWITCH;}
"PRINT"		{t_print(); return T_PRINT;}
"BREAK"		{t_print(); return T_BREAK;}
"RETURN"	{t_print(); return T_RETURN;}
"END_FUNCTION"	{t_print(); return T_ENDFUNCTION;}	
"STARTMAIN"	{t_print(); return T_STARTMAIN;}	
"ENDMAIN"	{t_print(); return T_ENDMAIN;}
"STRUCT"	{t_print(); return T_STRUCT;}
"ENDSTRUCT"	{t_print(); return T_ENDSTRUCT;}
"TYPEDEF"	{t_print(); return T_TYPEDEF;}

\"(\\.|[^\\"\n])*\"	{t_print(); return T_STRING;}
\'(\\.|[^\\"\n])\'	{t_print(); return T_CHARACT;}

"="	{t_print(); return T_ASSIGN;}
";"	{t_print(); return T_SEMI;}
"("	{t_print(); return T_LPAREN;}
")"	{t_print(); return T_RPAREN;}
":"	{t_print(); return T_COLON;}
"["	{t_print(); return T_LBRACK;}
"]"	{t_print(); return T_RBRACK;}
"+"|"-"	{t_print(); return T_ADDOP;}	
"{"	{t_print(); return T_LBRACE;}
"}"	{t_print(); return T_RBRACE;}
","	{t_print(); return T_COMMA;}

"^"|"*"|"/"	{t_print(); return T_MULOP;}
"=="|"!="	{t_print(); return T_EQOP;}
">"|"<"		{t_print(); return T_RELOP;}
"AND"|"OR"	{t_print(); return T_LOGOP;}
\n|\r\n|\r	{printf("\n"); lineno++;}
"\t"		{printf("\t");}
""		{printf(" ");}

{pos_int}	{t_print(); return T_NUMBER;}
{ID}		{t_print(); yylval.strval = strdup(yytext); return T_ID;}


"%"					{BEGIN(STATE_ONELINE_COMMENT);}
<STATE_ONELINE_COMMENT>.		{}
<STATE_ONELINE_COMMENT>\n|\r\n|\r	{BEGIN(INITIAL); lineno++;}

"/*"					{BEGIN(STATE_MULTILINE_COMMENT);}
<STATE_MULTILINE_COMMENT>\n|\r\n|\r	{lineno++;}
<STATE_MULTILINE_COMMENT>.		{}
<STATE_MULTILINE_COMMENT>"*/"		{BEGIN(INITIAL);}

.		{yyerror("Wrong token");}
<<EOF>>		{t_print(); return T_EOF;}

%%

void t_print()
{
	printf("%s", yytext);
}
