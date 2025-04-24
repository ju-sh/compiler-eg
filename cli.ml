open Cmdliner
open Core

let prompt =
  let slex =
    let doc = "Lexing" in
    SLex, Arg.info ["l"] ~doc
  in
  let sparse =
    let doc = "Parsing" in
    SParse, Arg.info ["p"] ~doc
  in
  let sIr =
    let doc = "IR generation" in
    SIr, Arg.info ["i"] ~doc
  in
  Arg.(last & vflag SParse [slex; sparse; sIr])

let cmd_interface ~stage () = Core.main stage

let main_cmd =
  let doc = "An example compiler for C-like programs" in
  let man = [
      `S Manpage.s_description;
      `S Manpage.s_bugs; `P "Report bugs to <ju-sh@example.org>.";
      `S Manpage.s_see_also; `P "$(b,rmdir)(1), $(b,unlink)(2)" ]
  in  
  Cmd.make (Cmd.info "egcc" ~version:"%%VERSION%%" ~doc ~man) @@
  let+ staging in
  cmd_interface ~stage

let main () = Cmd.eval main_cmd
let ()
  = if !Sys.interactive then ()
    else exit (main ())  
