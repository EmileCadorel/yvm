module syntax.Tokens;
import std.typecons;

alias Token = Tuple!(string, "descr", ulong, "id");

enum Tokens : Token {
    LACC = Token ("{", 0),
    RACC = Token ("}", 1),
    SHARP = Token ("#", 2),
    COMA = Token (",", 3),
    LCRO = Token ("[", 4),
    RCRO = Token ("]", 5),
    DOLLAR = Token ("$", 6),
    LPAR = Token ("(", 7),
    RPAR = Token (")", 8),
    COLON = Token (":", 9),    
    SPACE = Token (" ", 10),
    RETOUR = Token ("\n", 11),
    RRETOUR = Token ("\r", 12),
    TAB = Token ("\t", 13),
    MINUS = Token ("-", 14),
    DOT = Token (".", 15)
}
