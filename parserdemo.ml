let main () =
  (* let lexbuf = Lexing.from_string "int main() { return 0 }" in *)
  let lexbuf = Lexing.from_channel stdin in
  let res =
    try
      Parser.prog Lexer.lex lexbuf
    with
    | Lexer.Error ch ->
        Printf.fprintf stderr
          "Lex error: Line %d, Char: %c\n"
          lexbuf.lex_curr_p.pos_lnum
          ch;
        exit 1
    | Parser.Error ->
        Printf.fprintf stderr
          "Parse error: Line %d\n"
          lexbuf.lex_curr_p.pos_lnum;
        exit 1
  in 
    let _ = res in
    Printf.printf "%s\n" (Ast.string_of_prog res)

let () = main ()

