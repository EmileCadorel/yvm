module code.Move;
import code.Expression, code.Instruction;

class Move : Instruction {

    private Expression _left;
    private Expression _right;

    this (Expression left, Expression right) {
	this._left = left;
	this._right = right;
    }
    
}
