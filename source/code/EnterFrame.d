module code.EnterFrame;
import code.Instruction;
import mem.RegTable;
import std.stdio;

class EnterFrame : Instruction {

    override void execute () {	
	RegTable.instance.enterFrame ();
    }
    
}
