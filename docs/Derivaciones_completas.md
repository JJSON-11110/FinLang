# FinLang — Derivaciones más a la izquierda completas

Generado con `python tools/derivaciones.py` (sin abreviar: cada línea es UNA producción). Los terminales ya generados se escriben con su lexema; los no terminales en camelCase.

## Declaraciones

**1.** `num meses = 12;`  (desde `declaration`)
```
declaration
  ⇒  tipo ID init ;
  ⇒  num meses init ;
  ⇒  num meses = expr ;
  ⇒  num meses = andE ;
  ⇒  num meses = eqE ;
  ⇒  num meses = relE ;
  ⇒  num meses = addE ;
  ⇒  num meses = mulE ;
  ⇒  num meses = unE ;
  ⇒  num meses = prim ;
  ⇒  num meses = 12 ;
```

**2.** `dinero saldo = 15000 PEN;`  (desde `declaration`)
```
declaration
  ⇒  tipo ID init ;
  ⇒  dinero moneda ID init ;
  ⇒  dinero saldo init ;
  ⇒  dinero saldo = expr ;
  ⇒  dinero saldo = andE ;
  ⇒  dinero saldo = eqE ;
  ⇒  dinero saldo = relE ;
  ⇒  dinero saldo = addE ;
  ⇒  dinero saldo = mulE ;
  ⇒  dinero saldo = unE ;
  ⇒  dinero saldo = prim ;
  ⇒  dinero saldo = 15000 PEN ;
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
  ⇒  bool meta = andE ;
  ⇒  bool meta = eqE ;
  ⇒  bool meta = relE ;
  ⇒  bool meta = addE ;
  ⇒  bool meta = mulE ;
  ⇒  bool meta = unE ;
  ⇒  bool meta = prim ;
  ⇒  bool meta = falso ;
```

## Asignaciones

**1.** `meses = meses + 1;`  (desde `assignment`)
```
assignment
  ⇒  meses = expr ;
  ⇒  meses = andE ;
  ⇒  meses = eqE ;
  ⇒  meses = relE ;
  ⇒  meses = addE ;
  ⇒  meses = addE + mulE ;
  ⇒  meses = mulE + mulE ;
  ⇒  meses = unE + mulE ;
  ⇒  meses = prim + mulE ;
  ⇒  meses = meses + mulE ;
  ⇒  meses = meses + unE ;
  ⇒  meses = meses + prim ;
  ⇒  meses = meses + 1 ;
```

**2.** `tem = 2%;`  (desde `assignment`)
```
assignment
  ⇒  tem = expr ;
  ⇒  tem = andE ;
  ⇒  tem = eqE ;
  ⇒  tem = relE ;
  ⇒  tem = addE ;
  ⇒  tem = mulE ;
  ⇒  tem = unE ;
  ⇒  tem = prim ;
  ⇒  tem = 2% ;
```

**3.** `meta = verdadero;`  (desde `assignment`)
```
assignment
  ⇒  meta = expr ;
  ⇒  meta = andE ;
  ⇒  meta = eqE ;
  ⇒  meta = relE ;
  ⇒  meta = addE ;
  ⇒  meta = mulE ;
  ⇒  meta = unE ;
  ⇒  meta = prim ;
  ⇒  meta = verdadero ;
```

**4.** `ahorro = 0 USD;`  (desde `assignment`)
```
assignment
  ⇒  ahorro = expr ;
  ⇒  ahorro = andE ;
  ⇒  ahorro = eqE ;
  ⇒  ahorro = relE ;
  ⇒  ahorro = addE ;
  ⇒  ahorro = mulE ;
  ⇒  ahorro = unE ;
  ⇒  ahorro = prim ;
  ⇒  ahorro = 0 USD ;
```

## Expresiones

**1.** `saldo * tem`  (desde `expr`)
```
expr
  ⇒  andE
  ⇒  eqE
  ⇒  relE
  ⇒  addE
  ⇒  mulE
  ⇒  mulE * unE
  ⇒  unE * unE
  ⇒  prim * unE
  ⇒  saldo * unE
  ⇒  saldo * prim
  ⇒  saldo * tem
```

**2.** `(a + b) / 2`  (desde `expr`)
```
expr
  ⇒  andE
  ⇒  eqE
  ⇒  relE
  ⇒  addE
  ⇒  mulE
  ⇒  mulE / unE
  ⇒  unE / unE
  ⇒  prim / unE
  ⇒  ( expr ) / unE
  ⇒  ( andE ) / unE
  ⇒  ( eqE ) / unE
  ⇒  ( relE ) / unE
  ⇒  ( addE ) / unE
  ⇒  ( addE + mulE ) / unE
  ⇒  ( mulE + mulE ) / unE
  ⇒  ( unE + mulE ) / unE
  ⇒  ( prim + mulE ) / unE
  ⇒  ( a + mulE ) / unE
  ⇒  ( a + unE ) / unE
  ⇒  ( a + prim ) / unE
  ⇒  ( a + b ) / unE
  ⇒  ( a + b ) / prim
  ⇒  ( a + b ) / 2
```

**3.** `a > 1000 PEN && mes < 36`  (desde `expr`)
```
expr
  ⇒  andE
  ⇒  andE && eqE
  ⇒  eqE && eqE
  ⇒  relE && eqE
  ⇒  relE > addE && eqE
  ⇒  addE > addE && eqE
  ⇒  mulE > addE && eqE
  ⇒  unE > addE && eqE
  ⇒  prim > addE && eqE
  ⇒  a > addE && eqE
  ⇒  a > mulE && eqE
  ⇒  a > unE && eqE
  ⇒  a > prim && eqE
  ⇒  a > 1000 PEN && eqE
  ⇒  a > 1000 PEN && relE
  ⇒  a > 1000 PEN && relE < addE
  ⇒  a > 1000 PEN && addE < addE
  ⇒  a > 1000 PEN && mulE < addE
  ⇒  a > 1000 PEN && unE < addE
  ⇒  a > 1000 PEN && prim < addE
  ⇒  a > 1000 PEN && mes < addE
  ⇒  a > 1000 PEN && mes < mulE
  ⇒  a > 1000 PEN && mes < unE
  ⇒  a > 1000 PEN && mes < prim
  ⇒  a > 1000 PEN && mes < 36
```

**4.** `convertir(saldo, USD, 3.75)`  (desde `expr`)
```
expr
  ⇒  andE
  ⇒  eqE
  ⇒  relE
  ⇒  addE
  ⇒  mulE
  ⇒  unE
  ⇒  prim
  ⇒  convertir ( expr , CURRENCY , expr )
  ⇒  convertir ( andE , CURRENCY , expr )
  ⇒  convertir ( eqE , CURRENCY , expr )
  ⇒  convertir ( relE , CURRENCY , expr )
  ⇒  convertir ( addE , CURRENCY , expr )
  ⇒  convertir ( mulE , CURRENCY , expr )
  ⇒  convertir ( unE , CURRENCY , expr )
  ⇒  convertir ( prim , CURRENCY , expr )
  ⇒  convertir ( saldo , USD , expr )
  ⇒  convertir ( saldo , USD , andE )
  ⇒  convertir ( saldo , USD , eqE )
  ⇒  convertir ( saldo , USD , relE )
  ⇒  convertir ( saldo , USD , addE )
  ⇒  convertir ( saldo , USD , mulE )
  ⇒  convertir ( saldo , USD , unE )
  ⇒  convertir ( saldo , USD , prim )
  ⇒  convertir ( saldo , USD , 3.75 )
```

## Sentencias selectivas

**1.** `si (meta) mostrar "ok";`  (desde `ifStmt`)
```
ifStmt
  ⇒  si ( expr ) statement elsePart
  ⇒  si ( andE ) statement elsePart
  ⇒  si ( eqE ) statement elsePart
  ⇒  si ( relE ) statement elsePart
  ⇒  si ( addE ) statement elsePart
  ⇒  si ( mulE ) statement elsePart
  ⇒  si ( unE ) statement elsePart
  ⇒  si ( prim ) statement elsePart
  ⇒  si ( meta ) statement elsePart
  ⇒  si ( meta ) printStmt elsePart
  ⇒  si ( meta ) mostrar expr exprTail ; elsePart
  ⇒  si ( meta ) mostrar andE exprTail ; elsePart
  ⇒  si ( meta ) mostrar eqE exprTail ; elsePart
  ⇒  si ( meta ) mostrar relE exprTail ; elsePart
  ⇒  si ( meta ) mostrar addE exprTail ; elsePart
  ⇒  si ( meta ) mostrar mulE exprTail ; elsePart
  ⇒  si ( meta ) mostrar unE exprTail ; elsePart
  ⇒  si ( meta ) mostrar prim exprTail ; elsePart
  ⇒  si ( meta ) mostrar "ok" exprTail ; elsePart
  ⇒  si ( meta ) mostrar "ok" ; elsePart
  ⇒  si ( meta ) mostrar "ok" ;
```

**2.** `si (a == b) n = 1; sino n = 2;`  (desde `ifStmt`)
```
ifStmt
  ⇒  si ( expr ) statement elsePart
  ⇒  si ( andE ) statement elsePart
  ⇒  si ( eqE ) statement elsePart
  ⇒  si ( eqE == relE ) statement elsePart
  ⇒  si ( relE == relE ) statement elsePart
  ⇒  si ( addE == relE ) statement elsePart
  ⇒  si ( mulE == relE ) statement elsePart
  ⇒  si ( unE == relE ) statement elsePart
  ⇒  si ( prim == relE ) statement elsePart
  ⇒  si ( a == relE ) statement elsePart
  ⇒  si ( a == addE ) statement elsePart
  ⇒  si ( a == mulE ) statement elsePart
  ⇒  si ( a == unE ) statement elsePart
  ⇒  si ( a == prim ) statement elsePart
  ⇒  si ( a == b ) statement elsePart
  ⇒  si ( a == b ) assignment elsePart
  ⇒  si ( a == b ) n = expr ; elsePart
  ⇒  si ( a == b ) n = andE ; elsePart
  ⇒  si ( a == b ) n = eqE ; elsePart
  ⇒  si ( a == b ) n = relE ; elsePart
  ⇒  si ( a == b ) n = addE ; elsePart
  ⇒  si ( a == b ) n = mulE ; elsePart
  ⇒  si ( a == b ) n = unE ; elsePart
  ⇒  si ( a == b ) n = prim ; elsePart
  ⇒  si ( a == b ) n = 1 ; elsePart
  ⇒  si ( a == b ) n = 1 ; sino statement
  ⇒  si ( a == b ) n = 1 ; sino assignment
  ⇒  si ( a == b ) n = 1 ; sino n = expr ;
  ⇒  si ( a == b ) n = 1 ; sino n = andE ;
  ⇒  si ( a == b ) n = 1 ; sino n = eqE ;
  ⇒  si ( a == b ) n = 1 ; sino n = relE ;
  ⇒  si ( a == b ) n = 1 ; sino n = addE ;
  ⇒  si ( a == b ) n = 1 ; sino n = mulE ;
  ⇒  si ( a == b ) n = 1 ; sino n = unE ;
  ⇒  si ( a == b ) n = 1 ; sino n = prim ;
  ⇒  si ( a == b ) n = 1 ; sino n = 2 ;
```

**3.** `si (saldo > 0 PEN) { mostrar "ok"; }`  (desde `ifStmt`)
```
ifStmt
  ⇒  si ( expr ) statement elsePart
  ⇒  si ( andE ) statement elsePart
  ⇒  si ( eqE ) statement elsePart
  ⇒  si ( relE ) statement elsePart
  ⇒  si ( relE > addE ) statement elsePart
  ⇒  si ( addE > addE ) statement elsePart
  ⇒  si ( mulE > addE ) statement elsePart
  ⇒  si ( unE > addE ) statement elsePart
  ⇒  si ( prim > addE ) statement elsePart
  ⇒  si ( saldo > addE ) statement elsePart
  ⇒  si ( saldo > mulE ) statement elsePart
  ⇒  si ( saldo > unE ) statement elsePart
  ⇒  si ( saldo > prim ) statement elsePart
  ⇒  si ( saldo > 0 PEN ) statement elsePart
  ⇒  si ( saldo > 0 PEN ) block elsePart
  ⇒  si ( saldo > 0 PEN ) { stmtList } elsePart
  ⇒  si ( saldo > 0 PEN ) { statement stmtList } elsePart
  ⇒  si ( saldo > 0 PEN ) { printStmt stmtList } elsePart
  ⇒  si ( saldo > 0 PEN ) { mostrar expr exprTail ; stmtList } elsePart
  ⇒  si ( saldo > 0 PEN ) { mostrar andE exprTail ; stmtList } elsePart
  ⇒  si ( saldo > 0 PEN ) { mostrar eqE exprTail ; stmtList } elsePart
  ⇒  si ( saldo > 0 PEN ) { mostrar relE exprTail ; stmtList } elsePart
  ⇒  si ( saldo > 0 PEN ) { mostrar addE exprTail ; stmtList } elsePart
  ⇒  si ( saldo > 0 PEN ) { mostrar mulE exprTail ; stmtList } elsePart
  ⇒  si ( saldo > 0 PEN ) { mostrar unE exprTail ; stmtList } elsePart
  ⇒  si ( saldo > 0 PEN ) { mostrar prim exprTail ; stmtList } elsePart
  ⇒  si ( saldo > 0 PEN ) { mostrar "ok" exprTail ; stmtList } elsePart
  ⇒  si ( saldo > 0 PEN ) { mostrar "ok" ; stmtList } elsePart
  ⇒  si ( saldo > 0 PEN ) { mostrar "ok" ; } elsePart
  ⇒  si ( saldo > 0 PEN ) { mostrar "ok" ; }
```

**4.** `si (meta) n = 1; sino si (a > b) n = 2;`  (desde `ifStmt`)
```
ifStmt
  ⇒  si ( expr ) statement elsePart
  ⇒  si ( andE ) statement elsePart
  ⇒  si ( eqE ) statement elsePart
  ⇒  si ( relE ) statement elsePart
  ⇒  si ( addE ) statement elsePart
  ⇒  si ( mulE ) statement elsePart
  ⇒  si ( unE ) statement elsePart
  ⇒  si ( prim ) statement elsePart
  ⇒  si ( meta ) statement elsePart
  ⇒  si ( meta ) assignment elsePart
  ⇒  si ( meta ) n = expr ; elsePart
  ⇒  si ( meta ) n = andE ; elsePart
  ⇒  si ( meta ) n = eqE ; elsePart
  ⇒  si ( meta ) n = relE ; elsePart
  ⇒  si ( meta ) n = addE ; elsePart
  ⇒  si ( meta ) n = mulE ; elsePart
  ⇒  si ( meta ) n = unE ; elsePart
  ⇒  si ( meta ) n = prim ; elsePart
  ⇒  si ( meta ) n = 1 ; elsePart
  ⇒  si ( meta ) n = 1 ; sino statement
  ⇒  si ( meta ) n = 1 ; sino ifStmt
  ⇒  si ( meta ) n = 1 ; sino si ( expr ) statement elsePart
  ⇒  si ( meta ) n = 1 ; sino si ( andE ) statement elsePart
  ⇒  si ( meta ) n = 1 ; sino si ( eqE ) statement elsePart
  ⇒  si ( meta ) n = 1 ; sino si ( relE ) statement elsePart
  ⇒  si ( meta ) n = 1 ; sino si ( relE > addE ) statement elsePart
  ⇒  si ( meta ) n = 1 ; sino si ( addE > addE ) statement elsePart
  ⇒  si ( meta ) n = 1 ; sino si ( mulE > addE ) statement elsePart
  ⇒  si ( meta ) n = 1 ; sino si ( unE > addE ) statement elsePart
  ⇒  si ( meta ) n = 1 ; sino si ( prim > addE ) statement elsePart
  ⇒  si ( meta ) n = 1 ; sino si ( a > addE ) statement elsePart
  ⇒  si ( meta ) n = 1 ; sino si ( a > mulE ) statement elsePart
  ⇒  si ( meta ) n = 1 ; sino si ( a > unE ) statement elsePart
  ⇒  si ( meta ) n = 1 ; sino si ( a > prim ) statement elsePart
  ⇒  si ( meta ) n = 1 ; sino si ( a > b ) statement elsePart
  ⇒  si ( meta ) n = 1 ; sino si ( a > b ) assignment elsePart
  ⇒  si ( meta ) n = 1 ; sino si ( a > b ) n = expr ; elsePart
  ⇒  si ( meta ) n = 1 ; sino si ( a > b ) n = andE ; elsePart
  ⇒  si ( meta ) n = 1 ; sino si ( a > b ) n = eqE ; elsePart
  ⇒  si ( meta ) n = 1 ; sino si ( a > b ) n = relE ; elsePart
  ⇒  si ( meta ) n = 1 ; sino si ( a > b ) n = addE ; elsePart
  ⇒  si ( meta ) n = 1 ; sino si ( a > b ) n = mulE ; elsePart
  ⇒  si ( meta ) n = 1 ; sino si ( a > b ) n = unE ; elsePart
  ⇒  si ( meta ) n = 1 ; sino si ( a > b ) n = prim ; elsePart
  ⇒  si ( meta ) n = 1 ; sino si ( a > b ) n = 2 ; elsePart
  ⇒  si ( meta ) n = 1 ; sino si ( a > b ) n = 2 ;
```

## Sentencias iterativas

**1.** `mientras (saldo > 0 PEN) saldo = saldo - cuota1;`  (desde `whileStmt`)
```
whileStmt
  ⇒  mientras ( expr ) statement
  ⇒  mientras ( andE ) statement
  ⇒  mientras ( eqE ) statement
  ⇒  mientras ( relE ) statement
  ⇒  mientras ( relE > addE ) statement
  ⇒  mientras ( addE > addE ) statement
  ⇒  mientras ( mulE > addE ) statement
  ⇒  mientras ( unE > addE ) statement
  ⇒  mientras ( prim > addE ) statement
  ⇒  mientras ( saldo > addE ) statement
  ⇒  mientras ( saldo > mulE ) statement
  ⇒  mientras ( saldo > unE ) statement
  ⇒  mientras ( saldo > prim ) statement
  ⇒  mientras ( saldo > 0 PEN ) statement
  ⇒  mientras ( saldo > 0 PEN ) assignment
  ⇒  mientras ( saldo > 0 PEN ) saldo = expr ;
  ⇒  mientras ( saldo > 0 PEN ) saldo = andE ;
  ⇒  mientras ( saldo > 0 PEN ) saldo = eqE ;
  ⇒  mientras ( saldo > 0 PEN ) saldo = relE ;
  ⇒  mientras ( saldo > 0 PEN ) saldo = addE ;
  ⇒  mientras ( saldo > 0 PEN ) saldo = addE - mulE ;
  ⇒  mientras ( saldo > 0 PEN ) saldo = mulE - mulE ;
  ⇒  mientras ( saldo > 0 PEN ) saldo = unE - mulE ;
  ⇒  mientras ( saldo > 0 PEN ) saldo = prim - mulE ;
  ⇒  mientras ( saldo > 0 PEN ) saldo = saldo - mulE ;
  ⇒  mientras ( saldo > 0 PEN ) saldo = saldo - unE ;
  ⇒  mientras ( saldo > 0 PEN ) saldo = saldo - prim ;
  ⇒  mientras ( saldo > 0 PEN ) saldo = saldo - cuota1 ;
```

**2.** `mientras (!meta && mes < 36) mes = mes + 1;`  (desde `whileStmt`)
```
whileStmt
  ⇒  mientras ( expr ) statement
  ⇒  mientras ( andE ) statement
  ⇒  mientras ( andE && eqE ) statement
  ⇒  mientras ( eqE && eqE ) statement
  ⇒  mientras ( relE && eqE ) statement
  ⇒  mientras ( addE && eqE ) statement
  ⇒  mientras ( mulE && eqE ) statement
  ⇒  mientras ( unE && eqE ) statement
  ⇒  mientras ( ! unE && eqE ) statement
  ⇒  mientras ( ! prim && eqE ) statement
  ⇒  mientras ( ! meta && eqE ) statement
  ⇒  mientras ( ! meta && relE ) statement
  ⇒  mientras ( ! meta && relE < addE ) statement
  ⇒  mientras ( ! meta && addE < addE ) statement
  ⇒  mientras ( ! meta && mulE < addE ) statement
  ⇒  mientras ( ! meta && unE < addE ) statement
  ⇒  mientras ( ! meta && prim < addE ) statement
  ⇒  mientras ( ! meta && mes < addE ) statement
  ⇒  mientras ( ! meta && mes < mulE ) statement
  ⇒  mientras ( ! meta && mes < unE ) statement
  ⇒  mientras ( ! meta && mes < prim ) statement
  ⇒  mientras ( ! meta && mes < 36 ) statement
  ⇒  mientras ( ! meta && mes < 36 ) assignment
  ⇒  mientras ( ! meta && mes < 36 ) mes = expr ;
  ⇒  mientras ( ! meta && mes < 36 ) mes = andE ;
  ⇒  mientras ( ! meta && mes < 36 ) mes = eqE ;
  ⇒  mientras ( ! meta && mes < 36 ) mes = relE ;
  ⇒  mientras ( ! meta && mes < 36 ) mes = addE ;
  ⇒  mientras ( ! meta && mes < 36 ) mes = addE + mulE ;
  ⇒  mientras ( ! meta && mes < 36 ) mes = mulE + mulE ;
  ⇒  mientras ( ! meta && mes < 36 ) mes = unE + mulE ;
  ⇒  mientras ( ! meta && mes < 36 ) mes = prim + mulE ;
  ⇒  mientras ( ! meta && mes < 36 ) mes = mes + mulE ;
  ⇒  mientras ( ! meta && mes < 36 ) mes = mes + unE ;
  ⇒  mientras ( ! meta && mes < 36 ) mes = mes + prim ;
  ⇒  mientras ( ! meta && mes < 36 ) mes = mes + 1 ;
```

**3.** `para i desde 1 hasta 12 saldo = saldo * tem;`  (desde `forStmt`)
```
forStmt
  ⇒  para i desde expr hasta expr statement
  ⇒  para i desde andE hasta expr statement
  ⇒  para i desde eqE hasta expr statement
  ⇒  para i desde relE hasta expr statement
  ⇒  para i desde addE hasta expr statement
  ⇒  para i desde mulE hasta expr statement
  ⇒  para i desde unE hasta expr statement
  ⇒  para i desde prim hasta expr statement
  ⇒  para i desde 1 hasta expr statement
  ⇒  para i desde 1 hasta andE statement
  ⇒  para i desde 1 hasta eqE statement
  ⇒  para i desde 1 hasta relE statement
  ⇒  para i desde 1 hasta addE statement
  ⇒  para i desde 1 hasta mulE statement
  ⇒  para i desde 1 hasta unE statement
  ⇒  para i desde 1 hasta prim statement
  ⇒  para i desde 1 hasta 12 statement
  ⇒  para i desde 1 hasta 12 assignment
  ⇒  para i desde 1 hasta 12 saldo = expr ;
  ⇒  para i desde 1 hasta 12 saldo = andE ;
  ⇒  para i desde 1 hasta 12 saldo = eqE ;
  ⇒  para i desde 1 hasta 12 saldo = relE ;
  ⇒  para i desde 1 hasta 12 saldo = addE ;
  ⇒  para i desde 1 hasta 12 saldo = mulE ;
  ⇒  para i desde 1 hasta 12 saldo = mulE * unE ;
  ⇒  para i desde 1 hasta 12 saldo = unE * unE ;
  ⇒  para i desde 1 hasta 12 saldo = prim * unE ;
  ⇒  para i desde 1 hasta 12 saldo = saldo * unE ;
  ⇒  para i desde 1 hasta 12 saldo = saldo * prim ;
  ⇒  para i desde 1 hasta 12 saldo = saldo * tem ;
```

**4.** `para k desde 1 hasta meses { n = n + 1; }`  (desde `forStmt`)
```
forStmt
  ⇒  para k desde expr hasta expr statement
  ⇒  para k desde andE hasta expr statement
  ⇒  para k desde eqE hasta expr statement
  ⇒  para k desde relE hasta expr statement
  ⇒  para k desde addE hasta expr statement
  ⇒  para k desde mulE hasta expr statement
  ⇒  para k desde unE hasta expr statement
  ⇒  para k desde prim hasta expr statement
  ⇒  para k desde 1 hasta expr statement
  ⇒  para k desde 1 hasta andE statement
  ⇒  para k desde 1 hasta eqE statement
  ⇒  para k desde 1 hasta relE statement
  ⇒  para k desde 1 hasta addE statement
  ⇒  para k desde 1 hasta mulE statement
  ⇒  para k desde 1 hasta unE statement
  ⇒  para k desde 1 hasta prim statement
  ⇒  para k desde 1 hasta meses statement
  ⇒  para k desde 1 hasta meses block
  ⇒  para k desde 1 hasta meses { stmtList }
  ⇒  para k desde 1 hasta meses { statement stmtList }
  ⇒  para k desde 1 hasta meses { assignment stmtList }
  ⇒  para k desde 1 hasta meses { n = expr ; stmtList }
  ⇒  para k desde 1 hasta meses { n = andE ; stmtList }
  ⇒  para k desde 1 hasta meses { n = eqE ; stmtList }
  ⇒  para k desde 1 hasta meses { n = relE ; stmtList }
  ⇒  para k desde 1 hasta meses { n = addE ; stmtList }
  ⇒  para k desde 1 hasta meses { n = addE + mulE ; stmtList }
  ⇒  para k desde 1 hasta meses { n = mulE + mulE ; stmtList }
  ⇒  para k desde 1 hasta meses { n = unE + mulE ; stmtList }
  ⇒  para k desde 1 hasta meses { n = prim + mulE ; stmtList }
  ⇒  para k desde 1 hasta meses { n = n + mulE ; stmtList }
  ⇒  para k desde 1 hasta meses { n = n + unE ; stmtList }
  ⇒  para k desde 1 hasta meses { n = n + prim ; stmtList }
  ⇒  para k desde 1 hasta meses { n = n + 1 ; stmtList }
  ⇒  para k desde 1 hasta meses { n = n + 1 ; }
```

## Préstamos y reportes

**1.** `prestamo p { monto: 1000 PEN; tea: 10%; plazo: 12; }`  (desde `loanDecl`)
```
loanDecl
  ⇒  prestamo p { monto : expr ; tea : expr ; plazo : expr ; }
  ⇒  prestamo p { monto : andE ; tea : expr ; plazo : expr ; }
  ⇒  prestamo p { monto : eqE ; tea : expr ; plazo : expr ; }
  ⇒  prestamo p { monto : relE ; tea : expr ; plazo : expr ; }
  ⇒  prestamo p { monto : addE ; tea : expr ; plazo : expr ; }
  ⇒  prestamo p { monto : mulE ; tea : expr ; plazo : expr ; }
  ⇒  prestamo p { monto : unE ; tea : expr ; plazo : expr ; }
  ⇒  prestamo p { monto : prim ; tea : expr ; plazo : expr ; }
  ⇒  prestamo p { monto : 1000 PEN ; tea : expr ; plazo : expr ; }
  ⇒  prestamo p { monto : 1000 PEN ; tea : andE ; plazo : expr ; }
  ⇒  prestamo p { monto : 1000 PEN ; tea : eqE ; plazo : expr ; }
  ⇒  prestamo p { monto : 1000 PEN ; tea : relE ; plazo : expr ; }
  ⇒  prestamo p { monto : 1000 PEN ; tea : addE ; plazo : expr ; }
  ⇒  prestamo p { monto : 1000 PEN ; tea : mulE ; plazo : expr ; }
  ⇒  prestamo p { monto : 1000 PEN ; tea : unE ; plazo : expr ; }
  ⇒  prestamo p { monto : 1000 PEN ; tea : prim ; plazo : expr ; }
  ⇒  prestamo p { monto : 1000 PEN ; tea : 10% ; plazo : expr ; }
  ⇒  prestamo p { monto : 1000 PEN ; tea : 10% ; plazo : andE ; }
  ⇒  prestamo p { monto : 1000 PEN ; tea : 10% ; plazo : eqE ; }
  ⇒  prestamo p { monto : 1000 PEN ; tea : 10% ; plazo : relE ; }
  ⇒  prestamo p { monto : 1000 PEN ; tea : 10% ; plazo : addE ; }
  ⇒  prestamo p { monto : 1000 PEN ; tea : 10% ; plazo : mulE ; }
  ⇒  prestamo p { monto : 1000 PEN ; tea : 10% ; plazo : unE ; }
  ⇒  prestamo p { monto : 1000 PEN ; tea : 10% ; plazo : prim ; }
  ⇒  prestamo p { monto : 1000 PEN ; tea : 10% ; plazo : 12 ; }
```

**2.** `mostrar "Cuota:", cuota(auto);`  (desde `printStmt`)
```
printStmt
  ⇒  mostrar expr exprTail ;
  ⇒  mostrar andE exprTail ;
  ⇒  mostrar eqE exprTail ;
  ⇒  mostrar relE exprTail ;
  ⇒  mostrar addE exprTail ;
  ⇒  mostrar mulE exprTail ;
  ⇒  mostrar unE exprTail ;
  ⇒  mostrar prim exprTail ;
  ⇒  mostrar "Cuota:" exprTail ;
  ⇒  mostrar "Cuota:" , expr exprTail ;
  ⇒  mostrar "Cuota:" , andE exprTail ;
  ⇒  mostrar "Cuota:" , eqE exprTail ;
  ⇒  mostrar "Cuota:" , relE exprTail ;
  ⇒  mostrar "Cuota:" , addE exprTail ;
  ⇒  mostrar "Cuota:" , mulE exprTail ;
  ⇒  mostrar "Cuota:" , unE exprTail ;
  ⇒  mostrar "Cuota:" , prim exprTail ;
  ⇒  mostrar "Cuota:" , cuota ( auto ) exprTail ;
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
  ⇒  mostrar andE exprTail ;
  ⇒  mostrar eqE exprTail ;
  ⇒  mostrar relE exprTail ;
  ⇒  mostrar addE exprTail ;
  ⇒  mostrar mulE exprTail ;
  ⇒  mostrar unE exprTail ;
  ⇒  mostrar prim exprTail ;
  ⇒  mostrar interesTotal ( auto ) exprTail ;
  ⇒  mostrar interesTotal ( auto ) ;
```
