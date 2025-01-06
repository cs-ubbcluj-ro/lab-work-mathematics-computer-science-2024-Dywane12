%{
#include "parser.tab.h"
%}

%%

"clatite"             return CLATITE;
"cu nutella"          return CU_NUTELLA;
"define"              return DEFINE;
"num"                 return NUM;
"decimal"             return DECIMAL;
"string"              return STRING;
"structure"           return STRUCTURE;
"begin"               return BEGIN_BLOCK;
"end"                 return END;
"read"                return READ;
"write"               return WRITE;
"check"               return CHECK;
"then"                return THEN;
"otherwise"           return OTHERWISE;
"loop"                return LOOP;
"endloop"	      return ENDLOOP;
"perform"             return PERFORM;
":="                  return ASSIGN;
"<" | "<=" | ">=" | ">" | "<>" return RELOP;
"="                   return RELOP;
"+"                   return PLUS;
"-"                   return MINUS;
"*"                   return MUL;
"/"                   return DIV;
":"                   return COLON;
";"                   return SEMICOLON;
","                   return COMMA;
"{"                   return LBRACE;
"}"                   return RBRACE;
"("                   return LPAREN;
")"                   return RPAREN;
[a-zA-Z_][a-zA-Z0-9_]* return IDENTIFIER;
[0-9]+                return INTEGER;
[0-9]+\\.[0-9]+       return FLOAT;
[ \\t\\n]+            ; /* Ignore whitespace */

.                     { printf("Unrecognized character: %s\n", yytext); }

%%
