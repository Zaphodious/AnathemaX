package com.blakwurm.djala;

import com.blakwurm.djala.System;

class TemplateModule implements SystemModule {
    @exclude public var templates: Map<String, haxe.Template> =
        ["null" => new haxe.Template("")];
    public function preInit(system: System): Bool return true;
    public function init(system: System): Bool return true;
    public function postInit(system: System): Bool return true;
}