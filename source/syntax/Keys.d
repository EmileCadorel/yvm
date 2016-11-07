module syntax.Keys;
import syntax.Tokens;
import std.typecons;

enum Keys : Token {
    DW = Token ("DW", 1),
    W = Token ("W", 2),
    QW = Token ("QW", 3),
    B = Token ("B", 4),
    STAR = Token ("star", 4),
    PLUS = Token ("plus", 5),
    MINUS = Token ("minus", 6),
    MOVE = Token ("move", 7),
    GOTO = Token ("goto", 8),
    LBL = Token ("lbl", 9),
    SP = Token ("SP", 10),
    DP = Token ("DP", 11)
}
