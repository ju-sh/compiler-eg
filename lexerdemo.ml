let get_tokens lexbuf = 
  let rec go acc =
    match Lexer.lex lexbuf with
    | Token.EOF -> acc
    | tok -> go (tok::acc)
  in go [] |> List.rev


(* The name need not be 'main' as long it is used at the end.
   Apparently, dune is not too strict about name of entrypoint *)
let main () =
  let lexbuf = Lexing.from_channel stdin in
  (* let lexbuf = Lexing.from_string "int main() { return 0 }" in *)
  let toks = get_tokens lexbuf in
  toks
    |> List.map Token.string_of_t
    |> String.concat ", "
    |> Printf.printf "%s"


let () = main ()
