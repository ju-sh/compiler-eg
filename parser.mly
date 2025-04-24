%{
  open Ast
%}

%token <int> INTVAL
%token <string> IDENT
%token PARENL PARENR
%token BRACEL BRACER
%token INT VOID
%token RETURN
%token SEMICOLON
%token MINUS
%token TILDE
%token UDECR
%token EOF

%nonassoc UMINUS

%start prog
%type <prog> prog

%%

prog:
  | f = func EOF
    { Prog f }

func:
  | INT id = IDENT PARENL VOID PARENR BRACEL s = stmt BRACER
    { Func (TyInt, id,  s) }

stmt:
  | RETURN e = expr SEMICOLON
    { Return e }

expr:
  | i = INTVAL
    { Literal (Integer i) }
  | PARENL e = expr PARENR
    { e }
  | MINUS e = expr %prec UMINUS 
    { Unop (Negate, e) }
  | TILDE e = expr
    { Unop (Complement, e) }
%%

(*
 * CST grammar 
 *
prog := func
func := "int" ident "(" "void" ")" "{" stmt "}"
stmt := "return" expr
expr := int
      | unop expr
      | "(" expr ")"
unop := "~"
      | "-"
 *)

