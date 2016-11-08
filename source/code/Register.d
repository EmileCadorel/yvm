module code.Register;
import code.Expression;

/*
  on va chercher si le registre est déjà présent dans la table de registres, si ce n'est pas le cas on l'ajoute, sinon on met à jour
  dans la table on aura un tableau assoc de byte*[ulong]
 */
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
}
