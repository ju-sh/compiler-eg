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
%token EOF

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

%%
