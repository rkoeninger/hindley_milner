type syn_expr
type syn_lit
type syn_type
type syn_scheme
type syn_decl
type syn_prog
type syn_env

val empty_env : syn_env
val add_env : string -> syn_scheme -> syn_env -> syn_env
val lookup_env : string -> syn_env -> syn_scheme option

val decl_of : string -> syn_expr -> syn_decl

val prog_of : syn_decl list -> syn_expr -> syn_prog

val name_of_type : syn_type -> string

val lit_bool : bool -> syn_lit
val lit_int : int -> syn_lit

val type_var : string -> syn_type
val type_con : string -> syn_type
val type_arr : syn_type -> syn_type -> syn_type

val type_int : syn_type
val type_bool : syn_type

(* TVar list -> Type -> Scheme *)
val for_all : string list -> syn_type -> syn_scheme

val lit_expr : syn_lit -> syn_expr
val var_expr : string -> syn_expr
val app_expr : syn_expr -> syn_expr -> syn_expr
val lam_expr : string -> syn_expr -> syn_expr
val let_expr : string -> syn_expr -> syn_expr -> syn_expr
val ann_expr : syn_type -> syn_expr -> syn_expr

val check_type : syn_type -> syn_expr -> bool
val infer_type : syn_expr -> syn_type option
