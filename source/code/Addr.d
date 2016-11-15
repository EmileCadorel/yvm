module code.Addr;
import code.Expression, code.Instruction, code.Register;

class Addr : Instruction {

    private Expression _reg;
    private Expression _expr;

    this (Expression reg, Expression expr) {
	this._reg = reg;
	this._expr = expr;
    }
    
}
