module code.Instruction;

abstract class Instruction {
    void execute () {
	assert (false, this.toString());
    }
}

