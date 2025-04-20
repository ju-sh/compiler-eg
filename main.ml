let main () =
  let lexbuf = Lexing.from_channel stdin in
  let ast =
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
    let _ = ast in
    let asm = Asm.from_ast ast in
    Printf.printf "%s\n%s\n"
      (* No need of executable stack *)
      ".section .note.GNU-stack,\"\",@progbits"
      (Asm.string_of_asm asm)

let () = main ()
