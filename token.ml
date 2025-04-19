type literal = Integer of int

type keyword
  = Int
  | Void
  | Return

type t
  = Keyword of keyword
  | Literal of literal
  | Identifier of string
  | ParenL      (* ( *)
  | ParenR      (* ) *)
  | BraceL      (* { *)
  | BraceR      (* } *)
  | SemiColon   (* Semi-colon *)
  | WhiteSpace  (* White space *)
  | EOF         (* White space *)

let string_of_t tok =
  match tok with
    Keyword kw ->
      (match kw with
        Int -> "Int"
      | Void -> "Void"
      | Return -> "Return")
  | Literal (Integer n) -> string_of_int n
  | Identifier s -> "ID " ^ s
  | ParenL -> "ParenL"
  | ParenR -> "ParenR"
  | BraceL -> "BraceL" 
  | BraceR -> "BraceR"
  | SemiColon -> "SemiColon"
  | WhiteSpace -> "WhiteSpace"
  | EOF -> "EOF"
