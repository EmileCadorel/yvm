module code.Frame;
import code.Instruction, code.Label, code.Register;
import mem.Table;
import std.container, std.stdio;

class Frame {

    private string _name;
    private Array!Register _params;
    private Array!Label _labels;
    private Register _return;
    private SList!ulong _label_ids;
    private SList!ulong _inst_ids;

    this (string name, Array!Register params, Array!Label label, Register ret) {
	this._name = name;
	this._params = params;
	this._labels = label;
	this._return = ret;
    }

    byte* execute (string[] args) {
	this._label_ids.insertFront (0);
	this._inst_ids.insertFront (0);
	Table.instance.enterFrame ();

	while (this._label_ids.front < this._labels.length) {
	    this._inst_ids.front = 0;
	    while (this._inst_ids.front <
		   this._labels[this._label_ids.front].insts.length) {
		Label current_label = this._labels[this._label_ids.front];
		current_label.insts[this._inst_ids.front].execute (this);
		this._inst_ids.front () += 1;
	    }
	    this._label_ids.front () +=1;
	}
	byte * return_value = null;
	if (this._return !is null) {
	    return_value = Table.instance.get (this._return);
	}

	Table.instance.exitFrame ();
	this._label_ids.removeFront;
	this._inst_ids.removeFront;


	return return_value;
    }

    byte* call (byte* [] params) {

	this._label_ids.insertFront (0);
	this._inst_ids.insertFront (0);
	Table.instance.enterFrame ();
	for (int i = 0; i < params.length; i++) {
	    Table.instance.add (this._params[i], params[i]);
	}

	while (this._label_ids.front < this._labels.length) {
	    this._inst_ids.front = 0;
	    while (this._inst_ids.front <
		   this._labels[this._label_ids.front].insts.length) {
		Label current_label = this._labels[this._label_ids.front];
		current_label.insts[this._inst_ids.front].execute (this);
		this._inst_ids.front () += 1;
	    }
	    this._label_ids.front () += 1;
	}

	byte * return_value = null;
	if (this._return !is null) {
	    return_value = Table.instance.get (this._return);
	}

	Table.instance.exitFrame ();
	this._label_ids.removeFront;
	this._inst_ids.removeFront;

	return return_value;
    }

    void jump (ulong label_id) {
	this._inst_ids.front = -1;
	foreach (it; 0 .. this._labels.length) {
	    if (this._labels[it].id == label_id) {
		this._label_ids.front = it;
		break;
	    }
	}
    }

    Register returnReg () {
	return this._return;
    }

    Array!Register params () {
	return this._params;
    }

    string name () {
	return this._name;
    }

}
