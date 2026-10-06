grammar FinLang;

// =====================================================================
//  FinLang - DSL para finanzas personales y préstamos
//  Trabajo Parcial - Teoría de Compiladores 2026-2
// =====================================================================

// ------------------------- ANALIZADOR SINTÁCTICO ---------------------

program : statement* EOF ;

statement
    : declaration
    | assignment
    | loanDecl
    | printStmt
    | ifStmt
    | whileStmt
    | forStmt
    | scheduleStmt
    | block
    ;

block : LBRACE statement* RBRACE ;

// dinero saldo = 1500 PEN;   dinero[USD] ahorro;   num n = 3;
declaration : tipo ID (ASSIGN expr)? SEMI ;

tipo
    : TNUM
    | TDINERO (LBRACK CURRENCY RBRACK)?
    | TTASA
    | TBOOL
    ;

assignment : ID ASSIGN expr SEMI ;

// Construcción propia del dominio: préstamo
loanDecl
    : PRESTAMO ID LBRACE
        MONTO COLON expr SEMI
        TEA   COLON expr SEMI
        PLAZO COLON expr SEMI
      RBRACE
    ;

printStmt    : MOSTRAR expr (COMMA expr)* SEMI ;
ifStmt       : SI LPAREN expr RPAREN statement (SINO statement)? ;
whileStmt    : MIENTRAS LPAREN expr RPAREN statement ;
forStmt      : PARA ID DESDE expr HASTA expr statement ;
scheduleStmt : CRONOGRAMA ID SEMI ;

// La precedencia la define el orden de las alternativas (mayor a menor)
expr
    : LPAREN expr RPAREN                                       # parens
    | op=(MINUS | NOT) expr                                    # unary
    | expr op=(MUL | DIV) expr                                 # mulDiv
    | expr op=(PLUS | MINUS) expr                              # addSub
    | expr op=(LT | LE | GT | GE) expr                         # relational
    | expr op=(EQ | NEQ) expr                                  # equality
    | expr AND expr                                            # andExpr
    | expr OR expr                                             # orExpr
    | CUOTA LPAREN ID RPAREN                                   # cuotaCall
    | INTERES_TOTAL LPAREN ID RPAREN                           # interesTotalCall
    | CONVERTIR LPAREN expr COMMA CURRENCY COMMA expr RPAREN   # convertCall
    | NUMERO CURRENCY                                          # moneyLit
    | NUMERO                                                   # numLit
    | PORCENTAJE                                               # rateLit
    | (TRUE | FALSE)                                           # boolLit
    | STRING                                                   # strLit
    | ID                                                       # varRef
    ;

// --------------------------- ANALIZADOR LÉXICO -----------------------

// Tipos
TNUM     : 'num' ;
TDINERO  : 'dinero' ;
TTASA    : 'tasa' ;
TBOOL    : 'bool' ;

// Palabras clave
PRESTAMO       : 'prestamo' ;
MONTO          : 'monto' ;
TEA            : 'tea' ;
PLAZO          : 'plazo' ;
SI             : 'si' ;
SINO           : 'sino' ;
MIENTRAS       : 'mientras' ;
PARA           : 'para' ;
DESDE          : 'desde' ;
HASTA          : 'hasta' ;
MOSTRAR        : 'mostrar' ;
CRONOGRAMA     : 'cronograma' ;
CUOTA          : 'cuota' ;
INTERES_TOTAL  : 'interesTotal' ;
CONVERTIR      : 'convertir' ;
TRUE           : 'verdadero' ;
FALSE          : 'falso' ;

// Monedas
CURRENCY : 'PEN' | 'USD' | 'EUR' ;

// Operadores
PLUS   : '+' ;
MINUS  : '-' ;
MUL    : '*' ;
DIV    : '/' ;
LT     : '<' ;
LE     : '<=' ;
GT     : '>' ;
GE     : '>=' ;
EQ     : '==' ;
NEQ    : '!=' ;
AND    : '&&' ;
OR     : '||' ;
NOT    : '!' ;
ASSIGN : '=' ;

// Delimitadores
LPAREN : '(' ;
RPAREN : ')' ;
LBRACE : '{' ;
RBRACE : '}' ;
LBRACK : '[' ;
RBRACK : ']' ;
SEMI   : ';' ;
COMMA  : ',' ;
COLON  : ':' ;

// Literales e identificadores
PORCENTAJE : DIGITO+ ('.' DIGITO+)? '%' ;
NUMERO     : DIGITO+ ('.' DIGITO+)? ;
STRING     : '"' ~["\r\n]* '"' ;
ID         : [a-zA-Z_] [a-zA-Z_0-9]* ;

fragment DIGITO : [0-9] ;

// Se ignoran
LINE_COMMENT  : '//' ~[\r\n]* -> skip ;
BLOCK_COMMENT : '/*' .*? '*/' -> skip ;
WS            : [ \t\r\n]+ -> skip ;

// Cualquier otro carácter: se reporta como error léxico
ERROR_CHAR : . ;
