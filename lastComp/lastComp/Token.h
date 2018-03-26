#ifndef TOKEN_H
#define TOKEN_H


extern FILE *yyin, *yyout;

typedef enum eTOKENS
{
	TOKEN_UNARY_OP,
	TOKEN_ID,
	TOKEN_INT_NUM,
	TOKEN_REAL_NUM,
	TOKEN_AR_OP,
	TOKEN_KEYWORD,
	TOKEN_SEPARATION_SIGN,
	TOKEN_ASSIGNMENT,
	TOKEN_POINTER,
	TOKEN_COMPARISON_OP,
	TOKEN_DOT,
	TOKEN_OR_OP
	/*
		Examples of tokens, add/change according to your needs.
		
		Alternative way to define tokens:
		#define TOKEN_INTEGER 1
		#define TOKEN_IF 2
		...........
	*/
}eTOKENS;

typedef struct Token
{
	eTOKENS kind;
	char *lexeme;
	int lineNumber;
}Token;

typedef struct Node
{
	Token *tokensArray;
	struct Node *prev;
	struct Node *next;
} Node;

void create_and_store_token(eTOKENS kind, char* lexeme, int numOfLine);
Token *next_token();
Token *back_token();

#endif