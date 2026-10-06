"""Ejecuta todos los .fin de tests/ y compara con la línea '// ESPERA: ...'."""
import glob, re, sys
from main import analyze

ok = fail = 0
for path in sorted(glob.glob("tests/*.fin")):
    text = open(path, encoding="utf-8").read()
    esperado = set(re.search(r"ESPERA:\s*(.*)", text).group(1).split())
    esperado.discard("OK")
    lex, syn, sem = analyze(text)
    obtenido = {re.match(r"\[(\w+)\]", e).group(1) for e in lex + syn + sem}
    good = obtenido == esperado
    ok += good; fail += not good
    print(("PASS" if good else "FAIL"), path, "esperado:", sorted(esperado), "obtenido:", sorted(obtenido))
print(f"\n{ok} OK, {fail} FAIL")
sys.exit(1 if fail else 0)
