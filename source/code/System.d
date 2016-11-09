module code.System;
import code.Instruction, code.Expression;
import code.Frame;
import std.container, std.stdio;

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

    override void execute (Frame) {
	if (this._name == "print_i")
	    this._print!int ();
	else if (this._name == "print_c")
	    this._print!char ();
    }

    private void _print (T) () {
	foreach (it ; this._params) 
	    write (*(cast(T*)it.get()));
    }    

}
