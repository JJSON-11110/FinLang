#!/usr/bin/env bash
# Secuencia del video (≤ 5 min). Presiona ENTER entre pasos.
paso() { echo; echo "\$ $*"; read -r _; "$@"; }
clear
echo "== FinLang: demo del compilador (Hito 1) =="; read -r _
paso cat tests/valido_03_prestamo.fin
paso python main.py tests/valido_03_prestamo.fin --tokens
paso python main.py tests/valido_01_basico.fin --tree
paso python main.py tests/valido_03_prestamo.fin
paso python main.py tests/err_E04.fin
paso python main.py tests/err_E06_negativa.fin
paso python main.py tests/err_multiple.fin
paso python main.py tests/err_lexico.fin
paso python main.py tests/err_sintaxis.fin
paso python run_tests.py
