module HindleyMilner : sig

  type syn_expr =
    | Var of string
    | App of syn_expr * syn_expr list
    | Abs of string * syn_expr
    | Let of string * syn_expr * syn_expr

end
