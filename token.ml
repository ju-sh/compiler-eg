type keyword = KwInt | KwVoid | KwReturn

type literal = LitInt of int

type t
  = TokKeyword of keyword
  | TokLit of literal
  | TokIdentifier of string
  | TokLPar | TokRPar
  | TokLBrace | TokRBrace
  | TokSC   (* Semi-colon *)
  | TokWS   (* White space *)
  | TokEOF  (* White space *)

let string_of_t tok =
  match tok with
    TokKeyword kw ->
      (match kw with
        KwInt -> "Int"
      | KwVoid -> "Void"
      | KwReturn -> "Return")
  | TokLit (LitInt n) -> string_of_int n
  | TokIdentifier s -> s
  | TokLPar -> "("
  | TokRPar -> ")"
  | TokLBrace -> "{" 
  | TokRBrace -> "}"
  | TokSC -> "SC"
  | TokWS -> "WS"
  | TokEOF -> "EOF"
