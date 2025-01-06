%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex(void);
%}

%token CLATITE CU_NUTELLA DEFINE NUM DECIMAL STRING STRUCTURE
%token BEGIN_BLOCK END READ WRITE CHECK THEN OTHERWISE LOOP PERFORM ENDLOOP
%token IDENTIFIER INTEGER FLOAT PLUS MINUS MUL DIV ASSIGN RELOP
%token COLON SEMICOLON COMMA LBRACE RBRACE LPAREN RPAREN
%debug

%%
program: CLATITE decllist mainstmt CU_NUTELLA
       {
           printf("Program syntactic correct\n");
       }
       ;

decllist: declaration SEMICOLON decllist
        | declaration
        ;

declaration: DEFINE IDENTIFIER COLON type
           ;

type: NUM
    | DECIMAL
    | STRING
    | STRUCTURE LBRACE decllist RBRACE
    ;

mainstmt: BEGIN_BLOCK stmtlist END
        ;

stmtlist: stmt SEMICOLON stmtlist
        | stmt
        ;

stmt: assignstmt
    | iostmt
    | ifstmt
    | loopstmt
    ;

assignstmt: IDENTIFIER ASSIGN expression
          ;

iostmt: READ LPAREN IDENTIFIER RPAREN
      | WRITE LPAREN IDENTIFIER RPAREN
      ;

ifstmt: CHECK condition THEN stmtlist
      | CHECK condition THEN stmtlist OTHERWISE stmtlist
      ;

loopstmt: LOOP condition PERFORM stmtlist ENDLOOP
        ;

expression: term
          | expression PLUS term
          | expression MINUS term
          ;

term: factor
    | term MUL factor
    | term DIV factor
    ;

factor: IDENTIFIER
      | INTEGER
      | FLOAT
      | LPAREN expression RPAREN
      ;

condition: expression RELOP expression
         ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    return yyparse();
}
