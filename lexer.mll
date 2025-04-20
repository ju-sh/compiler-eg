{
open Token

let keyword_table = Hashtbl.create 53
let _ =
  List.iter (fun (kwd, tok) -> Hashtbl.add keyword_table kwd tok)
    [ "int", Keyword Int;
      "void", Keyword Void;
      "return", Keyword Return ]
}

let whitespace = [' ' '\t']
let digit = ['0'-'9']
let letter = ['A'-'Z' 'a'-'z']
let non_digit = '_' | letter
let ident = non_digit (non_digit | digit)*

let line_comment = "//" [^'\n']*

rule lex = parse 
    whitespace 
      {
        (* skip blanks *)
        lex lexbuf
      }     

  | digit+ as lxm
      {
        Literal (Integer (int_of_string lxm))
      }

  | ';'    { SemiColon }
  | '('    { ParenL }
  | ')'    { ParenR }
  | '{'    { BraceL }
  | '}'    { BraceR }
  (* and rule2 = parse *)
  | ident as idstr
      {
        try
          Hashtbl.find keyword_table idstr
        with Not_found ->
          Identifier idstr
      }
  | eof    { EOF }
