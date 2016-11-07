module code.Frame;
import code.Instruction, code.Label, code.Register;
import std.container;

class Frame {

    private string _name;
    private Array!Register _params;
    private Array!Label _labels;
    private Register _return;
    
    this (string name, Array!Register params, Array!Label label, Register ret) {
	this._name = name;
	this._params = params;
	this._labels = label;
	this._return = ret;
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
