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
    DP = Token ("DP", 11),
    CALL = Token ("call", 12),
    IF = Token ("if", 13),
    SYSTEM = Token ("system", 14),
    INF = Token ("inf", 15),
    DIV = Token ("div", 16),
    ADDR = Token ("addr", 17),
    DEQUAL = Token ("dequal", 18),
    RSP = Token ("sp", 19),
    RFP = Token ("fp", 20),
    ENTERFRAME = Token ("enter_frame", 21),
    RET = Token ("ret", 22),
    PUSH = Token ("push", 23),
    PARAM = Token ("param", 24)
}
