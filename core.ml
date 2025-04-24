open Stage

let main stage =
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
    if (compare stage SParse) == 0 then
      Printf.printf "%s\n"
        (Ast.string_of_prog ast)
    else
      Printf.printf "Not yet implemented"
    (*
    let asm = Asm.from_ast ast in
    Printf.printf "%s\n%s\n"
      (* No need of executable stack *)
      ".section .note.GNU-stack,\"\",@progbits"
      (Asm.string_of_asm asm)
     *)
