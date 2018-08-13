module HindleyMilner :
  sig

    (* type syn_type = string

    type syn_expr =
      | Var of string
      | App of syn_expr * syn_expr list
      | Abs of string * syn_expr
      | Let of string * syn_expr * syn_expr
      | Ann of syn_type * syn_expr

    val infer_type : syn_expr -> syn_type
    val check_type : syn_expr -> bool *)

    val f : int -> int

  end
