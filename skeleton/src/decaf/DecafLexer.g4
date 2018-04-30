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

PROGRAM: 'Program';
LCURLY : '{';
RCURLY : '}';
LBRACKET: '[';
RBRACKET: ']';
LPARENTHESIS: '(';
RPARENTHESIS: ')';
COMMA: ',';
SEMICOLON: ';';

IF:'if';
BOOLEAN : 'boolean';
BREAK: 'break';
CALLOUT: 'callout';
CLASS: 'class';
CONTINUE: 'continue';
ELSE: 'else';
FOR: 'for';
INT: 'int';
RETURN: 'return';
VOID: 'void';

OP_ASSIGN
      : '=' | '+=' | '-='
      ;

OP_ARITH
      : '+' | '-' | '*' | '/' | '%'
      ;

OP_REL
    : '<' | '>' | '<=' | '>='
    ;

OP_EQ
    : '==' | '!='
    ;

OP_COND
    : '&&' | '||'
    ;

BOOLEANLITERAL
    : 'true' | 'false'
    ;

CHARLITERAL
      : '\'' CHARS* '\''
      ;

STRINGLITERAL
    : '"' CHARS* '"'
    ;

ID
  : ALPHA ALPHA_NUM*
  ;

ALPHA_NUM
    : ALPHA | DIGIT
    ;

fragment
ALPHA
   : 'a'..'z' | 'A'..'Z'
   ;

NONZERODIGIT
    : [1-9]
    ;

DIGIT
   : [0-9]
   ;

HEX_PREFIX
      :   '0' [xX]
      ;

HEX_DIGIT
    : [0-9a-fA-F]
    ;

BIN_DIGIT
    : [0-1]+
    ;

BIN_PREFIX
    : '0' [bB]
    ;

MINUS
    : '-'
    ;

EXCLAMATION
  : '!'
  ;

/* FLOAT
    : FLOATSEQUENCE | '-' FLOATSEQUENCE
    ; */

fragment
FLOATSEQUENCE
    : DIGIT+ '.' DIGIT+
    ;

fragment
CHARS
    :   ~[\\\r\n\']
    | EscapeSequence
    ;

fragment
EscapeSequence
        :   '\\' ['"?abfnrtv\\']
        ;

WS_
    : (' ' | '\n' | '\t') -> skip
    ;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;


fragment
ESC :  '\\' ('n'|'"');
