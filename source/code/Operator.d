module code.Operator;
import code.Frame, code.Instruction, code.Expression;
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

    override void execute (Frame) {
	return this._simple ();
    }

    abstract protected void _simple ();
    
};

class OperatorSimple (Size size : Size.BYTE, OP op) : Operator {
    this (Expression left, Expression right, Expression res) {
	super (left, right, res);
    }
    
    protected override void _simple () {
	auto left = this._left.get (), right = this._right.get (), res = this._res.get();
	*res = cast(byte) mixin ("*left" ~ op.descr ~ " *right"); 	
    }   
};

class OperatorSimple (Size size : Size.WORD, OP op) : Operator {
    this (Expression left, Expression right, Expression res) {
	super (left, right, res);
    }

    protected override void _simple () {
	auto left = this._left.get (), right = this._right.get (), res = this._res.get();
	*(cast(short*)res) = cast(short) mixin ("*(cast(short*)left)" ~ op.descr ~ " *(cast(short*)right)"); 	
    }   
};

class OperatorSimple (Size size : Size.DWORD, OP op) : Operator {
    this (Expression left, Expression right, Expression res) {
	super (left, right, res);
    }
    
    protected override void _simple () {
	auto left = this._left.get (), right = this._right.get (), res = this._res.get();
	*(cast(int*)res) = cast(int) mixin ("*(cast(int*)left)" ~ op.descr ~ " *(cast(int*)right)"); 	
    }   
};
						

class OperatorSimple (Size size : Size.QWORD, OP op) : Operator {
    this (Expression left, Expression right, Expression res) {
	super (left, right, res);
    }
    
    protected override void _simple () {
	auto left = this._left.get (), right = this._right.get (), res = this._res.get();
	*(cast(long*)res) = cast(long) mixin ("*(cast(long*)left)" ~ op.descr ~ " *(cast(long*)right)"); 	
    }   
};


class OperatorSimple (Size size : Size.SPREC, OP op) : Operator {
    this (Expression left, Expression right, Expression res) {
	super (left, right, res);
    }

    protected override void _simple () {
	auto left = this._left.get (), right = this._right.get (), res = this._res.get();
	*(cast(float*)res) = cast(float) mixin ("*(cast(float*)left)" ~ op.descr ~ " *(cast(float*)right)"); 	
    }   
};

class OperatorSimple (Size size : Size.DPREC, OP op) : Operator {

    this (Expression left, Expression right, Expression res) {
	super (left, right, res);
    }
    
    protected override void _simple () {
	auto left = this._left.get (), right = this._right.get (), res = this._res.get();
	*(cast(double*)res) = cast(double) mixin ("*(cast(double*)left)" ~ op.descr ~ " *(cast(double*)right)"); 	
    }   
};


class OperatorTest (Size size : Size.BYTE, OP op) : Operator {

    this (Expression left, Expression right, Expression res) {
	super (left, right, res);
    }

    protected override void _simple () {
	auto left = this._left.get (), right = this._right.get (), res = this._res.get();
	*res = cast(byte) mixin ("*left" ~ op.descr ~ " *right");
    }   
};

class OperatorTest (Size size : Size.WORD, OP op) : Operator {
    this (Expression left, Expression right, Expression res) {
	super (left, right, res);
    }

    protected override void _simple () {
	auto left = this._left.get (), right = this._right.get (), res = this._res.get();
	*(res) = cast(byte) mixin ("*(cast(short*)left)" ~ op.descr ~ " *(cast(short*)right)"); 	
    }   
};

class OperatorTest (Size size : Size.DWORD, OP op) : Operator {
    this (Expression left, Expression right, Expression res) {
	super (left, right, res);
    }
    
    protected override void _simple () {
	auto left = this._left.get (), right = this._right.get (), res = this._res.get();
	*(res) = cast(byte) mixin ("*(cast(int*)left)" ~ op.descr ~ " *(cast(int*)right)"); 	
    }   
};
										

class OperatorTest (Size size : Size.QWORD, OP op) : Operator {
    this (Expression left, Expression right, Expression res) {
	super (left, right, res);
    }
    
    protected override void _simple () {
	auto left = this._left.get (), right = this._right.get (), res = this._res.get();
	*(res) = cast(byte) mixin ("*(cast(long*)left)" ~ op.descr ~ " *(cast(long*)right)"); 	
    }   
};


class OperatorTest (Size size : Size.SPREC, OP op) : Operator {
    this (Expression left, Expression right, Expression res) {
	super (left, right, res);
    }

    protected override void _simple () {
	auto left = this._left.get (), right = this._right.get (), res = this._res.get();
	*(res) = cast(byte) mixin ("*(cast(float*)left)" ~ op.descr ~ " *(cast(float*)right)"); 	
    }   
};

class OperatorTest (Size size : Size.DPREC, OP op) : Operator {
    this (Expression left, Expression right, Expression res) {
	super (left, right, res);
    }

    protected override void _simple () {
	auto left = this._left.get (), right = this._right.get (), res = this._res.get();
	*(res) = cast(byte) mixin ("*(cast(double*)left)" ~ op.descr ~ " *(cast(double*)right)"); 	
    }   
};




						
				      

						
				      


						
