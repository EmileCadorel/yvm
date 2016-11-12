module code.If;
import code.Instruction, code.Expression;
import code.Frame, std.math, code.Size;

class _If : Instruction {

    private Expression _test;
    private ulong _where;

    this (Expression test, ulong where) {
	this._where = where;
	this._test = test;
    }
    
    ulong where () {
	return this._where;
    }

    Expression test () {
	return this._test;
    }

}

class If (Size size : Size.BYTE) : _If {
    this (Expression left, ulong where) {
	super (left, where);
    }

    override void execute (Frame fr) {
	if (*(_test.get) != 0)
	    fr.jump (this._where);
    }    
}
				   
class If (Size size : Size.WORD) : _If {

    this (Expression left, ulong where) {
	super (left, where);
    }
    
    override void execute (Frame fr) {
	if (*(cast(short*)_test.get) != 0)
	    fr.jump (this._where);
    }    
};

class If (Size size : Size.DWORD) : _If {

    this (Expression left, ulong where) {
	super (left, where);
    }

    
    override void execute (Frame fr) {
	if (*(cast(int*)_test.get) != 0)
	    fr.jump (this._where);
    }    
};
				    
class If (Size size : Size.QWORD) : _If {

    this (Expression left, ulong where) {
	super (left, where);
    }
    
    override void execute (Frame fr) {
	if (*(cast(long*)_test.get) != 0)
	    fr.jump (this._where);
    }    
};
				    				    
class If (Size size : Size.SPREC) : _If {

    this (Expression left, ulong where) {
	super (left, where);
    }

    override void execute (Frame fr) {
	if (*(cast(float*)_test.get) != 0)
	    fr.jump (this._where);
    }    
};

class If (Size size : Size.DPREC) : _If {

    this (Expression left, ulong where) {
	super (left, where);
    }

    override void execute (Frame fr) {
	if (*(cast(double*)_test.get) != 0)
	    fr.jump (this._where);
    }    
}


				    


