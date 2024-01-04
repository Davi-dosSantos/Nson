#include <stdio.h>
#include <stdlib.h>
#include "y.tab.c"
#include "lex.yy.c"
#include "y.tab.h"

int main(int argc, char* argv[]){
	if(argc > 1)
	{
		FILE *fp = fopen(argv[1], "r");
		if(fp)
			yyin = fp;
	}
	printf("%d\n",yyparse());
	return 0;

}