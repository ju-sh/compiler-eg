{
open Token

let keyword_table = Hashtbl.create 53
let _ =
  List.iter (fun (kwd, tok) -> Hashtbl.add keyword_table kwd tok)
    [ "int", TokKeyword KwInt;
      "void", TokKeyword KwVoid;
      "return", TokKeyword KwReturn ]
}

rule token = parse 
    [' ' '\t']        { token lexbuf }     (* skip blanks *)
  | ['0'-'9']+ as lxm { TokLit (LitInt (int_of_string lxm)) }
  | '('               { TokLPar }
  | ')'               { TokRPar }
  | '{'               { TokLBrace }
  | '}'               { TokRBrace }
  (* and rule2 = parse *)
  | ['A'-'Z' 'a'-'z' '_' ] ['A'-'Z' 'a'-'z' '0'-'9' '_'] * as idstr
      {
        try
          Hashtbl.find keyword_table idstr
        with Not_found ->
          TokIdentifier idstr
      }
