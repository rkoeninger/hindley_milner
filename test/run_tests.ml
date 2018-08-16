open Hm

let (<<) f g x = f(g(x))

exception Opt_none

let get_opt = function
  | Some x -> x
  | None -> raise Opt_none

let test desc f = desc, `Quick, (Alcotest.(check bool) desc true << f)

let () = Alcotest.run "Hm" [
    "inference", [
      test "var infer" (fun () ->
        type_of_name "var" = (var_expr "x" |> infer_type)
      );
      test "ann infer" (fun () ->
        type_of_name "t" = (ann_expr (type_of_name "t" |> get_opt) (var_expr "x") |> infer_type)
      );
    ]
  ]
