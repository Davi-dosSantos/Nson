%option noyywrap

%{
#include "y.tab.h"
char upper[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
char lower[] = "abcdefghijklmnopqrstuvwxyz";


%}

delim		[ \t\n]
ws 			{delim}+
letra 		[A-Za-z]
letras		{letra}+
digito 		[0-9]
digitos		{digito}+
inteiro		[-]?{digitos}
real		[-]?{digitos}\.{digitos}
caracter	({letra}|{digito})
id 			{letra}{caracter}*

%%

[ \t\n]+ 		{}

{letra} 		{
					int i;
					for (i = 0; *yytext != lower[i]; ++i)
								;
					yylval.c = i;
					return ID;
				}

{digitos}		{
					yylval.i = strtol(yytext, (char **)NULL, 0);
					return DIGITO;
				}


[-{}()=+/*;] 	return yylval.i = *yytext;
">"				return yylval.i = GT;
"<"				return yylval.i = LT; 
">=" 			return yylval.i = GE;
"<=" 			return yylval.i = LE;
"==" 			return yylval.i = EQ;
"!=" 			return yylval.i = NE;
"while" 		return WHILE;
"if" 			return IF;
"else" 			return ELSE;
"imprime" 		return IMPRIME;
"main"			return MAIN;
%%
