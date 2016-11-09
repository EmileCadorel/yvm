module mem.FrameTable;
import std.container;
import utils.Singleton;

class FrameTable {

    private Frame[string] _frames;

    void set (Frame[string] frames) {
	this._frames = frames;
    }

    Frame get (string name) {
	return *(name in this._frames);
    }

    mixin Singleton!FrameTable;
}