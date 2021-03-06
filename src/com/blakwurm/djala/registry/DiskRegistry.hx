package com.blakwurm.djala.registry;

import com.blakwurm.djala.Registry;
import com.blakwurm.djala.GameEntity;

using haxe.Json;

class FileRegistry extends AbstractRegistry {
    var filename: String;

    public function new(dbname: String) {
        filename = dbname + ".djala";
    }

    override public function insert(thing: ModularEntity<GameEntityModule>) : Bool {
        var result = super.insert(thing);
        sys.io.File.saveContent(filename, entities.stringify());
        return result;
    }
}