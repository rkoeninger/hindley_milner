open Hm

let check msg x = Alcotest.(check bool) msg true x

exception Opt_none

let get_opt = function
  | Some x -> x
  | None -> raise Opt_none

let inference () =
  check "Dummy infer" (type_of_name "var" = (var_expr "x" |> infer_type));
  check "Trivial infer of ann" (type_of_name "t" = (ann_expr (type_of_name "t" |> get_opt) (var_expr "x") |> infer_type))

let tests = [
  "inference", `Quick, inference;
]

let test_suites: unit Alcotest.test list = [
  "inference", tests
]

let () = Alcotest.run "Hm" test_suites
