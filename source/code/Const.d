module code.Const;
import code.Expression;

abstract class Const: Expression {}

class ConstByte : Const {

    private byte _b;
    
    this (char b) {
	this._b = b;
    }
}

class ConstWord : Const {
    private short _s;

    this (short s) {
	this._s = s;
    }
}

class ConstDWord : Const {
    private int _i;

    this (int i) {
	this._i = i;
    }
}

class ConstQWord : Const {
    private long _l;

    this (long l) {
	this._l = l;
    }
}

class ConstSPrec : Const {
    private float _f;

    this (float f) {
	this._f = f;
    }   
}

class ConstDPrec : Const {
    private double _d;

    this (double d) {
	this._d = d;
    }    
}
