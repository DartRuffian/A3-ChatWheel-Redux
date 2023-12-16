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
            QCLASS(Core),
            QCLASS(ChatWheel)
        };
        units[] = {};
        weapons[] = {};
        VERSION_CONFIG;
    };
};