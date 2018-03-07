grammar Parsing;

sentence: noun_prase verb_phrase;

noun_prase: cmplx_noun | cmplx_noun prep_phrase;
verb_phrase: cmplx_verb | cmplx_verb prep_phrase;
prep_phrase: PREP cmplx_noun;
cmplx_noun: ARTICLE NOUN;
cmplx_verb: VERB | VERB noun_prase;
ARTICLE: 'a' | 'the';
NOUN: 'boy' | 'girl' | 'flower';
VERB: 'touches' | 'likes' | 'see';
PREP: 'with';
WS: [ \t\r\n]+ -> skip;
