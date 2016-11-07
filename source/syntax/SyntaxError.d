module syntax.SyntaxError;
import syntax.Word, utils.Colors;
import std.outbuffer;
import std.file, std.stdio, std.conv;
import std.stdio, std.string;

class SyntaxError : Exception {
    
    private string getLine (Location locus) {
	auto file = File (locus.file, "r");
	string cline = null;
	foreach (it ; 0 .. locus.line)
	    cline = file.readln ();
	return cline;
    }

    protected void addLine (ref OutBuffer buf, Location locus) {
	auto line = getLine (locus);
	if (line.length > 0) {
	    auto j = 0;
	    buf.writef ("%s%s%s%s%s", line[0 .. locus.column - 1],
			Colors.YELLOW.value,
			line[locus.column - 1 .. locus.column + locus.length - 1],
			Colors.RESET.value,
			line[locus.column + locus.length - 1 .. $]);
	    if (line[$-1] != '\n') buf.write ("\n");
	    foreach (it ; 0 .. locus.column - 1) 
		if (line[it] == '\t') buf.write ('\t');
		else buf.write (" ");
	    buf.writefln ("%s", rightJustify ("", locus.length, '^'));
	} else {
	    buf.writeln ("Fin de fichier inattendue");
	}
    } 

    this (Word word) {
	super ("");
	OutBuffer buf = new OutBuffer();
	buf.write (Colors.RED.value);
	buf.write ("Erreur de syntaxe " ~ Colors.RESET.value ~ ":");
	buf.write (word.locus.file);
	buf.write (":(" ~ to!string(word.locus.line) ~ ", " ~ to!string(word.locus.column) ~ ") : ");
	buf.write ("'" ~ word.str ~ "'\n");
	if (word.isEof ()) {
	    buf.write ("Fin de fichier inattendue\n");
	} else {
	    this.addLine (buf, word.locus);
	}
	msg = buf.toString();
    }

    this (Word word, string [] expected) {
	super ("");
	OutBuffer buf = new OutBuffer();
	buf.write (Colors.RED.value);
	buf.write ("Erreur de syntaxe " ~ Colors.RESET.value ~ ":");
	buf.write (word.locus.file);
	buf.write (":(" ~ to!string(word.locus.line) ~ ", " ~ to!string(word.locus.column) ~ ") : ");
	buf.write ("'" ~ word.str ~ "' obtenue quand {");
	foreach (i ; 0 .. expected.length) {
	    buf.write ("'" ~ expected[i] ~ "'");
	    if (i < expected.length - 1) {
		buf.write (",");
	    }
	}
	buf.write ("} sont attendus \n");
	if (word.isEof ()) {
	    buf.write ("Fin de fichier inattendue\n");
	} else {
	    this.addLine (buf, word.locus);
	}
	msg = buf.toString();
    }
    

}
