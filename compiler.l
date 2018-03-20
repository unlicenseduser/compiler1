%{
#define "scanner.h"
int line=1;
%}
DIGIT 			[0-9]
LETTER 			[A-Za-z]
%%

UNARY_tok		"++"|"--"|"&"
ID_tok			[A-Za-z][A-Za-z0-9_]*[A-Za-z0-9]									{fprintf("line %d,token:%s, kind: ID_tok\n",UNARY_tok, yytext);}
INT_NUM_tok      	0|[1-9]{DIGIT}*	                                           									{fprintf(yyout,"\nInteger:%s",yytext);}
REAL_NUM_tok		0"."{DIGIT}+|[1-9]{DIGIT}*"." {DIGIT}+   	 										{fprintf(yyout,"\nReal:%s",yytext);}
AR_OP_tok		"+"|"/"|"-"|"*"|"**"                                             				{fprintf(yyout,"\nAn operator:%s",yytext);}
KEYWORDS_tok		"block"|"begin"|"end"|"type"|"is"|"integer"|"real"|"array"|"of"|"when"|"do"|"default"|"end_when"|"for"|"end_for"|"malloc"|"size_of"|"free"
SEPARATION_SIGNS_tok	","|";"|":"|"["|"]"
ASSIGNMENT_tok		"="
POINTER_tok		"^"
COMPARISON_OP_tok	"<"|">"|"!="|">="|"<="|"=="
;			[ \t\n]	
.			fprintf(yyout,"\nUnrecognized character: %s",yytext);



                                                      
%%
void main(int argc, char* argv[])
{
yyin=fopen(argv[1],"r");
if(argv[2])  yyout=fopen(argv[2],"w");
else yyout=stdout;
yylex();
}
# compiler1
