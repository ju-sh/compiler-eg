type t
  = SParse
  | SIr
  | SAsm
  | SComp
  | SOpt

let sem = function
  | SParse -> 1
  | SIr -> 2
  | SAsm -> 3
  | SComp -> 4
  | SOpt -> 5

let compare x y = compare (sem x) (sem y)
