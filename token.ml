type keyword = KwInt | KwVoid | KwReturn

type identifier = Identifier string

type literal = LitInt of int

type t
  = TokKeyword of keyword
  | TokIdentifier
  | TokLPar | TokRPar
  | TokLBrace | TokRBrace
  | TokSC
