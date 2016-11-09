module code.RegRead;
import code.Register, code.Expression;
import mem.Table;

/*
  On veut récupérer un pointeur (byte*)
 */
class RegRead : Expression {

    private ulong _begin;
    private int _size;
    private Expression _expr;
    private Register _reg;

    this (ulong begin, int size, Expression expr, Register reg) {
	this._begin = begin;
	this._size = size;
	this._expr = expr;
	this._reg = reg;
    }

    override byte* get () {
	byte * res = new byte[this._size].ptr;
	byte * ptr;
	if (this._reg !is null) {
	    ptr = Table.instance.get (this._reg);
	} else {
	    ptr = this._expr.get;
	}
	for (int i = 0; i < this._size; i++) {
	    res[i] = ptr[i+this._begin];
	}
	return res;
    }

    override int size () {
	return this._size;
    }

}
