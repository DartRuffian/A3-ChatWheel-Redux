#include "script_component.hpp"
#include "CfgEventHandlers.hpp"
#include "CWR_MessageList.hpp"


class CfgPatches
{
    class ADDON
    {
        author = "DartRuffian";
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] =
        {
            QCLASS(Core)
        };
        units[] = {};
        weapons[] = {};
        VERSION_CONFIG;
    };
};