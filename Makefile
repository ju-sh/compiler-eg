build: lexer.mll
	ocamllex lexer.mll
	ocamlc -o a.out token.ml lexer.ml main.ml

clean:
	rm -f *.cmi *.cmo a.out lexer.ml
