module code.Call;
import code.Instruction, code.Expression;
import std.container;

class Call : Instruction {

    private string _name;
    private Array!Expression _params;

    this (string name, Array!Expression params) {
	this._name = name;
	this._params = params;
    }

    string name () {
	return this._name;
    }
    
    Array!Expression params () {
	return this._params;
    }
    
}
