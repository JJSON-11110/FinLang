"""Driver de FinLang.

Uso:
    python main.py archivo.fin             # análisis completo
    python main.py archivo.fin --tokens    # muestra tokens (analizador léxico)
    python main.py archivo.fin --tree      # muestra árbol sintáctico
"""
import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "gen"))

from antlr4 import InputStream, CommonTokenStream
from antlr4.error.ErrorListener import ErrorListener

from FinLangLexer import FinLangLexer
from FinLangParser import FinLangParser
from semantic import SemanticAnalyzer


class Collector(ErrorListener):
    def __init__(self, tag, sink):
        super().__init__()
        self.tag, self.sink = tag, sink

    def syntaxError(self, recognizer, offendingSymbol, line, column, msg, e):
        self.sink.append(f"[{self.tag}] Línea {line}:{column + 1} - {msg}")


def analyze(text, show_tokens=False, show_tree=False):
    """Devuelve (errores_lexicos, errores_sintacticos, errores_semanticos)."""
    lex_errors, syn_errors = [], []

    lexer = FinLangLexer(InputStream(text))
    lexer.removeErrorListeners()
    lexer.addErrorListener(Collector("LEX", lex_errors))
    stream = CommonTokenStream(lexer)
    stream.fill()

    # Los caracteres no reconocidos llegan como ERROR_CHAR
    for t in stream.tokens:
        if t.type == FinLangLexer.ERROR_CHAR:
            lex_errors.append(f"[LEX] Línea {t.line}:{t.column + 1} - carácter no reconocido '{t.text}'")

    if show_tokens:
        names = FinLangLexer.symbolicNames
        for t in stream.tokens:
            if t.type != -1:
                print(f"{names[t.type]:<14} {t.text!r:<20} ({t.line}:{t.column + 1})")

    if lex_errors:                    # no tiene sentido parsear con tokens inválidos
        return lex_errors, syn_errors, []

    parser = FinLangParser(stream)
    parser.removeErrorListeners()
    parser.addErrorListener(Collector("SIN", syn_errors))
    tree = parser.program()

    if show_tree:
        print(tree.toStringTree(recog=parser))

    sem_errors = []
    if not lex_errors and not syn_errors:
        sa = SemanticAnalyzer()
        sa.visit(tree)
        sem_errors = sa.errors
    return lex_errors, syn_errors, sem_errors


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        return 2
    with open(sys.argv[1], encoding="utf-8") as f:
        text = f.read()
    lex, syn, sem = analyze(text, "--tokens" in sys.argv, "--tree" in sys.argv)
    errors = lex + syn + sem
    for e in errors:
        print(e)
    if not errors:
        print("OK: análisis léxico, sintáctico y semántico sin errores.")
        return 0
    print(f"\n{len(errors)} error(es) encontrado(s).")
    return 1


if __name__ == "__main__":
    sys.exit(main())
