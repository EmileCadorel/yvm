module mem.Table;
import std.container;
import code.Register;
import utils.Singleton;

class Table {

    private SList!(byte*[ulong]) _reg;

    void enterFrame () {
	this._reg.insertFront ((byte*[ulong]).init);
    }

    void exitFrame () {
	this._reg.removeFront ();
    }

    void add (Register reg, byte* data) {
	auto it = reg.id in this._reg.front;
	if (it is null)
	    this._reg.front[reg.id] = new byte[reg.size].ptr;
	this._reg.front[reg.id] = data;
    }

    byte * get (Register reg) {
	auto it = reg.id in this._reg.front;
	if (it is null)
	    this._reg.front[reg.id] = new byte[reg.size].ptr;
	return this._reg.front[reg.id];
    }

    mixin Singleton!Table;
}