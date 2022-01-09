all:
	@lex uwu.l
	@yacc -d uwu.y
	@gcc variabile.c y.tab.c lex.yy.c -o uwu
	@./uwu uwucode
