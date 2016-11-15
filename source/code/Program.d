module code.Program;
import std.container, code.Instruction;
import utils.Singleton, code.Label;
import std.stdio;

class Program {

    private ulong _labelId;
    private ulong _instId;
    private Label [] _labels;
    private SList!ulong _lastLabel;
    private SList!ulong _lastInst;
    private bool _end = false;
    
    void execute (Label [] labels) {
	this._labels = labels;
	while (this._labelId < this._labels.length) {
	    this._instId = 0;
	    while (!this._end && this._instId < this._labels[this._labelId].insts.length) {
		this._labels[this._labelId].insts[this._instId].execute ();
		this._instId++;
	    }
	    this._labelId ++;
	}	
    }

    ulong jump (string id) {
	this._instId = -1;
	foreach (it ; 0 .. this._labels.length) {
	    if (this._labels[it].id == id) {
		this._labelId = it;
		break;
	    }
	}
	return this._labelId;
    }

    void jump (ulong id) {
	this._instId = -1;
	this._labelId = id;
    }
    
    ulong call (string id) {
	this._lastLabel.insertFront (this._labelId);
	this._lastInst.insertFront (this._instId);
	
	this._instId = -1;
	foreach (it ; 0 .. this._labels.length) {
	    if (this._labels[it].id == id) {
		this._labelId = it;
		break;
	    }
	}
	return this._labelId;
    }

    void call (ulong id) {
	this._lastLabel.insertFront (this._labelId);
	this._lastInst.insertFront (this._instId);

	this._instId = -1;
	this._labelId = id;
    }
    

    void ret () {
	if (!this._lastInst.empty) {
	    this._labelId = this._lastLabel.front ();
	    this._instId = this._lastInst.front ();
	    this._lastInst.removeFront ();
	    this._lastLabel.removeFront ();
	} else {
	    this._labelId = this._labels.length;
	    this._end = true;
	}
    }
    
    mixin Singleton!Program;
}
