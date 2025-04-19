{
open Token

let toks = ref []

let keyword_table = Hashtbl.create 53
let _ =
  List.iter (fun (kwd, tok) -> Hashtbl.add keyword_table kwd tok)
    [ "int", TokKeyword KwInt;
      "void", TokKeyword KwVoid;
      "return", TokKeyword KwReturn ]
}

rule token = parse 
    [' ' '\t']
      {
        toks := (lexbuf, TokWS)::!toks;

        (* skip blanks *)
        token lexbuf
      }     

  | ['0'-'9']+ as lxm
      {
        let res = TokLit (LitInt (int_of_string lxm)) in
        toks := (lexbuf, res)::!toks;
        res
      }

  | ';' 
      {
        let res = TokSC in
        toks := (lexbuf, res)::!toks;
        res
      }

  | '(' 
      {
        let res = TokLPar in
        toks := (lexbuf, res)::!toks;
        res
      }
  | ')'
      {
        let res = TokRPar in
        toks := (lexbuf, res)::!toks;
        res
      }
  | '{'
      {
        let res = TokLBrace in
        toks := (lexbuf, res)::!toks;
        res
      }
  | '}'
      {
        let res = TokRBrace in
        toks := (lexbuf, res)::!toks;
        res
      }
  (* and rule2 = parse *)
  | ['A'-'Z' 'a'-'z' '_' ] ['A'-'Z' 'a'-'z' '0'-'9' '_'] * as idstr
      {
        let res =
          try
            Hashtbl.find keyword_table idstr
          with Not_found ->
            TokIdentifier idstr
          in
        toks := (lexbuf, res)::!toks;
        res
      }
  | eof
      {
        let res = TokEOF in
        toks := (lexbuf, res)::!toks;
        res
      }
