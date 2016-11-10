module code.Goto;
import code.Frame, code.Instruction;

class Goto : Instruction {

    private ulong _id;

    this (ulong id) {
	this._id = id;
    }

    override void execute (Frame frame) {
	frame.jump (this._id);
    }

}
