{
open Parser

(* C has 32 keywords *)
let keyword_table = Hashtbl.create 35

let _ =
  List.iter (fun (kwd, tok) -> Hashtbl.add keyword_table kwd tok)
    [ "int", INT;
      "void", VOID;
      "return", RETURN ]
}

let whitespace = [' ' '\t']
let digit = ['0'-'9']
let letter = ['A'-'Z' 'a'-'z']
let non_digit = '_' | letter
let ident = non_digit (non_digit | digit)*

(* let line_comment = "//" [^'\n']* *)

rule lex = parse 
    whitespace 
      {
        (* skip blanks *)
        lex lexbuf
      }     

  | digit+ as lxm
      { INTVAL(int_of_string lxm) }

  | '\n'
      {
        Lexing.new_line lexbuf;
        lex lexbuf 
      }
  | ';'    { SEMICOLON }
  | '('    { PARENL }
  | ')'    { PARENR }
  | '{'    { BRACEL }
  | '}'    { BRACER }
  (* and rule2 = parse *)
  | ident as idstr
      {
        try
          Hashtbl.find keyword_table idstr
        with Not_found ->
          IDENT(idstr)
      }
  | eof    { EOF }
