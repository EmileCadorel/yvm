module code.Call;
import code.Instruction, code.Expression;
import mem.FrameTable;
import std.container, std.math;

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
	for (param ; this._params) {
	    params.insertBack (param.get);
	}
	byte * ret = FrameTable.instance.get (this._name).call (params);
	if (this._where !is null) {
	    foreach (i ; 0 .. abs(this._where.size)) {
		*(this._where.get ()+i) = *(ret+i);
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
