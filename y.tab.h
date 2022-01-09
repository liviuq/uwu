/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    INTEGER = 258,
    CHAR = 259,
    DOUBLE = 260,
    STRING = 261,
    TYPE = 262,
    ID = 263,
    CONST = 264,
    START_UWU = 265,
    END_UWU = 266,
    STRUCT = 267,
    RETURN = 268,
    DEFINE = 269,
    PRINT = 270,
    ASSIGN = 271,
    COMPARE = 272,
    IF = 273,
    ELSE = 274,
    WHILE = 275,
    FOR = 276,
    TRUE = 277,
    FALSE = 278,
    ADD = 279,
    SUBTRACT = 280,
    MULTIPLY = 281,
    DIVIDE = 282,
    SUBSTRACT = 283
  };
#endif
/* Tokens.  */
#define INTEGER 258
#define CHAR 259
#define DOUBLE 260
#define STRING 261
#define TYPE 262
#define ID 263
#define CONST 264
#define START_UWU 265
#define END_UWU 266
#define STRUCT 267
#define RETURN 268
#define DEFINE 269
#define PRINT 270
#define ASSIGN 271
#define COMPARE 272
#define IF 273
#define ELSE 274
#define WHILE 275
#define FOR 276
#define TRUE 277
#define FALSE 278
#define ADD 279
#define SUBTRACT 280
#define MULTIPLY 281
#define DIVIDE 282
#define SUBSTRACT 283

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 25 "uwu.y"

    //those are for actual values like 5, "string", -3.14
    int int_value;
    char char_value;
    int bool_value;
    double double_value;
    char string_value[500];

#line 122 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
