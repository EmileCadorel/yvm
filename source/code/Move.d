module code.Move;
import code.Expression, code.Instruction, std.math;
import code.Size, std.stdio;

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

    override void execute () {
	*this._right.b = *this._left.b;
    }
    
};

class Move (Size size : Size.WORD) : _Move {

    this (Expression left, Expression right) {
	super (left, right);
    }

    override void execute () {
	*this._right.w = *this._left.w;
    }
    
};

class Move (Size size : Size.DWORD) : _Move {

    this (Expression left, Expression right) {
	super (left, right);
    }

    override void execute () {
	*this._right.d = *this._left.d;
    }
};

class Move (Size size : Size.QWORD) : _Move {

    this (Expression left, Expression right) {
	super (left, right);
    }

    override void execute () {	
	*this._right.q = *this._left.q;
    }

};

class Move (Size size : Size.SPREC) : _Move {

    this (Expression left, Expression right) {
	super (left, right);
    }

    override void execute () {
	*this._right.sp = *this._left.sp;
    }

};
				      
class Move (Size size : Size.DPREC) : _Move {

    this (Expression left, Expression right) {
	super (left, right);
    }

    override void execute () {
	*this._right.dp = *this._left.dp;
    }
}
				      


				      


				     
