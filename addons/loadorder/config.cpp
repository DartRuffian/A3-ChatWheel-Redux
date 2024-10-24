#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        author = AUTHOR;
        authors[] = {"DartRuffian"};
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "cwr_chatwheel",
            "cwr_common",
            "cwr_main"
        };
        units[] = {};
        weapons[] = {};
        VERSION_CONFIG;
    };
};