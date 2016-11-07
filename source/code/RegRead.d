module code.RegRead;
import code.Register, code.Expression;

class RegRead : Expression {

    private ulong _begin;
    private int _size;
    private Register _reg;

    this (ulong begin, int size, Register reg) {
	this._begin = begin;
	this._size = size;
	this._reg = reg;
    }

}
