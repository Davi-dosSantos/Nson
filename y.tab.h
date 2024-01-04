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
    DIGITO = 258,
    LT = 259,
    GT = 260,
    LE = 261,
    GE = 262,
    EQ = 263,
    NE = 264,
    OR = 265,
    AND = 266,
    NOT = 267,
    REAL = 268,
    CARACTER = 269,
    ID = 270,
    MAIN = 271,
    WHILE = 272,
    IF = 273,
    ELSE = 274,
    IMPRIME = 275,
    LEIA = 276,
    BREAK = 277,
    INT = 278,
    FLOAT = 279,
    CHAR = 280
  };
#endif
/* Tokens.  */
#define DIGITO 258
#define LT 259
#define GT 260
#define LE 261
#define GE 262
#define EQ 263
#define NE 264
#define OR 265
#define AND 266
#define NOT 267
#define REAL 268
#define CARACTER 269
#define ID 270
#define MAIN 271
#define WHILE 272
#define IF 273
#define ELSE 274
#define IMPRIME 275
#define LEIA 276
#define BREAK 277
#define INT 278
#define FLOAT 279
#define CHAR 280

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 29 "nson.y"

	int i;
	float f;
	char c;
	char* s;
	NODE* np;

#line 115 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
