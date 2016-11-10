module code.Label;
import code.Instruction;
import std.container;

class Label {

    private ulong _id;
    private Array!Instruction _insts;

    this (ulong id, Array!Instruction insts) {
	this._id = id;
	this._insts = insts;
    }

    ulong id () {
	return this._id;
    }

    Array!Instruction insts () {
	return this._insts;
    }

}
