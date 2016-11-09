module code.If;
import code.Instruction, code.Expression;

class If : Instruction {

    private Expression _test;
    private string _where;

    this (Expression test, string where) {
	this._where = where;
	this._test = test;
    }

    override void execute (Frame frame) {
	int size = this._test.size;
	byte * data = this._test.get;
	bool res;
	switch (size) {
	case 1:
	    res = *(data)==0;
	    break;
	case 2:
	    res = *(cast(short*)data)==0;
	    break;
	case 4:
	    res = *(cast(int*)data)==0;
	    break;
	case 8:
	    res = *(cast(long*)data)==0;
	    break;
	case -4:
	    res = *(cast(float*)data)==0;
	    break;
	case -8:
	    res = *(cast(double*)data)==0;
	    break;
	default:
	    res = true;
	    foreach (i ; 0 .. abs(size)) {
		if (*(data+i) != 0) {
		    res = false;
		    break;
		}
	    }
	}
	if (!res)
	    frame.jump (this._where);
    }

    string where () {
	return this._where;
    }

    Expression test () {
	return this._test;
    }


}
