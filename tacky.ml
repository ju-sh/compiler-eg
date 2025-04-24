(* A = Ast *)

type literal = Integer of int

type value
  = Literal of literal
  | Var of string

type unop
  = Complement
  | Negate

type instr
  = Unop of unop * value * value  (* operate on src, store in dst *)
  | Return of value

type func = Func of string * instr list
type prog = Prog of func

(* let rec from_ast = function *)

let from_ast =
  let of_literal = function
    | Ast.Integer n -> Integer n
  let of_unop = function
    match op with
      Ast.Complement -> Complement
    | Ast.Negate -> Negate
  let rec of_expr = function
      Ast.Literal lit -> Literal (of_literal lit)
    | Ast.Unop (op, e) -> Unop (of_unop op) (of_expr e)
  let of_stmt = function
      Ast.Return e -> Return (of_expr e)
  let of_func = function
      Ast.Func (ty, name, st) ->
  let of_prog = function
      Ast.Prog f -> 
    function
  | Ast.Prog
      (Ast.Func (_, ident, Ast.Return (Literal (Integer n)))) ->
        Prog (Func (ident, [MOV (Imm n, Reg EAX)]))
