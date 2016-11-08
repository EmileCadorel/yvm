module code.Frame;
import code.Instruction, code.Label, code.Register;
import mem.Table;
import std.container;

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

    /*
      va remplir la table de registres
      executer le premier label
     */
    Register execute (string[] args) {
	// foreach (reg ; this._params) {
	//     auto val = Table.instance.get (reg);
	// }

	this._label_ids.insertFront (0);
	this._inst_ids.insertFront (0);
	while (this._label_ids.front < this._labels.length) {
	    Label current_label = this._labels[this._label_ids.front];
	    while (this._inst_ids.front < current_label.insts.length) {
		current_label.insts[this._inst_ids.front].execute (this);
	    }
	}
	this._label_ids.removeFront;
	this._inst_ids.removeFront;

	return null;
    }

    Register call (Array!(byte*) params) {

	return null;
    }

    void jump (string label_id) {
	this._inst_ids.front = 0;
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
