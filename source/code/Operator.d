module code.Operator;
import code.Frame, code.Instruction, code.Expression;
import std.stdio;

enum OP {
    PLUS,
    MINUS,
    STAR,
    DIV,
    INF,
    NONE
}

OP toOP (string elem) {
    if (elem == "plus") return OP.PLUS;
    if (elem == "minus") return OP.MINUS;
    if (elem == "star") return OP.STAR;
    if (elem == "div") return OP.DIV;
    if (elem == "inf") return OP.INF;
    return OP.NONE;
}



class Operator : Instruction {

    private OP _type;
    private Expression _left;
    private Expression _right;
    private Expression _res;

    this (OP type, Expression left, Expression right, Expression res) {
	this._type = type;
	this._left = left;
	this._right = right;
	this._res = res;
    }

    override void execute (Frame frame) {
	final switch (this._type) {
	case OP.PLUS: this._simple!"+" (); break;
	case OP.MINUS: this._simple!"-" (); break;
	case OP.STAR: this._simple!"*" (); break;
	case OP.DIV: this._simple!"/" (); break;
	case OP.INF: this._test!"<" (); break;
	case OP.NONE: break;
	}
    }


    private void _simple (string op) () {
	auto left = this._left.get (), right = this._right.get (), res = this._res.get();
	switch (this._left.size()) {
	case 1: *res = cast(byte) mixin ("*left" ~ op ~ " *right"); break;
	case 2: *(cast(short*)res) = cast(short) mixin ("*(cast(short*)left)" ~ op ~ " *(cast(short*)right)"); break;
	case 4: *(cast(int*)res) = cast(int) mixin ("*(cast(int*)left)" ~ op ~ " *(cast(int*)right)"); break;
	case 8: *(cast(long*)res) = cast(long) mixin ("*(cast(long*)left)" ~ op ~ " *(cast(long*)right)"); break;
	case -4: *(cast(float*)res) = cast(float) mixin ("*(cast(float*)left)" ~ op ~ " *(cast(float*)right)"); break;
	case -8: *(cast(double*)res) = cast(double) mixin ("*(cast(double*)left)" ~ op ~ " *(cast(double*)right)"); break;
	default: break;
	}
    }
	
    private void _test (string op) () {
	auto left = this._left.get (), right = this._right.get (), res = this._res.get();
	switch (this._left.size()) {
	case 1: *res = mixin ("*left" ~ op ~ " *right"); break;
	case 2: *(res) =  mixin ("*(cast(short*)left)" ~ op ~ " *(cast(short*)right)"); break;
	case 4: *(res) = mixin ("*(cast(int*)left)" ~ op ~ " *(cast(int*)right)"); break;
	case 8: *(res) =  mixin ("*(cast(long*)left)" ~ op ~ " *(cast(long*)right)"); break;
	case -4: *(res) =  mixin ("*(cast(float*)left)" ~ op ~ " *(cast(float*)right)"); break;
	case -8: *(res) = mixin ("*(cast(double*)left)" ~ op ~ " *(cast(double*)right)"); break;
	default: break;
	}
    }
    
}
