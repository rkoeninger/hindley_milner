type syn_type = string

type syn_expr =
  | Var of string
  | App of syn_expr * syn_expr list
  | Abs of string * syn_expr
  | Let of string * syn_expr * syn_expr
  | Ann of syn_type * syn_expr

let type_of_name name = Some name
let name_of_type name = name

let var_expr name = Var name
let ann_expr t expr = Ann(t, expr)

let check_type _ _ = true

let infer_type = function
  | Var _ -> Some "var"
  | App(_, _) -> Some "app"
  | Abs(_, _) -> Some "abs"
  | Let(_, _, _) -> Some "let"
  | Ann(t, _) -> Some t
