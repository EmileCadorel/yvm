module code.Instruction;
import code.Frame;

abstract class Instruction {
    abstract void execute (Frame frame);
}
