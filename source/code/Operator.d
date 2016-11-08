module code.Operator;
import code.Frame, code.Instruction, code.Expression;

class Operator : Instruction {

    private string _type;
    private Expression _left;
    private Expression _right;
    private Expression _res;

    this (string type, Expression left, Expression right, Expression res) {
	this._type = type;
	this._left = left;
	this._right = right;
	this._res = res;
    }

    override void execute (Frame frame) {

    }
}
