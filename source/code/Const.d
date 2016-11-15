module code.Const;
import code.Expression;

abstract class Const: Expression {}

class ConstByte : Const {

    private byte _b;

    this (char b) {
	this._b = b;
    }

    override byte * b () {
	return &this._b;
    }    
}

class ConstWord : Const {
    private short _s;

    this (short s) {
	this._s = s;
    }
   
    override short * w () {
	return &this._s;
    }
    
}

class ConstDWord : Const {
    private int _i;

    this (int i) {
	this._i = i;
    }

    override int * d () {
	return &this._i;
    }
    
}

class ConstQWord : Const {
    private long _l;

    this (long l) {
	this._l = l;
    }

    override long * q () {
	return &this._l;
    }    
}

class ConstSPrec : Const {
    private float _f;

    this (float f) {
	this._f = f;
    }

    override float * sp () {
	return &this._f;
    }
    
}

class ConstDPrec : Const {
    private double _d;

    this (double d) {
	this._d = d;
    }

    override double * dp () {
	return &this._d;
    }
    
}
