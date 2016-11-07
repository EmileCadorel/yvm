module utils.Colors;
import std.typecons;

alias Color = Tuple!(string, "value");

enum Colors : Color {
    RESET = Color ("\u001B[0m"),
    PURPLE = Color ("\u001B[1;35m"),
    BLUE = Color ("\u001B[1;36m"),
    YELLOW = Color ("\u001B[1;33m"),
    RED = Color ("\u001B[1;31m"),
    GREEN = Color ("\u001B[1;32m")	
}
