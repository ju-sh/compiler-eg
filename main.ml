(* The name need not be 'main' as long it is used at the end.
   Apparently, dune is not too strict about name of entrypoint *)
let main () =
  let lexbuf = Lexing.from_string "int main() { return 0 }" in
  (* let lexbuf = Lexing.from_channel stdin in *)
  let _ = Lexer.token lexbuf in
  !Lexer.toks |> List.map (fun (_, tk) -> Token.string_of_t tk) |> String.concat ", " |> Printf.printf "%s"


let () = main ()
