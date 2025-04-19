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
    [' ' '\t']     { token lexbuf }     (* skip blanks *)
  | ['0'-'9']+ as lxm { INT(int_of_string lxm) }
  | '('            { TokLPar }
  | ')'            { TokRPar }
  | '{'            { TokLBrace }
  | '}'            { TokLBrace }
  | '}'            { TokLBrace }
  (* and rule2 = parse *)
  | ['A'-'Z' 'a'-'z'] ['A'-'Z' 'a'-'z' '0'-'9' '_'] * as id
      {
        try
          Hashtbl.find keyword_table idstr
        with Not_found ->
          Identifier idstr
      }
