module code.Size;
import std.typecons;

enum Size {
    BYTE,
    WORD,
    DWORD,
    QWORD,
    SPREC,
    DPREC
}


alias OPKeys = Tuple!(string, "descr", ulong, "id");

enum OP : OPKeys {
    PLUS = OPKeys ("+", 0), 
    MINUS = OPKeys ("-", 1),
    STAR = OPKeys ("*", 2),
    DIV = OPKeys ("/", 3),
    INF = OPKeys ("<", 4),
    EQUAL = OPKeys ("==", 5),
    NONE = OPKeys ("", -1)
}

bool equals (OPKeys left, OP right) {
    return left.id == right.id;
}

OP toOP (string elem) {
    if (elem == "plus") return OP.PLUS;
    if (elem == "minus") return OP.MINUS;
    if (elem == "star") return OP.STAR;
    if (elem == "div") return OP.DIV;
    if (elem == "inf") return OP.INF;
    if (elem == "dequal") return OP.EQUAL;
    return OP.NONE;
}

bool isTest (OP elem) {
    return elem.id >= 4;
}
