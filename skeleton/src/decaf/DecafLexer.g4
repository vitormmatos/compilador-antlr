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

ID : CHARS | KEYBOARD_KEYS | SPECIAL_CHARS | NUMBERS | LETTERS | HexadecimalConstant;

KEYBOARD_KEYS
      : ('NUL' | 'SOH' | 'STX' | 'ETX' | 'EOT' |
        'ENQ' | 'ACK' | 'BEL' | 'BS' | 'TAB' | 'LF' | 'VT' |
        'FF' | 'CR' | 'SO' | 'SI' | 'DLE' | 'DC1' | 'DC2' |
        'DC3' | 'DC4' | 'NAK' | 'SYN' | 'ETB' | 'CAN' | 'EM'|
        'SUB' | 'ESC' | 'FS' | 'GS' | 'RS' | 'US' | 'SPACE');

CHARS
      : ('\'' SPECIAL_CHARS '\'' | '\'' NUMBERS '\'' | '\'' LETTERS '\'')
      ;

SPECIAL_CHARS: ('!' | '"' | '#' | '$' | '%' | '&' | '(' | '\'' |'\t' | '\\' | '\"');

NUMBERS: [0-9]+;
LETTERS: ( 'a'..'z' | 'A'..'Z');
WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR :
  '\'' (ESC|~'\'') '\''
  ;

STRING
    :   '"' (ESC|~'"')* '"'
    ;

HexadecimalConstant
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

fragment
ESC :  '\\' ('n'|'"');
