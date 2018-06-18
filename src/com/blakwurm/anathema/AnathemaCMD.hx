package com.blakwurm.anathema;

import tink.Cli;
import com.blakwurm.djala.System;
import com.blakwurm.djala.Server;
import com.blakwurm.djala.Registry;

class AnathemaCMD {
    public static function main() {
        trace("Starting thing!");
        var systemArgs = new SystemArgs(function (sys: System) {
            sys.modules.set(ServerSystemModule, new ServerSystemModule({}));
            sys.modules.set(RegistrySystemModule, new RegistrySystemModule({}));
        });
        systemArgs.server = true;
        Cli.process(Sys.args(), systemArgs);
        trace("Done Starting Thing!");
    }
}