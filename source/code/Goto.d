module code.Goto;
import code.Instruction;
import code.Program;

class Goto : Instruction {

    private string _id;
    private ulong _idLabel;
    
    this (string id) {
	this._id = id;
	this._idLabel = ulong.max;
    }
    
    override void execute () {
	if (this._idLabel == ulong.max) 
	    this._idLabel = Program.instance.jump (this._id);
	else Program.instance.jump (this._idLabel);
    }
    
}
