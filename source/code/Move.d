module code.Move;
import code.Frame, code.Expression, code.Instruction, std.math;
import code.Size;

class _Move : Instruction {

    private Expression _left;
    private Expression _right;

    this (Expression left, Expression right) {
	this._left = left;
	this._right = right;
    }
}

class Move (Size size : Size.BYTE) : _Move {

    this (Expression left, Expression right) {
	super (left, right);
    }

    override void execute (Frame) {
	auto left = this._left.get (), right = this._right.get ();
	*right = *left;
    }
    
};

class Move (Size size : Size.WORD) : _Move {

    this (Expression left, Expression right) {
	super (left, right);
    }

    override void execute (Frame) {
	auto left = this._left.get (), right = this._right.get ();
	*(cast(short*)right) = *(cast(short*)left);
    }    
    
};

class Move (Size size : Size.DWORD) : _Move {

    this (Expression left, Expression right) {
	super (left, right);
    }

    override void execute (Frame) {
	auto left = this._left.get (), right = this._right.get ();
	*(cast(int*)right) = *(cast(int*)left);
    }       
};

class Move (Size size : Size.QWORD) : _Move {

    this (Expression left, Expression right) {
	super (left, right);
    }

    override void execute (Frame) {
	auto left = this._left.get (), right = this._right.get ();
	*(cast(long*)right) = *(cast(long*)left);
    }       
};

class Move (Size size : Size.SPREC) : _Move {

    this (Expression left, Expression right) {
	super (left, right);
    }

    override void execute (Frame) {
	auto left = this._left.get (), right = this._right.get ();
	*(cast(float*)right) = *(cast(float*)left);
    }       
};
				      
class Move (Size size : Size.DPREC) : _Move {

    this (Expression left, Expression right) {
	super (left, right);
    }

    override void execute (Frame) {
	auto left = this._left.get (), right = this._right.get ();
	*(cast(double*)right) = *(cast(double*)left);
    }       
}


				      


				     
