module code.Const;
import code.Expression;

abstract class Const: Expression {}

class ConstByte : Const {

    private byte _b;

    this (char b) {
	this._b = b;
    }

    override int size () {
	return 1;
    }

    override byte * get () {
	return &this._b;
    }
}

class ConstWord : Const {
    private short _s;

    this (short s) {
	this._s = s;
    }

    override int size () {
	return 2;
    }

    override byte * get () {
	return cast (byte*)&this._s;
    }

}

class ConstDWord : Const {
    private int _i;

    this (int i) {
	this._i = i;
    }

    override int size () {
	return 4;
    }

    override byte * get () {
	return cast(byte*)&this._i;
    }
}

class ConstQWord : Const {
    private long _l;

    this (long l) {
	this._l = l;
    }

    override int size () {
	return 8;
    }

    override byte * get () {
	return cast (byte*)&this._l;
    }

}

class ConstSPrec : Const {
    private float _f;

    this (float f) {
	this._f = f;
    }

    override int size () {
	return -4;
    }

    override byte * get () {
	return cast (byte*)&this._f;
    }

}

class ConstDPrec : Const {
    private double _d;

    this (double d) {
	this._d = d;
    }

    override int size () {
	return -8;
    }

    override byte * get () {
	return cast(byte*)&this._d;
    }

}
