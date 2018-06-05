
parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: CS PG LCURLY field_decl*method_decl* RCURLY;


field_decl: type ID (VIRGULA par)* PONTOVIR|type ID LBRACKET int_literal RBRACKET (VIRGULA par LBRACKET int_literal RBRACKET)* PONTOVIR;


method_decl: (type| VOID) ID LPARENT(par(VIRGULA par)*)? RPARENT block;

par:type ID;

block:LCURLY (var|statement)* RCURLY;


var: type ID (variaveis)*PONTOVIR;
variaveis: VIRGULA ID;

type: INT|BL;

statement:location assign_op expr PONTOVIR
		|method_call PONTOVIR
		|SE LPARENT expr RPARENT block (ELSE block)?
		|PARA ID assign_op expr VIRGULA expr block
		|RT (expr)? PONTOVIR
		|BREAK PONTOVIR
		|CTN PONTOVIR
		|block;

assign_op:ATRIBUICAO
	 |DECREMENTO
	 |INCREMENTO;

method_call:method_name LPARENT (expr(VIRGULA expr)*)? RPARENT
	|CL LPARENT(string_literal(VIRGULA call_arg(VIRGULA call_arg)*)?) RPARENT;

method_name:ID;

location: ID
	  |ID LBRACKET expr RBRACKET;

expr: location|method_call
      |literal
      |expr bin_op expr
      |SUB expr
      | EXCL expr
      |LPARENT expr RPARENT;



call_arg: expr|string_literal;

bin_op: ar
        |rel
        |eq
        |cond;

ar:MULT|DIV|SUB|SUM|REST|EXP;
rel: MAIOR|MENOR|MAIORIG|MENORIG;
eq: IGUALDADE|DIFERENTE;
cond: AND|OR;

literal: int_literal|char_literal|bool_literal;

int_literal: dec|hex;
dec: NPO;
hex: HEXA;
bool_literal: VD|FL;
char_literal: CHARLITERAL;
string_literal: STRINGLITERAL;
