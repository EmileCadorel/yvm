module code.RegRead;
import code.Register, code.Expression;

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

}
