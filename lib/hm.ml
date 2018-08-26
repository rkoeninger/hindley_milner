type syn_type =
  | TypeVar of string
  | TypeCon of string
  | TypeArr of syn_type * syn_type

type syn_scheme = string list * syn_type

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

type syn_decl = string * syn_expr
type syn_prog = syn_decl list * syn_expr

type syn_env = (string * syn_scheme) list

let empty_env = []
let add_env name sch env = (name, sch) :: env
let rec lookup_env name env =
  match env with
  | [] -> None
  | (n, s) :: _ when n == name -> Some s
  | _ :: rest -> lookup_env name rest

let decl_of name expr = (name, expr)
let prog_of decls main = (decls, main)

let rec name_of_type = function
  | TypeVar name -> name
  | TypeCon name -> name
  | TypeArr(k, t) -> name_of_type k ^ " " ^ name_of_type t

let lit_bool b = Bool b
let lit_int i = Int i

let type_var name = TypeVar name
let type_con name = TypeCon name
let type_arr k t = TypeArr(k, t)

let type_int = TypeCon "int"
let type_bool = TypeCon "bool"

let for_all vars t = (vars, t)

let lit_expr lit = Lit lit
let var_expr name = Var name
let app_expr f x = App(f, x)
let lam_expr param body = Lam(param, body)
let let_expr name value body = Let(name, value, body)
let ann_expr t expr = Ann(t, expr)

let check_type _ _ = true

let rec infer_type = function
  | Lit(Bool _) -> Some type_bool
  | Lit(Int _) -> Some type_int
  | Var _ -> Some(type_con "var")
  | App(_, _) -> Some(type_con "app")
  | Lam(_, _) -> Some(type_con "lam")
  | Let(_, _, body) -> infer_type body
  | Ann(t, _) -> Some t
