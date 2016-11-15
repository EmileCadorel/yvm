module code.If;
import code.Instruction, code.Expression, code.Program;
import std.math, code.Size;

class _If : Instruction {

    private Expression _test;
    private string _where;

    this (Expression test, string where) {
	this._where = where;
	this._test = test;
    }
    
    string where () {
	return this._where;
    }

    Expression test () {
	return this._test;
    }

}

class If (Size size : Size.BYTE) : _If {
    this (Expression left, string where) {
	super (left, where);
    }

    override void execute () {
	if (*this._test.b != 0)
	    Program.instance.jump (this._where);
    }
    
}
				   
class If (Size size : Size.WORD) : _If {

    this (Expression left, string where) {
	super (left, where);
    }

    override void execute () {
	if (*this._test.w != 0)
	    Program.instance.jump (this._where);
    }
};

class If (Size size : Size.DWORD) : _If {

    this (Expression left, string where) {
	super (left, where);
    }

    override void execute () {
	if (*this._test.d != 0)
	    Program.instance.jump (this._where);
    }
    
};
				    
class If (Size size : Size.QWORD) : _If {

    this (Expression left, string where) {
	super (left, where);
    }

    override void execute () {
	if (*this._test.q != 0)
	    Program.instance.jump (this._where);
    }

    
};
				    				    
class If (Size size : Size.SPREC) : _If {

    this (Expression left, string where) {
	super (left, where);
    }

    override void execute () {
	if (*this._test.sp != 0)
	    Program.instance.jump (this._where);
    }
    
};

class If (Size size : Size.DPREC) : _If {

    this (Expression left, string where) {
	super (left, where);
    }
    
    override void execute () {
	if (*this._test.dp != 0)
	    Program.instance.jump (this._where);
    }
    
}


				    


