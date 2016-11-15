module code.Call;
import code.Instruction, code.Expression, code.Program;
import std.container, std.stdio, std.math;

class Call : Instruction {

    private string _name;
    private ulong _id;
    
    this (string name) {
	this._id = ulong.max;
	this._name = name;
    }
    
    string name () {
	return this._name;
    }
    
    override void execute () {
	if (this._id == ulong.max)
	    this._id = Program.instance.call (this._name);
	else Program.instance.call (this._id);
    }
    
}
