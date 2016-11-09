module code.Move;
import code.Frame, code.Expression, code.Instruction, std.math;

class Move : Instruction {

    private Expression _left;
    private Expression _right;

    this (Expression left, Expression right) {
	this._left = left;
	this._right = right;
    }

    override void execute (Frame frame) {
	auto left = this._left.get (), right = this._right.get ();
	switch (this._left.size) {
	case 1:
	    *(right) = *left;
	    break;
	case 2:
	    *(cast(short*)right) = *(cast(short*)left);
	    break;
	case 4:
	    *(cast(int*)right) = *(cast(int*)left);
	    break;
	case 8:
	    *(cast(long*)right) = *(cast(long*)left);
	    break;
	case -4:
	    *(cast(float*)right) = *(cast(float*)left);
	    break;
	case -8:
	    *(cast(double*)right) = *(cast(double*)left);
	    break;
	default:
	    foreach (i ; 0 .. abs(this._left.size)) {
		*(right + i) = *(left + i);
	    }
	}
    }
}
