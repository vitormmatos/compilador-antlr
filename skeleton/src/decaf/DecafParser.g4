parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: CLASS PROGRAM LCURLY field_decl* method_decl* RCURLY EOF;

field_decl: type ID (COMMA type ID)* SEMICOLON
			| type ID LBRACKET int_literal RBRACKET (COMMA type ID LBRACKET int_literal RBRACKET)* SEMICOLON ;


method_decl
    :
      (( type | VOID ) ID RPARENTHESIS ((type ID)+ COMMA)* LPARENTHESIS block)
    ;

block: LCURLY var_decl* statement* RCURLY;

var_decl
  : type ID (COMMA (type ID | ID))* SEMICOLON
  ;

type
  : INT
  | BOOLEAN
  ;

statement
  : location assign_op expr SEMICOLON
	| method_call SEMICOLON
	| IF LPARENTHESIS expr RPARENTHESIS block (ELSE block)*
	| FOR ID OP_ASSIGN expr COMMA expr block
	| RETURN expr* SEMICOLON
	| BREAK SEMICOLON
	| CONTINUE SEMICOLON
	| block ;

assign_op
  : OP_ASSIGN
  ;

method_call
  : method_name LPARENTHESIS (expr (COMMA expr)*)* RPARENTHESIS
	| CALLOUT LPARENTHESIS string_literal (COMMA callout_arg)* RPARENTHESIS
  ;

method_name
  : ID
  ;

location
  : ID
  | ID LBRACKET expr RBRACKET
  ;

expr
  : location
	| method_call
	| literal
	| expr bin_op expr
	| MINUS expr
	| EXCLAMATION expr
	| LPARENTHESIS expr RPARENTHESIS
  ;

callout_arg
    : expr | string_literal
    ;

bin_op
  : arith_op
  | rel_op
  | eq_op
  | cond_op
  ;

arith_op
  : OP_ARITH
  | MINUS
  ;

rel_op
  : OP_REL
  ;

eq_op
  : OP_EQ
  ;

cond_op
  : OP_COND
  ;

literal
  : int_literal
  | char_literal
  | bool_literal
  ;

//Add binary later
int_literal
  : decimal_literal
  | hex_literal
  | bin_literal
  ;

decimal_literal
  : DIGIT (DIGIT* | MINUS NONZERODIGIT+)
  ;

bin_literal
  : BIN_PREFIX BIN_DIGIT BIN_DIGIT*
  ;

hex_literal
   : HEX_PREFIX HEX_DIGIT HEX_DIGIT*
   ;

bool_literal
  : BOOLEANLITERAL
  ;

string_literal
  : STRINGLITERAL
  ;

char_literal
  : CHARLITERAL
  ;
