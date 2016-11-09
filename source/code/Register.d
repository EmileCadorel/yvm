module code.Register;
import code.Expression;

class Register : Expression {

    private ulong _id;
    private int _size;

    this (ulong id, int size) {
	this._id = id;
	this._size = size;
    }

    ulong id() {
	return this._id;
    }

    override int size () {
	return this._size;
    }

    override byte * get () {
	return null;
    }
}
