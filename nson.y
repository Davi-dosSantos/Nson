%{
#include <stdio.h>
#include <stdlib.h>

typedef union {
	int value;
	struct nnode *np;
}ITEM;

typedef struct nnode {
	int operator;
	ITEM left, right, third;
}NODE;

#define LEFT left.np
#define RIGHT right.np
#define NNULL ((NODE *) 0)
#define node(a,b,c) triple(a, b, c, NNULL)

static NODE *nalloc(void);
static NODE *leaf(int type, int value);
static NODE *triple(int op, NODE *left, NODE *right, NODE *third);
static void freeall(NODE *np);

int variables[26];

%}

%union {
	int i;
	float f;
	char c;
	char* s;
	NODE* np;
};


%token <i> DIGITO '+' '-' '*' '/' LT GT LE GE EQ NE OR AND NOT 
%token <f> REAL
%token <c> CARACTER
%token <c> ID
%token MAIN WHILE IF ELSE IMPRIME LEIA BREAK INT FLOAT CHAR
%left LT GT LE GE EQ NE
%left '+' '-'
%left '*' '/' 

%type <np>	statement expression statementlist simplestatement

%%

program:
		  MAIN statement     { execute($2); freeall($2); }
        | program error ';'     { yyerrok; }
        | /* NULL */
        ;

statement:
          simplestatement ';'
        | WHILE '(' expression ')' statement
                { $$ = node(WHILE, $3, $5); }
        | IF '(' expression ')' statement ELSE statement	{ $$ = triple(IF,$3,$5,$7); }
        | IF '(' expression ')' statement	{ $$ = triple(IF,$3,$5,NNULL); }
        | '{' statementlist '}'				{ $$ = $2; }
        ;

statementlist:
          statement
        | statementlist statement       { $$ = node(';', $1, $2); }
        ;

simplestatement:
          expression
        | IMPRIME '(' expression ')'    { $$ = node(IMPRIME,$3,NNULL); }
        | ID '=' expression				{ $$ = node('=', leaf(ID, $1), $3); }
        ;

expression:
          DIGITO               			{ $$ = leaf(DIGITO, $1); }
        | ID              				{ $$ = leaf(ID, $1); }
        | expression '+' expression 	{ binary: $$ = node($2, $1, $3); }
        | expression '-' expression     { goto binary; }
        | expression '*' expression     { goto binary; }
        | expression '/' expression     { goto binary; }
        | expression GT expression     	{ goto binary; }
        | expression LT expression     	{ goto binary; }
        | expression GE expression      { goto binary; }
        | expression LE expression      { goto binary; }
        | expression NE expression      { goto binary; }
        | expression EQ expression      { goto binary; }
        | '(' expression ')'            { $$ = $2; }
        ;

%%

void yyerror (char const *s) {
   fprintf (stderr, "%s\n", s);
 }
 
static NODE *nalloc()
{
	NODE *np;
	np = (NODE *) malloc(sizeof(NODE));
	if (np == NNULL) {
		printf("Out of Memory\n");
		exit(1);
	}
	return np;
}

static NODE *leaf(type, value)
int type, value;
{
	NODE *np = nalloc();
	np->operator = type;
	np->left.value = value;
	return np;
}
static NODE *triple(op, left, right, third)
int op;

NODE *left, *right, *third;
{
	NODE *np = nalloc();
	np->operator = op;
	np->left.np = left;
	np->right.np = right;
	np->third.np = third;
	return np;
}

static void freeall(np)
NODE *np;
{
	if (np == NNULL)
	return;
	switch(np->operator) {
		case IF: /* Triple */
			freeall(np->third.np);
			/* FALLTHROUGH */
			/* Binary */
		case '+': case '-': case '*': case '/':
		case ';': case LT: case GT:
		case GE: case LE: case NE: case EQ:
		case WHILE:
		case '=':
			freeall(np->RIGHT);
			/* FALLTHROUGH */
		case IMPRIME: /* Unary */
			freeall(np->LEFT);
			break;
	}
	free(np);
}

int execute(np)
struct nnode *np;
{
	switch(np->operator) {
		case DIGITO: return np->left.value;
		case ID: return variables[np->left.value];
		case '+': return execute(np->LEFT) + execute(np->RIGHT);
		//case '+': printf("Chegou aqui\n"); return 0;
		case '-': return execute(np->LEFT) - execute(np->RIGHT);
		case '*': return execute(np->LEFT) * execute(np->RIGHT);
		case '/': return execute(np->LEFT) / execute(np->RIGHT);
		case LT: return execute(np->LEFT) < execute(np->RIGHT);
		case GT: return execute(np->LEFT) > execute(np->RIGHT);
		case GE: return execute(np->LEFT) >= execute(np->RIGHT);
		case LE: return execute(np->LEFT) <= execute(np->RIGHT);
		case NE: return execute(np->LEFT) != execute(np->RIGHT);
		case EQ: return execute(np->LEFT) == execute(np->RIGHT);
		case IMPRIME: printf("%d\n", execute(np->LEFT)); return 0;
		case ';': execute(np->LEFT); return execute(np->RIGHT);
		case '=':
			return variables[np->LEFT->left.value] = execute(np->RIGHT);
		case WHILE:
			while (execute(np->LEFT))
				execute(np->RIGHT);
			return 0;
		case IF:
			if (execute(np->LEFT))
				execute(np->RIGHT);
			else if (np->third.np != NNULL)
				execute(np->third.np);
			return 0;
	}
	printf("Internal error! Bad node type!");
	exit(1);
}