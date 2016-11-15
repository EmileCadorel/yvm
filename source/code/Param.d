module code.Param;
import code.Instruction, code.Expression;
import mem.RegTable, code.Size;

class _Param : Instruction {
    private Expression _what;

    this (Expression what) {
	this._what = what;
    }    
}

class Param (Size size : Size.BYTE) : _Param {
    this (Expression what) {
	super (what);
    }

    override void execute () {
	auto id = RegTable.instance.last;
	*(RegTable.instance.param.b (id)) = *this._what.b;
	RegTable.instance.last ++;
    }    
};

class Param (Size size : Size.WORD) : _Param {
    this (Expression what) {
	super (what);
    }

    override void execute () {
	auto id = RegTable.instance.last;
	*(RegTable.instance.param.w (id)) = *this._what.w;
	RegTable.instance.last ++;
    }    
};

class Param (Size size : Size.DWORD) : _Param {
    this (Expression what) {
	super (what);
    }

    override void execute () {
	auto id = RegTable.instance.last;
	*(RegTable.instance.param.d (id)) = *this._what.d;
	RegTable.instance.last ++;
    }    
};


class Param (Size size : Size.QWORD) : _Param {
    this (Expression what) {
	super (what);
    }

    override void execute () {
	auto id = RegTable.instance.last;
	*(RegTable.instance.param.q (id)) = *this._what.q;
	RegTable.instance.last ++;
    }    
};

class Param (Size size : Size.SPREC) : _Param {
    this (Expression what) {
	super (what);
    }

    override void execute () {
	auto id = RegTable.instance.last;
	*(RegTable.instance.param.sp (id)) = *this._what.sp;
	RegTable.instance.last ++;
    }    
};

class Param (Size size : Size.DPREC) : _Param {
    this (Expression what) {
	super (what);
    }

    override void execute () {
	auto id = RegTable.instance.last;
	*(RegTable.instance.param.dp (id)) = *this._what.dp;
	RegTable.instance.last ++;
    }    
};

				      
