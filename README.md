# FinLang — DSL para finanzas personales y préstamos

Compilador (Hito 1): analizador léxico, sintáctico y semántico con **ANTLR4 + Python**.

## Requisitos
- Java 11+ y Python 3.9+
- `antlr-4.13.1-complete.jar` y `pip install -r requirements.txt`

## Puesta en marcha
    ./setup.sh                      # descarga ANTLR, instala runtime y genera gen/
    # o a mano:
    java -jar antlr-4.13.1-complete.jar -Dlanguage=Python3 -visitor -no-listener -o gen FinLang.g4

## Uso
    python main.py tests/valido_03_prestamo.fin             # análisis completo
    python main.py tests/valido_03_prestamo.fin --tokens    # analizador léxico
    python main.py tests/valido_01_basico.fin --tree        # árbol sintáctico
    python run_tests.py                                     # 23 casos → 23 OK, 0 FAIL
    ./demo.sh                                               # secuencia del video

## Ejemplo
    prestamo auto { monto: 30000 USD; tea: 12%; plazo: 36; }
    dinero cuota1 = cuota(auto);
    dinero[PEN] enSoles = convertir(cuota1, PEN, 3.75);
    si (enSoles > 1500 PEN) { mostrar "Cuota alta"; }
    cronograma auto;

## Errores semánticos (E01–E10)
E01 variable no declarada · E02 duplicado · E03 tipos incompatibles · E04 mezcla de monedas ·
E05 operación inválida · E06 tasa negativa/fuera de (0%,100%] · E07 monto/plazo inválido ·
E08 condición no booleana · E09 no es un préstamo · E10 dinero sin moneda.

## Estructura
- `FinLang.g4` gramática léxica y sintáctica (ANTLR4)
- `semantic.py` analizador semántico (tabla de símbolos por ámbito, tipos con moneda)
- `main.py` driver · `run_tests.py` + `tests/` casos (`// ESPERA: ...`)
- `tools/derivaciones.py` genera las derivaciones más a la izquierda a partir de la CFG
- `docs/` informe (docx/pdf), presentación (pptx/pdf), derivaciones
