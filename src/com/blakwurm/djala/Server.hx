package com.blakwurm.djala;

import com.blakwurm.djala.System;
using monsoon.middleware.Static;
using monsoon.middleware.Compression;
using Monsoon;

class ServerSystemModule implements SystemModule {
    public var name: String = "Server";
    @exclude var monsoon: Monsoon;

    @exclude public function preInit(system: System): Bool {return true;}
    @exclude public function init(system: System): Bool {
        var isServer = system.systemArgs.server;
        if (isServer) {
            monsoon = new Monsoon();
            trace("Server module booting!");
            var debugTemplateValues = {pagetitle: "I Love You Liana"}
            monsoon.route(
                '/',
                function (req, res) res.send(
                    new haxe.Template(
                    sys.io.File.getContent('resources/templates/shell.html')).execute(debugTemplateValues)
                )
        );
            monsoon.route(
                '/char',
                function (req, res) res.send('Character is')
        );
        
            monsoon.use(Compression.serve());
            monsoon.use(Static.serve('resources/'));

        monsoon.listen(15000);
        trace("Server module has booted!");
        }
         
        return true;
    }
    @exclude public function postInit(system: System): Bool {return true;}
}