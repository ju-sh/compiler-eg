type typ = TyInt
type literal = Integer of int
type expr = Literal of literal
type identifier = Identifier of string
type stmt = Return of expr
type func = Func of typ * identifier * stmt
