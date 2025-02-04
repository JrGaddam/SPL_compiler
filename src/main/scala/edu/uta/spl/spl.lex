/********************************************************************************
*
* File: spl.lex
* The SPL scanner
*
********************************************************************************/

package edu.uta.spl;

import java_cup.runtime.Symbol;

%%
%class SplLex
%public
%line
%column
%cup
%state COMMENT

%{

  private Symbol symbol ( int type ) {
    return new Symbol(type, yyline+1, yycolumn+1);
  }

  private Symbol symbol ( int type, Object value ) {
    return new Symbol(type, yyline+1, yycolumn+1, value);
  }

  public void lexical_error ( String message ) {
    System.err.println("*** Lexical Error: " + message + " (line: " + (yyline+1)
                       + ", position: " + (yycolumn+1) + ")");
    System.exit(1);
  }
%}

%%

<YYINITIAL> {
    "/*"    { yybegin(COMMENT); }
}

<COMMENT> {
    "*/"    { yybegin(YYINITIAL); }
    [^*\n]+    { /* Ignore everything inside comments */ }
    "*"     { /* Ignore the star */ }
    \n      { /* Ignore newlines */ }
}

"array"         { return symbol(sym.ARRAY); }
"and"           { return symbol(sym.AND); }
"boolean"       { return symbol(sym.BOOLEAN); }
"by"            { return symbol(sym.BY); }
"def"           { return symbol(sym.DEF); }
"div"           { return symbol(sym.DIV); }
"else"          { return symbol(sym.ELSE); }
"equal"         { return symbol(sym.EQUAL); }
"exit"          { return symbol(sym.EXIT); }
"false"         { return symbol(sym.FALSE); }
"float"         { return symbol(sym.FLOAT); }
"for"           { return symbol(sym.FOR); }
"if"            { return symbol(sym.IF); }
"int"           { return symbol(sym.INT); }
"loop"          { return symbol(sym.LOOP); }
"mod"           { return symbol(sym.MOD); }
"not"           { return symbol(sym.NOT); }
"or"            { return symbol(sym.OR); }
"print"         { return symbol(sym.PRINT); }
"read"          { return symbol(sym.READ); }
"return"        { return symbol(sym.RETURN); }
"string"        { return symbol(sym.STRING); }
"to"            { return symbol(sym.TO); }
"type"          { return symbol(sym.TYPE); }
"var"           { return symbol(sym.VAR); }
"while"         { return symbol(sym.WHILE); }
"true"          { return symbol(sym.TRUE); }

[0-9]+          { return symbol(sym.INTEGER_LITERAL, Integer.parseInt(yytext())); }
[0-9]+"."[0-9]* { return symbol(sym.FLOAT_LITERAL, Float.parseFloat(yytext())); }
\"[^\"]*\"      { return symbol(sym.STRING_LITERAL, yytext().substring(1,yytext().length()-1)); }
[a-zA-Z_][a-zA-Z_0-9]*  { return symbol(sym.ID, yytext()); }

"+"             { return symbol(sym.PLUS); }
"-"             { return symbol(sym.MINUS); }
"*"             { return symbol(sym.TIMES); }
"<"             { return symbol(sym.LT); }
"<="            { return symbol(sym.LEQ); }
">"             { return symbol(sym.GT); }
">="            { return symbol(sym.GEQ); }
"=="            { return symbol(sym.EQ); }
"<>"            { return symbol(sym.NEQ); }
"="             { return symbol(sym.EQUAL); }
":"             { return symbol(sym.COLON); }
"&&"            { return symbol(sym.AND); }
"||"            { return symbol(sym.OR); }
";"             { return symbol(sym.SEMI); }
","             { return symbol(sym.COMMA); }
"#"             { return symbol(sym.SHARP); }
"."             { return symbol(sym.DOT); }
"("             { return symbol(sym.LP); }
")"             { return symbol(sym.RP); }
"{"             { return symbol(sym.LB); }
"}"             { return symbol(sym.RB); }
"["             { return symbol(sym.LSB); }
"]"             { return symbol(sym.RSB); }
"="             { return symbol(sym.EQUAL); }
"&"             { return symbol(sym.AND); }
"|"             { return symbol(sym.OR); }
"!"             { return symbol(sym.NOT); }
"~"             { return symbol(sym.NOT); }

[ \t\n\r]+      { /* Ignore whitespace */ }

.               { lexical_error("Illegal character: " + yytext()); }