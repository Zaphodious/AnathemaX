package com.blakwurm.djala;

import com.blakwurm.djala.System;
import com.blakwurm.djala.Registry;

class Ui implements SystemModule {
    public function preInit(system: System): Bool {
        if (!system.systemArgs.headless) {
            
        }
        return true;
    }
    public function init(system: System): Bool {
        
        return true;
    }
    public function postInit(system: System): Bool return true;
}