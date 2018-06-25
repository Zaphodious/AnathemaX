package com.blakwurm.djala;

import com.blakwurm.djala.System;
import js.html.Event;
import Niik;

class EventHandlerModule implements SystemModule {

    @exclude public var niik = new Niik();
    public var cssSRC: String;

    public function addHandlers(registry: Niik.HandlerRegistry): EventHandlerModule {
        niik.registerHandlers(registry);
        return this;
    }

    public function preInit(system: System): Bool {
        cssSRC = system.systemArgs.bindingsSRC;
        return true;
    }

    public function init(system: System): Bool {

        return true;
    }

    public function postInit(system: System): Bool {
        niik.startWithSRC(cssSRC);
        return true;
    }
}