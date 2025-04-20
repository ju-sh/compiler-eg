type identifier = string

type typ = TyInt
type literal = Integer of int
type expr = Literal of literal
type stmt = Return of expr
type func = Func of typ * identifier * stmt
type prog = Prog of func

let string_of_typ = function
  | TyInt -> "TyInt"

let string_of_literal = function
  | Integer n -> string_of_int n

let string_of_expr = function
  | Literal of lit -> string_of_literal lit

let string_of_stmt = function
  | Return e -> "Return(" ^ string_of_expr e ^ ")"

let string_of_func = function
  | Func (ty, ident, stm) ->
      "Func(" ^ string_of_typ ty ^ ", " ^ ident ^ ", " ^ string_of_stmt s ^ ")"

let string_of_prog = function
  | Prog f -> "Prog(" ^ string_of_func f ^ ")"
