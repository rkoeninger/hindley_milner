type syn_type = string

type syn_lit =
  | Bool of bool
  | Int of int

type syn_expr =
  | Lit of syn_lit
  | Var of string
  | App of syn_expr * syn_expr
  | Lam of string * syn_expr
  | Let of string * syn_expr * syn_expr
  | Ann of syn_type * syn_expr

let type_of_name name = Some name
let name_of_type name = name

let lit_bool b = Bool b
let lit_int i = Int i

let lit_expr lit = Lit lit
let var_expr name = Var name
let app_expr f x = App(f, x)
let lam_expr param body = Lam(param, body)
let let_expr name value body = Let(name, value, body)
let ann_expr t expr = Ann(t, expr)

let check_type _ _ = true

let infer_type = function
  | Lit(Bool _) -> Some "bool"
  | Lit(Int _) -> Some "int"
  | Var _ -> Some "var"
  | App(_, _) -> Some "app"
  | Lam(_, _) -> Some "lam"
  | Let(_, _, _) -> Some "let"
  | Ann(t, _) -> Some t
