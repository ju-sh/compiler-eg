open Ast

type reg
  = EAX

type operand
  = Reg of reg
  | Imm of int

type instr
  = MOV of operand * operand
  | RET

type func = Func of string * instr list
type prog = Prog of func

let from_ast = function
  | Ast.Prog
      (Ast.Func (_, ident, Ast.Return (Literal (Integer n)))) ->
        Prog (Func (ident, [MOV (Imm n, Reg EAX)]))

let string_of_reg = function
  | EAX -> "%EAX"

let string_of_operand = function
  | Reg r -> string_of_reg r
  | Imm n -> "IMM" ^ (string_of_int n)

let string_of_instr = function
  | MOV (a, b) ->
     let stra = string_of_operand a in
     let strb = string_of_operand b in
     "MOV " ^ stra ^ " " ^ strb
  | RET -> "RET"

let string_of_asm = function
  | Prog (Func (_, ilist)) ->
      ilist |> List.map string_of_instr |> String.concat "\n"
    
