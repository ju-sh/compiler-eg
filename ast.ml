type identifier = string

type typ = TyInt
type literal = Integer of int

type unop
  = Complement
  | Negate

type expr
  = Literal of literal
  | Unop of unop * expr

type stmt = Return of expr
type func = Func of typ * identifier * stmt
type prog = Prog of func

let string_of_typ = function
  | TyInt -> "TyInt"

let string_of_literal = function
  | Integer n -> string_of_int n

let string_of_unop = function
  | Complement -> "Complement"
  | Negate -> "Negate"

let rec string_of_expr = function
  | Literal lit -> string_of_literal lit
  | Unop (op, e) -> (string_of_unop op) ^ " ("  ^ (string_of_expr e)

let string_of_stmt = function
  | Return e -> "Return(" ^ string_of_expr e ^ ")"

let string_of_func = function
  | Func (ty, ident, stm) ->
      "Func(" ^
      string_of_typ ty ^
      ", " ^
      ident ^
      ", " ^
      string_of_stmt stm ^
      ")"

let string_of_prog = function
  | Prog f -> "Prog(" ^ string_of_func f ^ ")"

(* (1* Pretty printer *1) *)
(* let pp *)
(*   indlvl (1* indentation level *1) *)
(*   arg =  (1* AST term *1) *)
(*   match arg with *)
(*   | Func (ty, ident, stm) -> *)


(*
 * AST grammar 
 *
prog := func
func := ident stmt
stmt := return expr
expr := Const int
      | Unop unop expr
unop := Complement
      | Negate 
 *)
