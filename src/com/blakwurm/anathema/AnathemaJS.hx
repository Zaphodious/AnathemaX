package com.blakwurm.anathema;

import com.blakwurm.djala.System;
import com.blakwurm.djala.Registry;
import js.Browser;
import js.Browser.document;
import js.html.DOMElement;
import js.html.Event;
import js.Promise;
import Niik;
import com.blakwurm.djala.EventHandlerModule;

using String;

@:expose("AnathemaJS")
 @:keep
class AnathemaJS {



    public static function bootSystem(bootArg: {context: String, bindingSRC: String}) {
        trace("provided context is " + bootArg.context);
        trace("Starting thing!");
        var sys = new System();

        sys.modules.set(Ui, new Ui({}));
        sys.modules.set(RegistrySystemModule, new RegistrySystemModule({}));
        sys.modules.set(EventHandlerModule, new EventHandlerModule({}).addHandlers(
            ["toggle-category" => SomeHandlers.toggleCategoryView]
        ));

        sys.systemArgs.context = bootArg.context;
        sys.systemArgs.bindingsSRC = bootArg.bindingSRC;
        
        sys.preInit();
        sys.init();
        sys.postInit();

        trace("Done Starting Thing!");
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

class SomeHandlers {
    public static function toggleCategoryView(event: Event) {
            var category: DOMElement = cast event.target;
            trace(category.parentElement);
            var catview = document.querySelector("#" + category.parentElement.id.split("-category")[0] + "-view");

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