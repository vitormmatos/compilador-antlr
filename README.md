# compilador-antlr

## Como testar o lexer:

$ ant -f skeleton && java -jar skeleton/dist/Compiler.jar -target scan -debug scanner/arquivo_teste

## Como testar o parser:

ant -f skeleton && java -jar skeleton/dist/Compiler.jar -target parser -debug parser/arquivo_teste


## Como compilar e gerar uma árvore da gramática C.g4:

$ antlr4 C.g4

$ javac C*.java

$ grun C compilationUnit -gui exemplo.c

### Se deve fazer commit apenas das gramáticas geradas e exemplos que servirão para o projeto
