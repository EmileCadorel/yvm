module syntax.Visitor;
import syntax.Lexer;
import syntax.Word, syntax.Keys;
import syntax.Tokens, syntax.SyntaxError;
import std.container, std.algorithm;
import code.all, std.conv, std.stdio;

class Visitor {

    private Lexer _lex;
    private Token[] _operators;
    
    this (string filename) {
	this._lex = new Lexer (filename, [Tokens.SPACE,
					  Tokens.RETOUR,
					  Tokens.RRETOUR,
					  Tokens.TAB],
			       []);
	this._operators = [Keys.STAR, Keys.PLUS, Keys.MINUS];
    }

    /**
     program := frame*
     */
    Frame [string] visit () {
	Word word = this._lex.next ();
	Frame [string] decls;
	while (!word.isEof ()) {
	    if (word == Tokens.SHARP) {
		auto fr = this.visitFrame ();
		decls [fr.name] = fr;
	    } else throw new SyntaxError (word, [Tokens.SHARP.descr]);
	    this._lex.next (word);
	}
	return decls;
    }


    /**
     frame := '#' identifiant '(' reg* ')' (':' reg)? '{' label* '}'
     */
    private Frame visitFrame () {
	auto name = visitIdentifiant ();
	auto word = this._lex.next ();
	if (word != Tokens.LPAR) throw new SyntaxError (word, [Tokens.LPAR.descr]);
	word = this._lex.next ();
	Array!Register regs;
	if (word != Tokens.RPAR) {
	    this._lex.rewind ();
	    while (true) {
		regs.insertBack (visitRegister ());
		word = this._lex.next ();
		if (word == Tokens.RPAR) break;
		else if (word != Tokens.COMA) throw new SyntaxError (word,
								     [Tokens.COMA.descr,
								      Tokens.RPAR.descr]);		
	    }
	}
	word = this._lex.next ();
	Register returnReg;
	if (word == Tokens.COLON) {
	    returnReg = visitRegister ();
	} else this._lex.rewind ();

	word = this._lex.next ();
	if (word != Tokens.LACC) throw new SyntaxError (word, [Tokens.LACC.descr]);
	Array!Label labels;
	while (true) {
	    labels.insertBack (visitLabel ());
	    word = this._lex.next ();
	    if (word == Tokens.RACC) break;
	    else this._lex.rewind ();
	}
	
	return new Frame (name.str, regs, labels, returnReg); 
    }    


    /**
     label := 'lbl' '[' Identifiant ']' ':' instruction*
     */
    private Label visitLabel () {
	auto word = this._lex.next ();
	if (word != Keys.LBL) throw new SyntaxError (word, [Keys.LBL.descr]);
	word = this._lex.next ();
	if (word != Tokens.LCRO) throw new SyntaxError (word, [Tokens.LCRO.descr]);
	auto num = visitIdentifiant ();
	word = this._lex.next ();
	if (word != Tokens.RCRO) throw new SyntaxError (word, [Tokens.RCRO.descr]);
	word = this._lex.next ();
	if (word != Tokens.COLON) throw new SyntaxError (word, [Tokens.COLON.descr]);
	Array!Instruction insts;
	while (true) {
	    word = this._lex.next ();
	    if (find !"b == a" (this._operators, word) != [])
		insts.insertBack (visitOperator (word));
	    else if (word == Keys.GOTO)
		insts.insertBack (visitGoto ());
	    else if (word == Keys.MOVE)
		insts.insertBack (visitMove ());
	    else if (word == Keys.CALL)
		insts.insertBack (visitCall ());
	    else if (word == Keys.SYSTEM)
		insts.insertBack (visitSystem ());
	    else if (word == Keys.IF)
		insts.insertBack (visitIf ());
	    else {
		this._lex.rewind ();
		break;
	    }
	}
	return new Label (num.str, insts);
    }

    /**
     system := 'system' Identifiant '[' (expression (',' expression)*) ? ']'
     */
    private System visitSystem () {
	auto name = visitIdentifiant ();
	auto word = this._lex.next ();
	if (word != Tokens.LCRO) throw new SyntaxError (word, [Tokens.LCRO.descr]);
	word = this._lex.next ();
	Array!Expression expr;
	if (word != Tokens.RCRO) {
	    this._lex.rewind ();
	    while (true) {
		expr.insertBack (visitExpression ());
		word = this._lex.next ();
		if (word == Tokens.RCRO) break;
		else if (word != Tokens.COMA) throw new SyntaxError (word, [Tokens.RCRO.descr, Tokens.COMA.descr]);
	    }
	}
	return new System (name.str, expr);
    }

    /**
     call := 'call' Identifiant '[' (expression (',' expression)*) ? ']'
     */
    private Call visitCall () {
	auto name = visitIdentifiant ();
	auto word = this._lex.next ();
	if (word != Tokens.LCRO) throw new SyntaxError (word, [Tokens.LCRO.descr]);
	word = this._lex.next ();
	Array!Expression expr;
	if (word != Tokens.RCRO) {
	    this._lex.rewind ();
	    while (true) {
		expr.insertBack (visitExpression ());
		word = this._lex.next ();
		if (word == Tokens.RCRO) break;
		else if (word != Tokens.COMA) throw new SyntaxError (word, [Tokens.RCRO.descr, Tokens.COMA.descr]);
	    }
	}
	return new Call (name.str, expr);
    }

    /**
     if := 'if' expression Identifiant
     */
    private If visitIf () {
	auto expr = visitExpression ();
	auto lbl = visitIdentifiant ();
	return new If (expr, lbl.str);
    }    
    
    
    /**
     move := 'move' expression ',' expression
     */
    private Move visitMove () {
	auto left = visitExpression ();
	auto word = this._lex.next ();
	if (word != Tokens.COMA) throw new SyntaxError (word, [Tokens.COMA.descr]);
	auto right = visitExpression ();
	return new Move (left, right);
    }

    /**
     goto := 'goto' Identifiant
     */
    private Goto visitGoto () {
	return new Goto (visitIdentifiant ().str);
    }

    /**
     reg := '$''(' int ':' int ')'
     */
    private Register visitRegister () {
	auto word = this._lex.next ();
	if (word != Tokens.DOLLAR) throw new SyntaxError (word, [Tokens.DOLLAR.descr]);
	word = this._lex.next ();
	if (word != Tokens.LPAR) throw new SyntaxError (word, [Tokens.LPAR.descr]);
	auto id = visitInt ();
	word = this._lex.next ();
	if (word != Tokens.COLON) throw new SyntaxError (word, [Tokens.COLON.descr]);
	auto size = visitInt ();
	word = this._lex.next ();
	if (word != Tokens.RPAR) throw new SyntaxError (word, [Tokens.RPAR.descr]);
	return new Register (to!ulong (id), to!int (size));
    }

    /**
     operator := Identifiant expression ',' expression ',' expression
     */
    private Operator visitOperator (Word type) {
	auto left = visitExpression ();
	auto word = this._lex.next ();
	if (word != Tokens.COMA) throw new SyntaxError (word, [Tokens.COMA.descr]);
	auto right = visitExpression ();
	word = this._lex.next ();
	if (word != Tokens.COMA) throw new SyntaxError (word, [Tokens.COMA.descr]);
	auto res = visitExpression ();
	return new Operator (type.str, left, right, res);
    }    

    private string visitInt () {
	string total;
	auto word = this._lex.next ();
	if (word == Tokens.MINUS) {
	    total ~= "-";
	    word = this._lex.next ();
	}

	foreach (it ; word.str) {
	    if (it < '0' || it > '9') throw new SyntaxError (word);
	    else total ~= it;
	}
	return total;
    }

    private string visitFloat () {
	string total;
	auto word = this._lex.next ();
	if (word == Tokens.MINUS) {
	    total ~= "-";
	    word = this._lex.next ();
	}

	foreach (it ; word.str) {
	    if (it < '0' || it > '9') throw new SyntaxError (word);
	    else total ~= it;
	}

	word = this._lex.next ();
	if (word == Tokens.DOT) {
	    total ~= ".";
	    word = this._lex.next ();
	    foreach (it ; word.str) {		
		if (it < '0' || it > '9') throw new SyntaxError (word);
		else total ~= it;
	    }
	}	
	return total;
    }

    
    private bool getInt (ref string total) {
	bool minus = false;
	auto word = this._lex.next ();
	if (word == Tokens.MINUS) {
	    total ~= "-";
	    minus = true;
	    word = this._lex.next ();
	}

	foreach (it ; word.str) {
	    if (it < '0' || it > '9') {
		if (minus) this._lex.rewind ();
		this._lex.rewind ();
		return false;
	    }
	    else total ~= it;
	}
	return true;
    }

    /**
     expression := regread | Byte | Word | DWord | QWord | SPrec | DPrec
     */
    private Expression visitExpression () {
	string _int;       
	if (getInt (_int)) return visitRegRead (_int);
	else {
	    auto word = this._lex.next ();
	    if (word == Keys.DW) return visitDWord ();
	    else if (word == Keys.W) return visitWord ();
	    else if (word == Keys.QW) return visitQWord ();
	    else if (word == Keys.B) return visitByte ();
	    else if (word == Keys.SP) return visitSPrec ();
	    else if (word == Keys.DP) return visitDPrec ();
	    else throw new SyntaxError (word);
	}
    }

    /**
     Word := 'W' '[' int ']'
     */
    private Expression visitWord () {
	auto word = this._lex.next ();
	if (word != Tokens.LCRO) throw new SyntaxError (word, [Tokens.LCRO.descr]);
	auto i = visitInt ();
	word = this._lex.next ();
	if (word != Tokens.RCRO) throw new SyntaxError (word, [Tokens.RCRO.descr]);
	return new ConstWord (to!short (i));
    }
    
    private Expression visitByte () {
	auto word = this._lex.next ();
	if (word != Tokens.LCRO) throw new SyntaxError (word, [Tokens.LCRO.descr]);
	auto i = visitInt ();
	word = this._lex.next ();
	if (word != Tokens.RCRO) throw new SyntaxError (word, [Tokens.RCRO.descr]);
	return new ConstByte (to!byte (i));
    }

    private Expression visitQWord () {
	auto word = this._lex.next ();
	if (word != Tokens.LCRO) throw new SyntaxError (word, [Tokens.LCRO.descr]);
	auto i = visitInt ();
	word = this._lex.next ();
	if (word != Tokens.RCRO) throw new SyntaxError (word, [Tokens.RCRO.descr]);
	return new ConstQWord (to!long (i));
    }
    
    private Expression visitDWord () {
	auto word = this._lex.next ();
	if (word != Tokens.LCRO) throw new SyntaxError (word, [Tokens.LCRO.descr]);
	auto i = visitInt ();
	word = this._lex.next ();
	if (word != Tokens.RCRO) throw new SyntaxError (word, [Tokens.RCRO.descr]);
	return new ConstDWord (to!int (i));
    }

    private Expression visitSPrec () {
	auto word = this._lex.next ();
	if (word != Tokens.LCRO) throw new SyntaxError (word, [Tokens.LCRO.descr]);
	auto i = visitFloat ();
	word = this._lex.next ();
	if (word != Tokens.RCRO) throw new SyntaxError (word, [Tokens.RCRO.descr]);
	return new ConstSPrec (to!float (i));
    }
    
    private Expression visitDPrec () {
	auto word = this._lex.next ();
	if (word != Tokens.LCRO) throw new SyntaxError (word, [Tokens.LCRO.descr]);
	auto i = visitFloat ();
	word = this._lex.next ();
	if (word != Tokens.RCRO) throw new SyntaxError (word, [Tokens.RCRO.descr]);
	return new ConstSPrec (to!double (i));
    }           
    

    /**
     regread := int '(' reg ')' ':' int
     */
    private RegRead visitRegRead (string begin) {
	auto word = this._lex.next ();
	if (word != Tokens.LPAR) throw new SyntaxError (word, [Tokens.LPAR.descr]);
	auto reg = visitRegister ();
	word = this._lex.next ();
	if (word != Tokens.RPAR) throw new SyntaxError (word, [Tokens.RPAR.descr]);
	word = this._lex.next ();
	if (word != Tokens.COLON) throw new SyntaxError (word, [Tokens.COLON.descr]);
	auto end = visitInt ();
	return new RegRead (to!ulong (begin), to!int(end), reg);
    }
    
    /**
     Identifiant := ('_')* ([a-z]|[A-Z]) ([a-z]|[A-Z]|'_')|[0-9])*
     */
    private Word visitIdentifiant () {
	auto ident = _lex.next ();	
	if (ident.isToken ())
	    throw new SyntaxError (ident, ["'Identifiant'"]);
	
	if (ident.str.length == 0) throw new SyntaxError (ident, ["'Identifiant'"]);
	auto i = 0;
	foreach (it ; ident.str) {
	    if ((it >= 'a' && it <= 'z') || (it >= 'A' && it <= 'Z')) break;
	    else if (it != '_') throw new SyntaxError (ident, ["'identifiant'"]);
	    i++;
	}
	i++;
	if (ident.str.length < i)
	    throw new SyntaxError (ident, ["'Identifiant'"]);
	
	foreach (it ; ident.str [i .. $]) {
	    if ((it < 'a' || it > 'z')
		&& (it < 'A' || it > 'Z')
		&& (it != '_')
		&& (it < '0' || it > '9'))
		throw new SyntaxError (ident, ["'Identifiant'"]);
	}
	
	return ident;
    }

}
