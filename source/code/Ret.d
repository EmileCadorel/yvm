module code.Ret;
import code.Instruction, code.Program;
import mem.RegTable, code.Expression, code.Size;
import std.stdio;

class _Ret : Instruction {
    private Expression _expr;

    this (Expression expr) {
	this._expr = expr;
    }   
}

class Ret () : _Ret {
    this () {
	super (null);
    }

    override void execute () {
	RegTable.instance.quitFrame ();
	Program.instance.ret ();
    }
}

class Ret (Size size : Size.BYTE) : _Ret {
    this (Expression expr) {
	super (expr);
    }

    override void execute () {
	auto val = this._expr.b;
	RegTable.instance.quitFrame ();
	*RegTable.instance.b (0) = *val;
	Program.instance.ret ();
    }
    
};

class Ret (Size size : Size.WORD) : _Ret {
    this (Expression expr) {
	super (expr);
    }

    override void execute () {
	auto val = this._expr.w;
	RegTable.instance.quitFrame ();
	*RegTable.instance.w (0) = *val;
	Program.instance.ret ();
    }
    
};

class Ret (Size size : Size.DWORD) : _Ret {
    this (Expression expr) {
	super (expr);
    }

    override void execute () {
	auto val = this._expr.d;
	RegTable.instance.quitFrame ();
	*RegTable.instance.d (0) = *val;
	Program.instance.ret ();
    }
    
};

class Ret (Size size : Size.QWORD) : _Ret {
    this (Expression expr) {
	super (expr);
    }

    override void execute () {
	auto val = this._expr.q;
	RegTable.instance.quitFrame ();
	*RegTable.instance.q (0) = *val;
	Program.instance.ret ();
    }
    
};

class Ret (Size size : Size.SPREC) : _Ret {
    this (Expression expr) {
	super (expr);
    }

    override void execute () {
	auto val = this._expr.sp;
	RegTable.instance.quitFrame ();
	*RegTable.instance.sp (0) = *val;
	Program.instance.ret ();
    }
    
};

class Ret (Size size : Size.DPREC) : _Ret {
    this (Expression expr) {
	super (expr);
    }

    override void execute () {
	auto val = this._expr.dp;
	RegTable.instance.quitFrame ();
	*RegTable.instance.dp (0) = *val;
	Program.instance.ret ();
    }
    
};

