import std.stdio;
import syntax.Visitor;

void main (string [] args) {
    if (args.length > 1) {
	auto visit = new Visitor (args[1]);
	auto list = visit.visit ();
    }
}
