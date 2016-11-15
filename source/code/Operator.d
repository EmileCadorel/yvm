module code.Operator;
import code.Instruction, code.Expression;
import std.stdio, code.Size;

class Operator : Instruction {

    private Expression _left;
    private Expression _right;
    private Expression _res;

    this (Expression left, Expression right, Expression res) {
	this._left = left;
	this._right = right;
	this._res = res;
    }

};

class OperatorSimple (Size size : Size.BYTE, OP op) : Operator {
    this (Expression left, Expression right, Expression res) {
	super (left, right, res);
    }

    override void execute () {
	*this._res.b = cast(byte)mixin ("*this._left.b " ~ op.descr ~ " *this._right.b");
    }
    
};

class OperatorSimple (Size size : Size.WORD, OP op) : Operator {
    this (Expression left, Expression right, Expression res) {
	super (left, right, res);
    }

    override void execute () {
	*this._res.w = cast(short)mixin ("*this._left.w " ~ op.descr ~ " *this._right.w");
    }
};

class OperatorSimple (Size size : Size.DWORD, OP op) : Operator {
    this (Expression left, Expression right, Expression res) {
	super (left, right, res);
    }
    
    override void execute () {
	*this._res.d = mixin ("*this._left.d " ~ op.descr ~ " *this._right.d");
    }
    
};
						

class OperatorSimple (Size size : Size.QWORD, OP op) : Operator {
    this (Expression left, Expression right, Expression res) {
	super (left, right, res);
    }

    override void execute () {
	*this._res.q = mixin ("*this._left.q " ~ op.descr ~ " *this._right.q");
    }
    
};


class OperatorSimple (Size size : Size.SPREC, OP op) : Operator {
    this (Expression left, Expression right, Expression res) {
	super (left, right, res);
    }

    override void execute () {
	*this._res.sp = mixin ("*this._left.sp " ~ op.descr ~ " *this._right.sp");
    }

};

class OperatorSimple (Size size : Size.DPREC, OP op) : Operator {

    this (Expression left, Expression right, Expression res) {
	super (left, right, res);
    }

    override void execute () {
	*this._res.dp = mixin ("*this._left.dp " ~ op.descr ~ " *this._right.dp");
    }

};


class OperatorTest (Size size : Size.BYTE, OP op) : Operator {

    this (Expression left, Expression right, Expression res) {
	super (left, right, res);
    }

    override void execute () {
	*this._res.b = cast(byte)mixin ("*this._left.b " ~ op.descr ~ " *this._right.b");
    }
    
};

class OperatorTest (Size size : Size.WORD, OP op) : Operator {
    this (Expression left, Expression right, Expression res) {
	super (left, right, res);
    }

    override void execute () {
	*this._res.b = cast(byte)mixin ("*this._left.w " ~ op.descr ~ " *this._right.w");
    }

};

class OperatorTest (Size size : Size.DWORD, OP op) : Operator {
    this (Expression left, Expression right, Expression res) {
	super (left, right, res);
    }

    override void execute () {
	*this._res.b = cast(byte)mixin ("*this._left.d " ~ op.descr ~ " *this._right.d");
    }

};
										

class OperatorTest (Size size : Size.QWORD, OP op) : Operator {
    this (Expression left, Expression right, Expression res) {
	super (left, right, res);
    }

    override void execute () {
	*this._res.b = cast(byte)mixin ("*this._left.q " ~ op.descr ~ " *this._right.q");
    }
    
};


class OperatorTest (Size size : Size.SPREC, OP op) : Operator {
    this (Expression left, Expression right, Expression res) {
	super (left, right, res);
    }

    override void execute () {
	*this._res.b = cast(byte)mixin ("*this._left.sp " ~ op.descr ~ " *this._right.sp");
    }
    
};

class OperatorTest (Size size : Size.DPREC, OP op) : Operator {
    this (Expression left, Expression right, Expression res) {
	super (left, right, res);
    }

    override void execute () {
	*this._res.b = cast(byte)mixin ("*this._left.dp " ~ op.descr ~ " *this._right.dp");
    }

};




						
				      

						
				      


						
