$ jbuilder build @install @runtest
    ocamldep bin/main.depends.ocamldep-output
    ocamldep lib/hm.depends.ocamldep-output
      ocamlc lib/hm.{cmi,cmo,cmt}
    ocamlopt lib/hm.{cmx,o}
      ocamlc bin/main.{cmi,cmo,cmt}
      ocamlc lib/hm.cma
    ocamlopt lib/hm.{a,cmxa}
    ocamlopt bin/main.{cmx,o}
    ocamlopt lib/hm.cmxs
    ocamlopt bin/main.exe
          hm test/hm.output
        diff alias test/runtest
