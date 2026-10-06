# FinLang — Derivaciones (versión compacta, ⇒* agrupa producciones unitarias)


## Declaraciones

**1.** `num meses = 12;`  (desde `declaration`)
```
declaration
  ⇒  tipo ID init ;
  ⇒  num meses init ;
  ⇒  num meses = expr ;
  ⇒* num meses = 12 ;
```

**2.** `dinero saldo = 15000 PEN;`  (desde `declaration`)
```
declaration
  ⇒  tipo ID init ;
  ⇒  dinero moneda ID init ;
  ⇒  dinero saldo init ;
  ⇒  dinero saldo = expr ;
  ⇒* dinero saldo = 15000 PEN ;
```

**3.** `dinero[USD] ahorro;`  (desde `declaration`)
```
declaration
  ⇒  tipo ID init ;
  ⇒  dinero moneda ID init ;
  ⇒  dinero [ USD ] ahorro init ;
  ⇒  dinero [ USD ] ahorro ;
```

**4.** `bool meta = falso;`  (desde `declaration`)
```
declaration
  ⇒  tipo ID init ;
  ⇒  bool meta init ;
  ⇒  bool meta = expr ;
  ⇒* bool meta = falso ;
```

## Asignaciones

**1.** `meses = meses + 1;`  (desde `assignment`)
```
assignment
  ⇒  meses = expr ;
  ⇒* meses = addE + mulE ;
  ⇒* meses = meses + mulE ;
  ⇒* meses = meses + 1 ;
```

**2.** `tem = 2%;`  (desde `assignment`)
```
assignment
  ⇒  tem = expr ;
  ⇒* tem = 2% ;
```

**3.** `meta = verdadero;`  (desde `assignment`)
```
assignment
  ⇒  meta = expr ;
  ⇒* meta = verdadero ;
```

**4.** `ahorro = 0 USD;`  (desde `assignment`)
```
assignment
  ⇒  ahorro = expr ;
  ⇒* ahorro = 0 USD ;
```

## Expresiones

**1.** `saldo * tem`  (desde `expr`)
```
expr
  ⇒* mulE * unE
  ⇒* saldo * unE
  ⇒* saldo * tem
```

**2.** `(a + b) / 2`  (desde `expr`)
```
expr
  ⇒* mulE / unE
  ⇒* ( expr ) / unE
  ⇒* ( addE + mulE ) / unE
  ⇒* ( a + mulE ) / unE
  ⇒* ( a + b ) / unE
  ⇒* ( a + b ) / 2
```

**3.** `a > 1000 PEN && mes < 36`  (desde `expr`)
```
expr
  ⇒* andE && eqE
  ⇒* relE > addE && eqE
  ⇒* a > addE && eqE
  ⇒* a > 1000 PEN && eqE
  ⇒* a > 1000 PEN && relE < addE
  ⇒* a > 1000 PEN && mes < addE
  ⇒* a > 1000 PEN && mes < 36
```

**4.** `convertir(saldo, USD, 3.75)`  (desde `expr`)
```
expr
  ⇒* convertir ( expr , CURRENCY , expr )
  ⇒* convertir ( saldo , USD , expr )
  ⇒* convertir ( saldo , USD , 3.75 )
```

## Sentencias selectivas

**1.** `si (meta) mostrar "ok";`  (desde `ifStmt`)
```
ifStmt
  ⇒  si ( expr ) statement elsePart
  ⇒* si ( meta ) statement elsePart
  ⇒* si ( meta ) mostrar expr exprTail ; elsePart
  ⇒* si ( meta ) mostrar "ok" exprTail ; elsePart
  ⇒  si ( meta ) mostrar "ok" ; elsePart
  ⇒  si ( meta ) mostrar "ok" ;
```

**2.** `si (a == b) n = 1; sino n = 2;`  (desde `ifStmt`)
```
ifStmt
  ⇒  si ( expr ) statement elsePart
  ⇒* si ( eqE == relE ) statement elsePart
  ⇒* si ( a == relE ) statement elsePart
  ⇒* si ( a == b ) statement elsePart
  ⇒* si ( a == b ) n = expr ; elsePart
  ⇒* si ( a == b ) n = 1 ; elsePart
  ⇒  si ( a == b ) n = 1 ; sino statement
  ⇒* si ( a == b ) n = 1 ; sino n = expr ;
  ⇒* si ( a == b ) n = 1 ; sino n = 2 ;
```

**3.** `si (saldo > 0 PEN) { mostrar "ok"; }`  (desde `ifStmt`)
```
ifStmt
  ⇒  si ( expr ) statement elsePart
  ⇒* si ( relE > addE ) statement elsePart
  ⇒* si ( saldo > addE ) statement elsePart
  ⇒* si ( saldo > 0 PEN ) statement elsePart
  ⇒* si ( saldo > 0 PEN ) { stmtList } elsePart
  ⇒  si ( saldo > 0 PEN ) { statement stmtList } elsePart
  ⇒* si ( saldo > 0 PEN ) { mostrar expr exprTail ; stmtList } elsePart
  ⇒* si ( saldo > 0 PEN ) { mostrar "ok" exprTail ; stmtList } elsePart
  ⇒  si ( saldo > 0 PEN ) { mostrar "ok" ; stmtList } elsePart
  ⇒  si ( saldo > 0 PEN ) { mostrar "ok" ; } elsePart
  ⇒  si ( saldo > 0 PEN ) { mostrar "ok" ; }
```

**4.** `si (meta) n = 1; sino si (a > b) n = 2;`  (desde `ifStmt`)
```
ifStmt
  ⇒  si ( expr ) statement elsePart
  ⇒* si ( meta ) statement elsePart
  ⇒* si ( meta ) n = expr ; elsePart
  ⇒* si ( meta ) n = 1 ; elsePart
  ⇒  si ( meta ) n = 1 ; sino statement
  ⇒* si ( meta ) n = 1 ; sino si ( expr ) statement elsePart
  ⇒* si ( meta ) n = 1 ; sino si ( relE > addE ) statement elsePart
  ⇒* si ( meta ) n = 1 ; sino si ( a > addE ) statement elsePart
  ⇒* si ( meta ) n = 1 ; sino si ( a > b ) statement elsePart
  ⇒* si ( meta ) n = 1 ; sino si ( a > b ) n = expr ; elsePart
  ⇒* si ( meta ) n = 1 ; sino si ( a > b ) n = 2 ; elsePart
  ⇒  si ( meta ) n = 1 ; sino si ( a > b ) n = 2 ;
```

## Sentencias iterativas

**1.** `mientras (saldo > 0 PEN) saldo = saldo - cuota1;`  (desde `whileStmt`)
```
whileStmt
  ⇒  mientras ( expr ) statement
  ⇒* mientras ( relE > addE ) statement
  ⇒* mientras ( saldo > addE ) statement
  ⇒* mientras ( saldo > 0 PEN ) statement
  ⇒* mientras ( saldo > 0 PEN ) saldo = expr ;
  ⇒* mientras ( saldo > 0 PEN ) saldo = addE - mulE ;
  ⇒* mientras ( saldo > 0 PEN ) saldo = saldo - mulE ;
  ⇒* mientras ( saldo > 0 PEN ) saldo = saldo - cuota1 ;
```

**2.** `mientras (!meta && mes < 36) mes = mes + 1;`  (desde `whileStmt`)
```
whileStmt
  ⇒  mientras ( expr ) statement
  ⇒* mientras ( andE && eqE ) statement
  ⇒* mientras ( ! unE && eqE ) statement
  ⇒* mientras ( ! meta && eqE ) statement
  ⇒* mientras ( ! meta && relE < addE ) statement
  ⇒* mientras ( ! meta && mes < addE ) statement
  ⇒* mientras ( ! meta && mes < 36 ) statement
  ⇒* mientras ( ! meta && mes < 36 ) mes = expr ;
  ⇒* mientras ( ! meta && mes < 36 ) mes = addE + mulE ;
  ⇒* mientras ( ! meta && mes < 36 ) mes = mes + mulE ;
  ⇒* mientras ( ! meta && mes < 36 ) mes = mes + 1 ;
```

**3.** `para i desde 1 hasta 12 saldo = saldo * tem;`  (desde `forStmt`)
```
forStmt
  ⇒  para i desde expr hasta expr statement
  ⇒* para i desde 1 hasta expr statement
  ⇒* para i desde 1 hasta 12 statement
  ⇒* para i desde 1 hasta 12 saldo = expr ;
  ⇒* para i desde 1 hasta 12 saldo = mulE * unE ;
  ⇒* para i desde 1 hasta 12 saldo = saldo * unE ;
  ⇒* para i desde 1 hasta 12 saldo = saldo * tem ;
```

**4.** `para k desde 1 hasta meses { n = n + 1; }`  (desde `forStmt`)
```
forStmt
  ⇒  para k desde expr hasta expr statement
  ⇒* para k desde 1 hasta expr statement
  ⇒* para k desde 1 hasta meses statement
  ⇒* para k desde 1 hasta meses { stmtList }
  ⇒  para k desde 1 hasta meses { statement stmtList }
  ⇒* para k desde 1 hasta meses { n = expr ; stmtList }
  ⇒* para k desde 1 hasta meses { n = addE + mulE ; stmtList }
  ⇒* para k desde 1 hasta meses { n = n + mulE ; stmtList }
  ⇒* para k desde 1 hasta meses { n = n + 1 ; stmtList }
  ⇒  para k desde 1 hasta meses { n = n + 1 ; }
```

## Préstamos y reportes

**1.** `prestamo p { monto: 1000 PEN; tea: 10%; plazo: 12; }`  (desde `loanDecl`)
```
loanDecl
  ⇒  prestamo p { monto : expr ; tea : expr ; plazo : expr ; }
  ⇒* prestamo p { monto : 1000 PEN ; tea : expr ; plazo : expr ; }
  ⇒* prestamo p { monto : 1000 PEN ; tea : 10% ; plazo : expr ; }
  ⇒* prestamo p { monto : 1000 PEN ; tea : 10% ; plazo : 12 ; }
```

**2.** `mostrar "Cuota:", cuota(auto);`  (desde `printStmt`)
```
printStmt
  ⇒  mostrar expr exprTail ;
  ⇒* mostrar "Cuota:" exprTail ;
  ⇒  mostrar "Cuota:" , expr exprTail ;
  ⇒* mostrar "Cuota:" , cuota ( auto ) exprTail ;
  ⇒  mostrar "Cuota:" , cuota ( auto ) ;
```

**3.** `cronograma auto;`  (desde `scheduleStmt`)
```
scheduleStmt
  ⇒  cronograma auto ;
```

**4.** `mostrar interesTotal(auto);`  (desde `printStmt`)
```
printStmt
  ⇒  mostrar expr exprTail ;
  ⇒* mostrar interesTotal ( auto ) exprTail ;
  ⇒  mostrar interesTotal ( auto ) ;
```
