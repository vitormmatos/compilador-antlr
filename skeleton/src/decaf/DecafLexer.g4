lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

tokens
{
  TK_class
}

LCURLY : '{';
RCURLY : '}';
LPARENT:'(';
RPARENT:')';
LBRACKET:'[';
RBRACKET:']';
PONTOVIR:';';
VIRGULA :',';
MULT:'*';
DIV:'/';
SUB: '-';
SUM: '+';
EXP:'^';
REST:'%';
EXCL:'!';
AND: '&&';
OR: '||';
IGUALDADE:'==';
DIFERENTE:'!=';
MAIOR: '>';
MENOR: '<';
MAIORIG:'>=';
MENORIG: '<=';
INCREMENTO: '+=';
DECREMENTO:'-=';
ATRIBUICAO:'=';
PG : 'Program';
BL : 'boolean';
CL : 'callout';
CS : 'class';
ELSE : 'else';
SE : 'if';
FL : 'false';
INT : 'int';
RT : 'return';
VD : 'true';
VOID: 'void';
PARA : 'for';
BREAK : 'break';
CTN : 'continue';

ESP: '#'|'$'|'&'|':'|'?'|'@'|'_'|'`'|'|'|'~';
HEXA : '0x'('0'..'9'|'a'..'f'|'A'..'F')+;
NPO : [0-9]+;
CHARLITERAL: '\''(ESC|CHARC|ESP)'\'';
STRINGLITERAL: '"' (ESC|CHARC|RCURLY|LPARENT|RPARENT|
LBRACKET|
RBRACKET|
PONTOVIR|
VIRGULA|
MULT|
DIV|
SUB|
SUM|
EXP|
REST|
EXCL|
AND|
OR|
IGUALDADE|
DIFERENTE|
MAIOR|
MENOR|
MAIORIG|
MENORIG|
INCREMENTO|
DECREMENTO|
ATRIBUICAO|
PG|
BL|
CL|
CS|
ELSE|
SE|
FL|
INT|
RT|
VD|
VOID|
PARA|
BREAK|
CTN|
ESP|
HEXA|
NPO|
LCURLY|'\\'|~('"'))*'"';

ID: ('_'| CHARC)('_'|CHARC|NPO)*;
WS_ : (' ' | '\n'|'\t') -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\''(' '..'!' | '#'..'&' | '('..'[' | ']'..'~' )'\'';
STRING : '"' (ESC~'"')* '"';
fragment CHARC:('a'..'z'|'A'..'Z'|'0'..'9');
fragment ESC: '\\' ( 'r' | 'n' | 't' | '\'' | '"' | '\\') ;
