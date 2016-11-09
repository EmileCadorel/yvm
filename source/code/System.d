module code.System;
import code.Instruction, code.Expression;
import std.container;

class System : Instruction {

    private string _name;
    private Array!Expression _params;
    private Expression _where;
    
    this (string name, Array!Expression params) {
	this._name = name;
	this._params = params;
    }

    this (string name, Array!Expression params, Expression where) {
	this._name = name;
	this._params = params;
	this._where = where;
    }

    string name () {
	return this._name;
    }
    
    Array!Expression params () {
	return this._params;
    }

    Expression where () {
	return this._where;
    }
    
}
