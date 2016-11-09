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
	    foreach (it ; 0 .. abs (this._where.size)) {
		*(reg + it) = *(ret + it);
	    }
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
