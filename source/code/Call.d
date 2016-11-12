module code.Call;
import code.Instruction, code.Expression;
import code.Frame, mem.FrameTable;
import std.container, std.stdio, std.math;


class Call : Instruction {

    private string _name;
    private Array!Expression _params;
    private Expression _where;
    
    this (string name, Array!Expression params) {
	this._name = name;
	this._params = params;
    }

    this (string name, Array!Expression params, Expression where) {
	this._name = name;
	this._params = params;
	this._where = where;
    }

    override void execute (Frame) {
	Array!(byte*) params;
	foreach (it ; this._params) {
	    params.insertBack (it.get ());
	}

	auto ret = FrameTable.instance.get (this._name).call (params);
	if (this._where !is null) {
	    auto reg = this._where.get ();
	    copy (ret, reg, this._where.size);
	}
    }

    void copy (byte * ret, byte* reg, int size) {
	switch (size) {
	case 1: *reg = *ret; break;
	case 2: *(cast(short*)reg) = *(cast(short*)ret); break;
	case 4: *(cast(int*)reg) = *(cast(int*)ret); break;
	case 8: *(cast(long*)reg) = *(cast(long*)ret); break;
	case -4: *(cast(float*)reg) = *(cast(float*)ret); break;
	case -8: *(cast(double*)reg) = *(cast(double*)ret); break;
	default:
	    foreach (it ; 0 .. abs (size)) {
		*(reg + it) = *(ret + it);		
	    }
	    break;
	}
    }
    
    string name () {
	return this._name;
    }
    
    Array!Expression params () {
	return this._params;
    }

    Expression where () {
	return this._where;
    }
    
}
