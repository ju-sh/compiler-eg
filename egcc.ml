open Cmdliner
(* open Cmdliner.Term.Syntax *)
open Stage

let prompt =
  let sparse =
    let doc = "Parsing" in
    SParse, Arg.info ["p"] ~doc
  in
  let sIr =
    let doc = "IR generation" in
    SIr, Arg.info ["i"] ~doc
  in
  Arg.(vflag SParse [sparse; sIr])

(* let cmd_interface stage = Core.main stage *)

let main_cmd =
  let doc = "An example compiler for C-like programs" in
  let man = [
      `S Manpage.s_description;
      `S Manpage.s_bugs; `P "Report bugs to <ju-sh@example.org>.";
      `S Manpage.s_see_also; `P "$(b,ocamllex)(1), $(b,menhir)(2)" ]
  in  
  Cmd.v
    (Cmd.info "egcc" ~version:"%%VERSION%%" ~doc ~man)
    Term.(const Core.main $ Arg.value prompt)
  (* Cmd.v (Cmd.info "egcc" ~version:"%%VERSION%%" ~doc ~man) @@ *)
  (* let+ staging in *)
  (* cmd_interface ~stage *)

(* exit (Cmd.eval main_cmd) *)  

let main () = Cmd.eval main_cmd
let ()
  = if !Sys.interactive then ()
    else exit (main ())  
