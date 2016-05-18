ocamlfind ocamlc -package js_of_ocaml -package js_of_ocaml.ppx -linkpkg -o lib-full.byte lib.ml

ocamlfind stdlib/expunge lib-full.byte lib.byte Pervasives Lib

js_of_ocaml --no-cmis --toplevel lib.byte

ocamlfind ocamlc -c plugin.ml

js_of_ocaml plugin.cmo
