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
	return new byte (this._b);
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
	short * val = new short (this._s);
	return cast (byte*)val;
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
	int * val = new int (this._i);
	return cast(byte*)val;
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
	long * val = new long (this._l);
	return cast (byte*)val;
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
	float * val = new float (this._f);
	return cast (byte*)val;
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
	double * val = new double (this._d);
	return cast(byte*)val;
    }

}
