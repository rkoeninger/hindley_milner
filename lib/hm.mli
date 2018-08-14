type syn_expr
type syn_type

val check_type : syn_type -> syn_expr -> bool
val infer_type : syn_expr -> syn_type option
