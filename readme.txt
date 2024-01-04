Descrição dos arquivos contidos nessa pasta:
	1 - lex.yy.c : Arquivo em C contendo o código fonte do analisador léxico gerado pelo Lex.
	2 - nson: compilador desenvolvido. 
	3 - nson.c: código fonte do compilador.
	4 - nson.l: arquivo Lex que descreve o analisador léxico.
	5 - nson.y: arquivo Yacc que descreve o analisador sintático.
	6 - samples: arquivos de programas exemplo da linguagem nson que podem ser compilados.
	7 - tokens_samples: arquivos que descrevem todos os tokens dos programas exemplos.
	8 - y.tab.c: Arquivo em C contendo o código fonte do analisador sintático gerado gerado pelo Yacc.
	9 - y.tab.h: Arquivo header gerado pelo Yacc com definições de Tokens.
	
Para compilar qualquer programa exemplo, basta seguir os seguintes passos:
	1 - No terminal do Linux, navegue até o diretório onde os arquivos acima foram extraídos.
	2 - Digite no terminal: ./nson sample1.txt para compilar e executar o exemplo sample1.txt.
	3 - Repita os passos para os demais arquivos de exemplo.