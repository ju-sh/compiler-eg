{
open Token

let keyword_table = Hashtbl.create 53
let _ =
  List.iter (fun (kwd, tok) -> Hashtbl.add keyword_table kwd tok)
    [ "int", Keyword Int;
      "void", Keyword Void;
      "return", Keyword Return ]
}

rule lex = parse 
    [' ' '\t']
      {
        (* skip blanks *)
        lex lexbuf
      }     

  | ['0'-'9']+ as lxm
      {
        Literal (Integer (int_of_string lxm))
      }

  | ';'    { SemiColon }
  | '('    { ParenL }
  | ')'    { ParenR }
  | '{'    { BraceL }
  | '}'    { BraceR }
  (* and rule2 = parse *)
  | ['A'-'Z' 'a'-'z' '_' ] ['A'-'Z' 'a'-'z' '0'-'9' '_'] * as idstr
      {
        try
          Hashtbl.find keyword_table idstr
        with Not_found ->
          Identifier idstr
      }
  | eof    { EOF }
