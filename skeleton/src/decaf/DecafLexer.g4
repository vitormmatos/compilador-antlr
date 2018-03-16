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

KEYBOARD_KEYS
      : ('NUL' | 'SOH' | 'STX' | 'ETX' | 'EOT' |
        'ENQ' | 'ACK' | 'BEL' | 'BS' | 'TAB' | 'LF' | 'VT' |
        'FF' | 'CR' | 'SO' | 'SI' | 'DLE' | 'DC1' | 'DC2' |
        'DC3' | 'DC4' | 'NAK' | 'SYN' | 'ETB' | 'CAN' | 'EM'|
        'SUB' | 'ESC' | 'FS' | 'GS' | 'RS' | 'US' | 'SPACE');

TOKENS
    : TOKEN_WORDS+
    ;

fragment
TOKEN_WORDS
    : ('boolean' | 'callout' | 'class' | 'else' | 'false' |
      'if' | 'int' | 'return' | 'true' | 'void' | 'for' |
      'forpar' | 'break' | 'continue' | 'BOOLEAN' | 'CALLOUT' |
      'CLASS' | 'ELSE' | 'FALSE' | 'IF' | 'INT' | 'RETURN' |
      'TRUE' | 'VOID' | 'FOR' | 'FORPAR' | 'BREAK' | 'CONTINUE')
    ;

CHAR_VARIABLES
      : ('\'' (CHARS | DIGITS) '\'')
      ;

STRINGS
    : '\"' (ID | ' ' | NUMBERS) '\"'
    ;
ID
  : CHARS+ NUMBERS*
  ;

fragment
CHARS
      : SPECIAL_CHARS | LETTERS
      ;

fragment
SPECIAL_CHARS
      : ('!' | '"' | '#' | '$' | '%' | '&' | '(' | '_' | '.'| '\\')
      ;
 /* '\'' |'\t' | '\\' | '\"'); */

BINARY
    : '0' [bB] [0-1]+
    ;

 HEXADECIMALS
     :   HexadecimalPrefix HexadecimalDigit+
     ;

 fragment
 HexadecimalPrefix
     :   '0' [xX]
     ;

 fragment
 HexadecimalDigit
     :   [0-9a-fA-F]
     ;

NUMBERS
    :  DIGITS+ | '-' [1-9]+ |  FLOAT | '-' FLOAT
    ;

fragment
FLOAT
    : DIGITS+ '.' DIGITS+
    ;

fragment
DIGITS
    : [0-9]
    ;

LETTERS
    : ( 'a'..'z' | 'A'..'Z')
    ;

WS_
    : (' ' | '\n' ) -> skip
    ;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;


fragment
ESC :  '\\' ('n'|'"');
