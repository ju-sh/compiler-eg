let get_tokens lexbuf = 
  let rec go acc =
    match Lexer.lex lexbuf with
    | Token.EOF -> acc
    | tok -> go (tok::acc)
  in go [] |> List.rev

(*
let rec go tokens =
  let t = Lexer.token lbuf in
  let tokens = t :: tokens in
  if t = Token.EOF then
    List.rev tokens
  else (go [@tailcall]) tokens  
  *)

(* The name need not be 'main' as long it is used at the end.
   Apparently, dune is not too strict about name of entrypoint *)
let main () =
  let lexbuf = Lexing.from_channel stdin in
  (* let lexbuf = Lexing.from_string "int main() { return 0 }" in *)
  let toks = get_tokens lexbuf in
  toks
    |> List.map Token.string_of_t
    |> String.concat ", "
    |> Printf.printf "\n%s\n"


let () = main ()
