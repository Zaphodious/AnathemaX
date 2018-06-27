package com.blakwurm.djala;

import com.blakwurm.ModularEntity;
import com.blakwurm.djala.GameEntity;
import DataClass;

class System {
    public var modules: ModularEntity<SystemModule> = new ModularEntity({name: "System"});
    public var systemArgs: SystemArgs;
    public function new() {this.systemArgs = new SystemArgs(this);}

    public function kickoff(): System return this.preInit().init().postInit();
    

    public function init(): System {
        for (sm in modules.iterator()) {
            sm.init(this);
        }
        return this;
    }

    public function preInit(): System {
        for (sm in modules.iterator()) {
            sm.preInit(this);
        }
        return this;
    }

    public function postInit(): System {
        for (sm in modules.iterator()) {
            sm.postInit(this);
        }
        return this;
    }
}

class SystemArgs {

    public function new(system: System) {this.system = system;}

    public var server: Bool = false;
    public var headless: Bool = false;
    public var mobile: Bool = false;
    public var dbname: String = "data";
    public var context: String = "shell";
    public var bindingsSRC: String = "";

    // Necessary to make the "run" function work on the command line target.
    private var system: System;

    @:defaultCommand
    public function run() {
        trace("Setting up the system!");
        system.kickoff();
        trace("System is done setting up!");

    }
}

interface SystemModule extends Module {
    public function preInit(system: System): Bool;
    public function init(system: System): Bool;
    public function postInit(system: System): Bool;
}
