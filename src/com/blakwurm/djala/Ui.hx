package com.blakwurm.djala;

import com.blakwurm.djala.System;
import com.blakwurm.djala.Registry;
import js.Browser;
import js.Browser.document;

class Ui implements SystemModule {
    public function preInit(system: System): Bool {
        if (!system.systemArgs.headless) {
            
        }
        return true;
    }
    public function init(system: System): Bool {
        setupCategoryButtons();
        return true;
    }
    public function postInit(system: System): Bool return true;

    static function setupCategoryButtons() {
        document.querySelector("#document-category button")
            .onclick = function(event) {
                toggleCategoryView("document");
                Browser.alert("Doing things with category button!");
            }
    }
}

class CategoryButtonsFns {
    static function toggleCategoryView(category: String) {
        document.querySelector("#" + category + "-category button").onclick =
            function(event) {
                var classes = document.querySelector("#" category + "-view").classList
                if (classes.contains("showing")) {
                    classes.remove("showing")
                } else {
                    classes.add("showing")
                }
            }
    }
}