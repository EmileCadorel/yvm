module code.Register;
import code.Expression;
import mem.RegTable, std.stdio;

class Register : Expression {

    private ulong _id;
    
    this (ulong id) {
	this._id = id;
    }

    ulong id() {
	return this._id;
    }

    override byte * b () {
	return RegTable.instance.b (this._id);
    }

    override short * w () {
	return RegTable.instance.w (this._id);
    }
    
    override int * d () {
	return RegTable.instance.d (this._id);
    }
    
    override long * q () {
	return RegTable.instance.q (this._id);
    }

    override float * sp () {
	return RegTable.instance.sp (this._id);
    }

    override double * dp () {
	return RegTable.instance.dp (this._id);
    }

}


class RegisterSlow : Register {

    this (ulong id) {
	super (id);
    }

    override byte * b () {
	return RegTable.instance.slow_b (this._id);
    }

    override short * w () {
	return RegTable.instance.slow_w (this._id);
    }
    
    override int * d () {
	return RegTable.instance.slow_d (this._id);
    }
    
    override long * q () {
	return RegTable.instance.slow_q (this._id);
    }

    override float * sp () {
	return RegTable.instance.slow_sp (this._id);
    }

    override double * dp () {
	return RegTable.instance.slow_dp (this._id);
    }

    
}
