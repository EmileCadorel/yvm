module mem.Table;
import code.Register;
import utils.Singleton;

class Table {

    private byte*[ulong] _reg;

    // void add (Register reg) {
    // 	auto it = reg in this._reg;
    // 	if (it !is null) {
    // 	    byte * alloc = new byte[reg.size];
    // 	    this._reg[reg.id] = alloc;
    // 	    return alloc;
    // 	}
    // 	return *it;
    // }

    mixin Singleton!Table;
}