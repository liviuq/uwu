%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "y.tab.h"
%}
%option noyywrap
%%
0|-?[1-9][0-9]* {
    yylval.int_value = atoi(yytext);
    return INTEGER;
}

-?[0-9]+"."[0-9]+ {
    yylval.double_value = atof(yytext);
    return DOUBLE;
}

"'"."'" {
    yylval.char_value = *yytext;
    return CHAR;
}

"\""[a-zA-Z]+"\"" {
    strcpy(yylval.string_value, yytext);
    return STRING;
}

#[a-zA-Z][a-zA-Z0-9]* {
    strcpy(yylval.string_value, yytext);
    return ID;
}

"int32_t"|"double"|"int8_t"|"string"|"bool"|"void" {
    strcpy(yylval.string_value, yytext);
    return TYPE;
}

"const" {
    return CONST;
}

"start_uwu" {
    return START_UWU;
}

"end_uwu" {
    return END_UWU;
}

"struct" {
    return STRUCT;
}

"return" {
    return RETURN;
}

"define" {
    return DEFINE;
}

"print" {
    return PRINT;
}

"=" {
    return ASSIGN;
}

"if" {
    return IF;
}

"else" {
    return ELSE;
}

"while" {
    return WHILE;
}

"for" {
    return FOR;
}

"true" {
    return TRUE;
}

"false" {
    return FALSE;
}

"=="|"!="|"<"|">"|"<="|">=" {
    return COMPARE;
}

"+"                         { return ADD; }
"-"                         { return SUBTRACT; }
"/"                         { return DIVIDE; }
"*"                         { return MULTIPLY; }
[ \t] ;

\n {
    yylineno++;
}

. {
    return yytext[0];
}
%%