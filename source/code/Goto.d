module code.Goto;
import code.Frame, code.Instruction;

class Goto : Instruction {

    private string _id;

    this (string id) {
	this._id = id;
    }

    override void execute (Frame frame) {
	frame.jump (this._id);
    }

}
