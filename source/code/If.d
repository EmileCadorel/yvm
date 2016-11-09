module code.If;
import code.Instruction, code.Expression;

class If : Instruction {

    private Expression _test;
    private string _where;

    this (Expression test, string where) {
	this._where = where;
	this._test = test;
    }
   
    string where () {
	return this._where;
    }
    
    Expression test () {
	return this._test;
    }
    
    
}
