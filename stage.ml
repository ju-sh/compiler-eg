type t
  = SParse   (* Lexing and parsing *)
  | SIr      (* IR generation *)
  | SAsm     (* ASM generation *)
  | SComp    (* Compile *)
  | SOpt     (* Compile with optimization *)

let sem = function
  | SParse -> 0
  | SIr -> 1
  | SAsm -> 2
  | SComp -> 3
  | SOpt -> 4

let compare x y = compare (sem x) (sem y)
