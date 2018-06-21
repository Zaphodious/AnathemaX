package com.blakwurm.djala;

import com.blakwurm.djala.System;
import com.blakwurm.djala.Registry;
import js.Browser;
import js.Browser.document;
import js.html.DOMElement;

class Ui implements SystemModule {

    public function preInit(system: System): Bool {
        return true;
    }
    public function init(system: System): Bool {
        setupCategoryButtons();
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

@:expose("Handlers") class Handlers {
    public static function toggleCategoryView(category: String) {
        var catview = document.querySelector("#" + category + "-view");
        trace("Pushed button for " + category);
        for (elem in document.querySelectorAll(".category-view")) {
            cast(elem, DOMElement).classList.remove("showing");
            trace(elem);
        }
        if (catview.classList.contains("showing")) {
            catview.classList.remove("showing");
        } else {
            catview.classList.add("showing");
        }
        trace(document.querySelector("#" + category + "-view"));
        }
}