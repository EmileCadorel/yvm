module code.Label;
import code.Instruction;
import std.container;

class Label {

    private string _id;
    private Array!Instruction _insts;

    this (string id, Array!Instruction insts) {
	this._id = id;
	this._insts = insts;
    }
    
}
