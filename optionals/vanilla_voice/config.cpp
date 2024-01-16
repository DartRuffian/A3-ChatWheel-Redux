#include "script_component.hpp"
#include "CWR_ChatWheel_VoiceLines.hpp"


class CfgPatches
{
    class ADDON
    {
        author = "DartRuffian";
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] =
        {
            QCLASS(main),
            QCLASS(chatwheel)
        };
        units[] = {};
        weapons[] = {};
        VERSION_CONFIG;
    };
};