#!/usr/bin/env bash
# Descarga ANTLR, instala el runtime y genera el lexer/parser en ./gen
set -e
JAR=antlr-4.13.1-complete.jar
[ -f "$JAR" ] || curl -L -o "$JAR" https://www.antlr.org/download/$JAR
pip install -r requirements.txt
java -jar "$JAR" -Dlanguage=Python3 -visitor -no-listener -o gen FinLang.g4
echo "Listo. Prueba con: python run_tests.py"
