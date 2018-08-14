type syn_expr =
  | Var of string
  | App of syn_expr * syn_expr list
  | Abs of string * syn_expr
  | Let of string * syn_expr * syn_expr
  | Ann of syn_type * syn_expr

and syn_type = string

let check_type _ _ = true

let infer_type expr =
  match expr with
  | Var _ -> Some "var"
  | App(_, _) -> Some "app"
  | Abs(_, _) -> Some "abs"
  | Let(_, _, _) -> Some "let"
  | Ann(t, _) -> Some t
