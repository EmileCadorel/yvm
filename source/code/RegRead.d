module code.RegRead;
import code.Register, code.Expression;
import std.stdio;

/*
  On veut récupérer un pointeur (byte*)
 */
class RegRead : Expression {

    private long _begin;
    private Expression _expr;

    this (long begin, Expression expr) {
	this._begin = begin;
	this._expr = expr;
    }

    override byte * b () {
	return (*(cast(byte**)this._expr.b) + this._begin);		
    }

    override short * w () {
	return cast(short*)(*(cast(byte**)this._expr.b) + this._begin);		
    }

    override int * d () {
	return cast(int*)(*(cast(byte**)this._expr.b) + this._begin);		
    }

    override long * q () {
	return cast(long*)(*(cast(byte**)this._expr.b) + this._begin);
    }

    override float * sp () {
	return cast(float*)(*(cast(byte**)this._expr.b) + this._begin);
    }
    
    override double * dp () {
	return cast(double*)(*(cast(byte**)this._expr.b) + this._begin);
    }

    
    
}
