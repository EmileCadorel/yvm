module code.RegRead;
import code.Register, code.Expression;

/*
  On veut récupérer un pointeur (byte*)
 */
class RegRead : Expression {

    private ulong _begin;
    private int _size;
    private Register _reg;

    this (ulong begin, int size, Register reg) {
	this._begin = begin;
	this._size = size;
	this._reg = reg;
    }

    byte* get () {
	//on demande à registre son byte*+_begin
	return null;
    }

    override int size () {
	return this._size;
    }

}
