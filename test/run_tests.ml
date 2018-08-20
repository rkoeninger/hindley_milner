open Hm

let (<<) f g x = f(g(x))

exception Opt_none

let get_opt = function
  | Some x -> x
  | None -> raise Opt_none

let test desc f = desc, `Quick, (Alcotest.(check bool) desc true << f)

let () = Alcotest.run "Hm" [
    "inference", [
      test "lit infer" (fun () ->
        type_int = (lit_expr (lit_int 5) |> infer_type |> get_opt)
      );
      test "var infer" (fun () ->
        type_con "var" = (var_expr "x" |> infer_type |> get_opt)
      );
      test "ann infer" (fun () ->
        let t = type_con "t" in
          t = (ann_expr t (var_expr "x") |> infer_type |> get_opt)
      );
    ]
  ]
