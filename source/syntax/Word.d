module syntax.Word;
import syntax.Tokens, syntax.Keys;
import std.algorithm, std.traits;

struct Location {
    ulong line;
    ulong column;
    ulong length;
    string file;
    bool eof;
}

struct Word {
    
    private Location _locus;
    private string _str;
    private bool _is_token = false;
        
    void locus (Location locus) {
	this._locus = locus;
    }
    
    Location locus () const {
	return this._locus;
    }
    
    string str () const {
	return this._str;
    }

    void str (string other) {
	this._str = other;
	this._is_token = checkToken (this._str);
    }
    
    bool isToken () const {
	return _is_token;
    }

    bool isEof () const {
	return this._locus.eof;
    }

    bool opEquals (T2 : Word) (T2 elem) const {
	return this._str == elem._str;
    }
    
    bool opEquals (T2 : Token)(T2 elem) const {
	return this._str == elem.descr;
    }
    
    static bool checkToken (string token) {
	return find!"a.descr == b" ([EnumMembers!Tokens], token) != [];
    }

    void setEof () {
	this._locus.eof = true;
	this._str = "";
    }
    
    static Word eof () {
	return Word (Location (0, 0, 0, null, false), "");
    }
    
}
