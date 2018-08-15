type syn_expr
type syn_type

val type_of_name : string -> syn_type option
val name_of_type : syn_type -> string

val var_expr : string -> syn_expr
val ann_expr : syn_type -> syn_expr -> syn_expr

val check_type : syn_type -> syn_expr -> bool
val infer_type : syn_expr -> syn_type option
