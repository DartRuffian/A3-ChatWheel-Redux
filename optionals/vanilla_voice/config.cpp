#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        author = "Dart";
        authors[] = {"Dart"}
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "cwr_chatwheel"
        };
        units[] = {};
        weapons[] = {};
        VERSION_CONFIG;
    };
};

#include "CWR_ChatWheel_VoiceLines.hpp"