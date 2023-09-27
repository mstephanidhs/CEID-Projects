"%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include <unistd.h>
#include "symbol_table.h"

extern int lineno;
extern int yylex();
extern char *yytext;
extern FILE *yyin;
int cline = 0;

void yyerror(const char *message);

void putvar(char *var_name)
{
	variable *s;
	s = search(var_name);
	if (s == 0)
	{
		s = insert(var_name);
	}
	else
	{
		printf("\t%s is already defined.", var_name);
		exit(0);
	}
}

void checkvar(char *var_name)
{
	if (search(var_name) == 0)
	{
		printf("\t%s is an undeclared identifier.", var_name);
		exit(0);
	}
}

void checkline()
{
	if(cline==lineno)
	{
		yyerror("new line is required");
		exit(0);
	}
}

%}

%error-verbose

%union {
	int intval;
	char* strval;
}

%token T_PROGRAM		"PROGRAM"
%token T_FUNCTION		"FUNCTION"
%token T_VARS			"VARS"
%token T_ASSIGN 		"="
%token T_SEMI 			";"
%token T_LPAREN 		"("
%token T_RPAREN 		")"
%token T_WHILE 			"WHILE"
%token T_ENDWHILE 		"ENDWHILE"
%token T_FOR 			"FOR"
%token T_COUNTER 		"counter"
%token T_TO			"TO"
%token T_STEP			"STEP"
%token T_ENDFOR			"ENDFOR"
%token T_IF			"IF"
%token T_THEN			"THEN"
%token T_ELSEIF			"ELSEIF"
%token T_ELSE			"ELSE"
%token T_ENDIF			"ENDIF"
%token T_SWITCH			"SWITCH"
%token T_CASE			"CASE"
%token T_COLON			":"
%token T_DEFAULT		"DEFAULT"
%token T_ENDSWITCH		"ENDSWITCH"
%token T_PRINT			"PRINT"
%token T_LBRACK			"["
%token T_RBRACK			"]"
%token T_BREAK			"BREAK"
%token T_RETURN			"RETURN"
%token T_ENDFUNCTION 		"ENDFUNCTION"
%token T_STARTMAIN		"STARTMAIN"
%token T_ENDMAIN		"ENDMAIN"
%token T_ADDOP			"+|-"
%token T_LBRACE			"{"
%token T_RBRACE 		"}"
%token T_COMMA 			","
%token T_MULOP 			"^|*|/"
%token T_EQOP 			"==|!="
%token T_RELOP 			"<|>"
%token T_LOGOP 			"AND|OR"
%token T_EOF 			0
%token T_CHAR 			"CHAR"
%token T_INT 			"INT"
%token <strval>T_ID 		"identifier"
%token <intval>T_NUMBER 	"positive integer"
%token <strval>T_STRING 	"string"
%token <strval>T_CHARACT 	"character"
%token T_STRUCT 		"STRUCT"
%token T_ENDSTRUCT 		"ENDSTURCT"
%token T_TYPEDEF 		"TYPEDEF"

%left 		T_COMMA
%right 		T_ASSIGN
%left 		T_LOGOP
%left 		T_EQOP
%left 		T_RELOP
%left 		T_ADDOP
%left 		T_MULOP
%left 		T_LPAREN T_RPAREN T_LBRACK T_RBRACK

%start program_body

%%

program_body: program_declaration typedef_decl function main;

typedef_decl: T_STRUCT {checkline(); cline=lineno;} T_ID T_VARS {checkline();} vars
T_ENDSTRUCT
| T_TYPEDEF {checkline(); cline=lineno;} T_STRUCT T_ID T_VARS {checkline();} vars T_ID
T_ENDSTR
;

vars: variable T_SEMI
| variable T_SEMI vars
;

program_declaration: T_PROGRAM T_ID {cline=lineno;}
;

function:
|function_declaration variable_declaration {checkline();} stmts T_RETURN
arithmetic_expression T_SEMI T_ENDFUNCTION
;

function_declaration: T_FUNCTION {checkline();} T_ID T_LPAREN variables T_RPAREN
{cline=lineno;}
;

variables: variable
| variable T_COMMA variables
|
;

variable: type_specifier T_ID array_declaration {putvar($2);}
;

type_specifier: T_INT
| T_CHAR
;

array_declaration:
| T_LBRACK T_NUMBER T_RBRACK
;

variable_declaration: T_VARS {checkline();} variables T_SEMI
|
;

stmts: stmt stmts
| stmt
;

stmt: assignment
| while_stmt
| for_stmt
| if_stmt
| switch_stmt
| print_stmt
| T_BREAK
;

assignment: T_ID T_ASSIGN arithmetic_expression T_SEMI {checkvar($1);}
| T_ID T_ASSIGN T_CHARACT T_SEMI {checkvar($1);}
;

arithmetic_expression: value
| value arithmetic_operator arithmetic_expression
| T_LPAREN arithmetic_expression T_RPAREN
| T_ADDOP arithmetic_expression
;

value: T_NUMBER
| T_ID array_declaration {checkvar($1);}
;

arithmetic_operator: T_ADDOP
| T_MULOP
| T_RELOP
| T_EQOP
;

while_stmt: T_WHILE T_LPAREN logic_expression T_RPAREN stmts T_ENDWHILE;

logic_expression: arithmetic_expression
| logic_expression T_LOGOP logic_expression
| value T_LPAREN logic_expression T_RPAREN
;

for_stmt: T_FOR T_COUNTER T_COLON T_ASSIGN T_NUMBER T_TO T_NUMBER T_STEP
T_NUMBER stmts T_ENDFOR;

if_stmt: T_IF T_LPAREN logic_expression T_RPAREN T_THEN stmts elseif_stmt else_stmt
T_ENDIF;

elseif_stmt: T_ELSEIF T_LPAREN logic_expression T_RPAREN stmts elseif_stmt
|
;

else_stmt: T_ELSE stmts else_stm
|
;

switch_stmt: T_SWITCH T_LPAREN logic_expression T_RPAREN T_CASE T_LPAREN
logic_expression T_RPAREN T_COLON stmts switch_tail switch_default T_ENDSWITCH;

switch_tail: T_CASE T_LPAREN logic_expression T_RPAREN T_COLON stmts switch_tail
|
;

switch_default: T_DEFAULT T_COLON stmts
|
;

print_stmt: T_PRINT T_LPAREN T_STRING print_tail T_RPAREN T_SEMI;

print_tail: T_LBRACK T_COMMA args T_RBRACK
|
;

args: arg
| arg T_COMMA args
;

arg: T_ID {checkvar($1);}
;

main: T_STARTMAIN {checkline();} variable_declaration stmts T_ENDMAIN;

%%
int main(int argc, char *argv[])
{
	if(argc > 1) {
		yyin = fopen(argv[1], "r");
		if (yyin == NULL) {
			perror ("[ERROR] could not open file");
			return EXIT_FAILURE;
		}
	}

	yyparse();
	fclose(yyin);
	
	return 0;
}

void yyerror(const char *message)
{
	printf("\nError at line %d caused by %s: %s\n", lineno, yytext, message);
}
