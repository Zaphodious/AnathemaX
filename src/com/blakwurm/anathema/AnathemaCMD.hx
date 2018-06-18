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
        var systemo: System;
        var systemArgs = new SystemArgs(function (sys: System) {
            sys.modules.set(ServerSystemModule, new ServerSystemModule({}));
            var regmod = new RegistrySystemModule({});
            regmod.store = new FileRegistry(sys.systemArgs.dbname);
            sys.modules.set(RegistrySystemModule, regmod);
            systemo = sys;
        });
        systemArgs.server = true;
        Cli.process(Sys.args(), systemArgs);
        trace("system is " + systemo);
        systemo.modules.get(RegistrySystemModule).store.insert(GameEntity.initCharacter());
        trace("Done Starting Thing!");
    }
}