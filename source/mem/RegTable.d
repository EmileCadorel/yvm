module mem.RegTable;
import utils.Singleton, std.container;

class RegTable {

    this () {
	this._upFrame = new FrameTable ();
	this._last = 1;
    }    

    void enterFrame () {	
	this._frames.insertFront (this._upFrame);
	this._currentFrame = this._upFrame.regs;
	if (!this._cache.empty) {
	    this._upFrame = this._cache.front ();
	    this._cache.removeFront ();
	} else this._upFrame = new FrameTable ();
	this._last = 1;
    }
    
    long * slow_q (ulong id) {
	if (this._currentFrame.length <= id) this._currentFrame.length = id * 2;
	return &this._currentFrame[id];
    }

    int * slow_d (ulong id) {
	if (this._currentFrame.length <= id) this._currentFrame.length = id * 2;
	return (cast (int*)&this._currentFrame[id]) + 1;
    }

    short * slow_w (ulong id) {
	if (this._currentFrame.length <= id) this._currentFrame.length = id * 2;
	return (cast (short*)&this._currentFrame[id]) + 2;
    }
    
    byte * slow_b (ulong id) {
	if (this._currentFrame.length <= id) this._currentFrame.length = id * 2;
	return (cast (byte*)&this._currentFrame[id]) + 4;
    }

    float * slow_sp (ulong id) {
	if (this._currentFrame.length <= id) this._currentFrame.length = id * 2;
	return (cast (float*)&this._currentFrame[id]) + 1;
    }
    
    double * slow_dp (ulong id) {
	if (this._currentFrame.length <= id) this._currentFrame.length = id * 2;
	return (cast (double*)&this._currentFrame[id]);
    }
        
    long * q (ulong id) {
	return &this._currentFrame[id];
    }

    int * d (ulong id) {
	return (cast (int*)&this._currentFrame[id]) + 1;
    }

    short * w (ulong id) {
	return (cast (short*)&this._currentFrame[id]) + 2;
    }
    
    byte * b (ulong id) {
	return (cast (byte*)&this._currentFrame[id]) + 4;
    }

    float * sp (ulong id) {
	return (cast (float*)&this._currentFrame[id]) + 1;
    }
    
    double * dp (ulong id) {
	return (cast (double*)&this._currentFrame[id]);
    }
           
    ref FrameTable param () {
	return this._upFrame;
    }    

    ref ulong last () {
	return this._last;
    }
    
    void quitFrame () {
	this._cache.insertFront (this._frames.front ());
	this._frames.removeFront ();

	if (!this._frames.empty)
	    this._currentFrame = this._frames.front ().regs;
	this._last = 1;
    }
    
    private SList!FrameTable _frames;
    private SList!FrameTable _cache;
    private FrameTable _upFrame;
    private Array!long _currentFrame;

    
    private ulong _last;
    
    mixin Singleton!RegTable;
}

class FrameTable {

    this () {
	this._regs = make!(Array!long) (0, 0, 0, 0, 0, 0, 0, 0);
    }

    ref Array!long regs () {
	return this._regs;
    }

    long * slow_q (ulong id) {
	if (this._regs.length <= id) this._regs.length = id;
	return &this._regs[id];
    }

    int * slow_d (ulong id) {
	if (this._regs.length <= id) this._regs.length = id;
	return (cast (int*)&this._regs[id]) + 1;
    }

    short * slow_w (ulong id) {
	if (this._regs.length <= id) this._regs.length = id;
	return (cast (short*)&this._regs[id]) + 2;
    }
    
    byte * slow_b (ulong id) {
	if (this._regs.length <= id) this._regs.length = id;
	return (cast (byte*)&this._regs[id]) + 4;
    }

    float * slow_sp (ulong id) {
	if (this._regs.length <= id) this._regs.length = id;
	return (cast (float*)&this._regs[id]) + 1;
    }
    
    double * slow_dp (ulong id) {
	if (this._regs.length <= id) this._regs.length = id;
	return (cast (double*)&this._regs[id]);
    }
        
    long * q (ulong id) {
	return &this._regs[id];
    }

    int * d (ulong id) {
	return (cast (int*)&this._regs[id]) + 1;
    }

    short * w (ulong id) {
	return (cast (short*)&this._regs[id]) + 2;
    }
    
    byte * b (ulong id) {
	return (cast (byte*)&this._regs[id]) + 4;
    }

    float * sp (ulong id) {
	return (cast (float*)&this._regs[id]) + 1;
    }
    
    double * dp (ulong id) {
	return (cast (double*)&this._regs[id]);
    }
               
    private Array!long _regs;
    
}
