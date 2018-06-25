package com.blakwurm.anathema;

import com.blakwurm.djala.System;
import com.blakwurm.djala.Registry;
import js.Browser;
import js.Browser.document;
import js.html.DOMElement;

@:expose("AnathemaJS")
 @:keep
class AnathemaJS {
    public static function bootSystem(contextArg: String) {
        trace("provided context is " + contextArg);
        trace("Starting thing!");
        var args = new SystemArgs(function (sys: System) {
            sys.modules.set(Ui, new Ui({}));
            sys.modules.set(RegistrySystemModule, new RegistrySystemModule({}));
        });
        args.context = contextArg;
        //args.mobile = true;
        args.run();
        trace("Done Starting Thing!");
    }

    public static function toggleCategoryView(category: DOMElement) {
        trace(category.parentElement);
        var catview = document.querySelector("#" + category.id + "-view");

        //trace("Pushed button for " + category);

        var isVisable = catview.classList.contains("showing");

        for (elem in document.querySelectorAll(".category-view")) {
            cast(elem, DOMElement).classList.remove("showing");
            //trace(elem);
        }

        if (!isVisable) catview.classList.add("showing");
        
        //trace(catview.classList);
        }
}

class Ui implements SystemModule {

    public function preInit(system: System): Bool {
        return true;
    }
    public function init(system: System): Bool {
        setupCategoryButtons();
        
        trace(untyped document.anathemaContext);
        return true;
    }
    public function postInit(system: System): Bool return true;

    static function setupCategoryButtons() {
        /* document.querySelector("#document-category button")
            .onclick = function(event) {
                Browser.alert("Doing things with category button!");
            } */
    }

    
}