ocamlfind ocamlc -o lib.byte -package js_of_ocaml.ppx,js_of_ocaml.toplevel,js_of_ocaml.compiler -linkpkg -linkall  -I `opam config var lib`/ocaml/compiler-libs lib.ml

js_of_ocaml +dynlink.js +toplevel.js +weak.js --linkall --extern-fs --toplevel -I `opam config var lib`/ocaml/compiler-libs -I `opam confi var lib`/js_of_ocaml -I `opam config var lib`/lwt -I `opam config var lib`/base64 -I . lib.byte

ocamlfind ocamlc -c -package js_of_ocaml.ppx  -I `opam config var lib`/ocaml/compiler-libs plugin.ml

ocamlfind ocamlc -o dummy.byte -package js_of_ocaml.ppx dynlink.cma dummy.ml

js_of_ocaml -o plugin.js +toplevel.js  +dynlink.js +weak.js  -I ./ -I `opam config var lib`/ocaml/compiler-libs --file=plugin.cmo dummy.byte
#js_of_ocaml plugin.cmo


