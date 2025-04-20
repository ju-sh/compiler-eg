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

%%

prog:
  | f = func
    { Prog f }

func:
  | "int" id = IDENT "(" "void" ")" "{" s = stmt "}"
    { Func (TyInt, id,  s) }

stmt:
  | "return"  e = expr ";"
    { Return e }

expr:
  | i = INT
    { Literal (Integer i) }

%%
