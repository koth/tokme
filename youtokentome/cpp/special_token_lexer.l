


%{

#include "special_token_lexer.h"

%}
 
%option   noyywrap
%option   reentrant
%option   warn
%option   yylineno
%option   outfile="special_token_lexer.cpp" 
%option extra-type="struct ParseResult *"

eoc [\<][eE][oO][cC][\>]
t2c [\<][tT][2][cC][\>]
dsp [\<][dD][sS][pP][\>]

/*** Rules for parsing***/
%%
{eoc} { yyextra->appendToken("<eoc>");}
{t2c} {yyextra->appendToken("<t2c>");}
{dsp} {yyextra->appendToken("<dsp>");}
.     {yyextra->appendChar(yytext[0]);}
%%

int ParseSentence(const std::string& sentence, ParseResult& result){
    yyscan_t scanner;
    yylex_init_extra( &result, &scanner );
    yy_scan_string( sentence.c_str(), scanner );
    yylex( scanner );
    if(!result.buffer.empty()){
        result.tokens.emplace_back(result.buffer);
        result.buffer.clear();
    }
    yylex_destroy( scanner );
    return 0;
}
