type keyword = KwInt | KwVoid | KwReturn

type literal = LitInt of int

type t
  = TokKeyword of keyword
  | TokLit of literal
  | TokIdentifier of string
  | TokLPar | TokRPar
  | TokLBrace | TokRBrace
  | TokSC
