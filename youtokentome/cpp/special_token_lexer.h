// copyright   (c) 2023 

#ifndef SPECIAL_TOKEN_LEXER_H_
#define SPECIAL_TOKEN_LEXER_H_

#include <string>
#include <vector>

struct ParseResult{
  std::vector<std::string> tokens;
  void appendToken(std::string token){
    if(!buffer.empty()){
        tokens.emplace_back(buffer);
        buffer.clear();
    }
    tokens.emplace_back(token);
  }
  void appendChar(char c){
    buffer.append(1,c);
  }
  std::string buffer;
};

int ParseSentence(const std::string& sentence, ParseResult& result);

#endif  // SPECIAL_TOKEN_LEXER_H_

