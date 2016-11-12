module mem.Table;
import std.container;
import code.Register;
import utils.Singleton;

class Table {

    private SList!(byte*[]) _reg;

    void enterFrame () {
	this._reg.insertFront ((byte*[]).init);
	this._reg.front.length = 10;
    }

    void exitFrame () {
	this._reg.removeFront ();
    }

    void add (Register reg, byte* data) {
	if (reg.id >= this._reg.front.length) this._reg.front.length += (reg.id + 1);
	this._reg.front[reg.id] = data;
    }

    byte * get (Register reg) {
	if (reg.id >= this._reg.front.length) this._reg.front.length += (reg.id + 1);
	if (this._reg.front[reg.id] is null)
	    this._reg.front[reg.id] = new byte[reg.size].ptr;
	return this._reg.front[reg.id];
    }

    mixin Singleton!Table;
}
