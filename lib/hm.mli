type syn_expr
type syn_lit
type syn_type
type syn_decl
type syn_prog

val decl_of : string -> syn_expr -> syn_decl

val prog_of : syn_decl list -> syn_expr -> syn_prog

val type_of_name : string -> syn_type option
val name_of_type : syn_type -> string

val lit_bool : bool -> syn_lit
val lit_int : int -> syn_lit

val lit_expr : syn_lit -> syn_expr
val var_expr : string -> syn_expr
val app_expr : syn_expr -> syn_expr -> syn_expr
val lam_expr : string -> syn_expr -> syn_expr
val let_expr : string -> syn_expr -> syn_expr -> syn_expr
val ann_expr : syn_type -> syn_expr -> syn_expr

val check_type : syn_type -> syn_expr -> bool
val infer_type : syn_expr -> syn_type option
