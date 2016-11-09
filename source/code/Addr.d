module code.Addr;
import code.Expression, code.Instruction, code.Register;

class Addr : Instruction {

    private Register _reg;
    private Expression _expr;

    this (Register reg, Expression expr) {
	this._reg = reg;
	this._expr = expr;
    }
        

}
