module code.Move;
import code.Frame, code.Expression, code.Instruction;

class Move : Instruction {

    private Expression _left;
    private Expression _right;

    this (Expression left, Expression right) {
	this._left = left;
	this._right = right;
    }

    override void execute (Frame frame) {
	*(this._right.get) = *(this._right.get);
    }
}
