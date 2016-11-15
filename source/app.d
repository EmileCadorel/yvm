import std.stdio;
import syntax.Visitor;
import code.all;

void main (string [] args) {
    if (args.length > 1) {
	auto visit = new Visitor (args[1]);
	Program.instance.execute (visit.visit ());
    }
}
