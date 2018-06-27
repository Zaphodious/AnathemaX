package com.blakwurm.anathema;

import tink.Cli;
import com.blakwurm.djala.System;
import com.blakwurm.djala.Server;
import com.blakwurm.djala.Registry;
import com.blakwurm.djala.registry.DiskRegistry;
import com.blakwurm.djala.GameEntity;

class AnathemaCMD {
    public static function main() {
        trace("Starting thing!");
        var sys: System =  new System();
        sys.modules.set(ServerSystemModule, new ServerSystemModule({}));
        var regmod = new RegistrySystemModule({});
        regmod.store = new FileRegistry(sys.systemArgs.dbname);
        sys.modules.set(RegistrySystemModule, regmod);

        sys.systemArgs.server = true;
        sys.systemArgs.context = "server";

        Cli.process(Sys.args(), sys.systemArgs);

        sys.modules.get(RegistrySystemModule).store.insert(GameEntity.initCharacter());

        trace("system is " + sys);
        trace("Done Starting Thing!");
    }
}