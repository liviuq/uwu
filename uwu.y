%{
#include <stdio.h>
#include "variabile.h"
extern FILE* yyin;
extern char* yytext;
extern int yylineno;
void yyerror(const char *s);
int yylex();

struct variable
{
    int constant;
    int is_initialised;
    char type[256];
    char id[256];
    char value[100][256];
    //char scope[256];
    int dimension;
};

struct variable variabile[512];
int nr_variabile = 0;
%}

%union {
    //those are for actual values like 5, "string", -3.14
    int int_value;
    char char_value;
    int bool_value;
    double double_value;
    char string_value[500];
}

%token <int_value> INTEGER
%token <char_value> CHAR
%token <double_value> DOUBLE
%token <string_value> STRING

%token <string_value> TYPE
%token <string_value> ID
%type <string_value> operation
%token CONST
%token START_UWU END_UWU
%token STRUCT RETURN DEFINE
%token PRINT
%token ASSIGN
%token COMPARE
%token IF ELSE WHILE FOR TRUE FALSE
%token ADD SUBTRACT MULTIPLY DIVIDE

%left ADD SUBSTRACT
%left MULTIPLY DIVIDE
%left COMPARE '|' '&'

%start program 
%%
program: declaratii_variabile  declaratii_functii main {
    printf("Source code sintactically correct. Interpreting..\n");
    //print_symbol_table_variables();
    //print_symbol_table_functions();
}
        ;

declaratii_variabile: declaratie_variabila 
                    | declaratii_variabile declaratie_variabila 
                    ;

declaratie_variabila: TYPE ID ';' {if(exista_variabila($2) == -1) yyerror("Variabila a fost deja declarata");
                                    adauga_variabila(0, 0, $1, $2, "#");}
                    | TYPE ID ASSIGN operation ';' {if(exista_variabila($2) == -1) yyerror("Variabila a fost deja declarata");
                                    adauga_variabila(1, 0, $1, $2, $4);}
                    | CONST TYPE ID ASSIGN operation ';'
                    | STRUCT ID '{' declaratii_variabile '}' ';'
                    | TYPE ID '[' INTEGER ']' ';'
                    | TYPE ID '[' INTEGER ']' ASSIGN '{' lista_vector '}' ';'
                    | CONST TYPE ID '[' INTEGER ']' ASSIGN '{' lista_vector '}' ';'
                    ;

lista_vector: ID
            | lista_vector ',' ID

operation: ID aritmetic
         | INTEGER aritmetic
         | CHAR aritmetic
         | STRING aritmetic
         | DOUBLE aritmetic
         ;

aritmetic: ADD operation
         | SUBTRACT operation
         | MULTIPLY operation
         | DIVIDE operation
         |
         ;
declaratii_functii: declaratie_functie
                  | declaratii_functii declaratie_functie
                  ;
declaratie_functie: TYPE ID '(' ')' ';'
                  | TYPE ID '(' lista_parametri ')' ';'
                  | TYPE ID '(' ')' '{' bloc_functie '}'
                  | TYPE ID '(' lista_parametri ')' '{' bloc_functie '}'
                  | DEFINE TYPE ID '(' ')' '{' bloc_functie '}' 
                  | DEFINE TYPE ID '(' lista_parametri ')' '{' bloc_functie '}'
                  ;
lista_parametri: parametru
                | lista_parametri ',' parametru
                ;
parametru: TYPE ID
         | CONST TYPE ID
         | TYPE ID '[' INTEGER ']'
         | CONST TYPE ID '[' INTEGER ']'
            ;
bloc_functie: declaratie_variabila bloc_functie
            | FOR '(' statement ';' condition ';' statement ')' '{' bloc_functie '}' bloc_functie
            | IF '(' condition ')' '{' bloc_functie '}' else bloc_functie
            | WHILE '(' condition ')' '{' bloc_functie '}' bloc_functie
            | statement ';' bloc_functie 
            |
            ;
else: ELSE '{' bloc_functie '}'
    |
    ;
statement: ID ASSIGN operation
         ;
condition: ID COMPARE operation
         ;



main: START_UWU END_UWU
%%

void yyerror(const char * error)
{
    printf("Error! %s on line %d\n.", error, yylineno);
}

int main(int argc, char** argv)
{
    yyin=fopen(argv[1],"r");
    yyparse();
} 
