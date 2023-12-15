#include "script_component.hpp"
#include "CfgFunctions.hpp"


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

class Extended_PreInit_EventHandlers
{
    class CWR_ConfigureKeybinds
    {
        init = QUOTE(call CWR_fnc_configureAddonKeybinds;);
    };
    class CWR_ConfigureOptions
    {
        init = QUOTE(call CWR_fnc_configureAddonOptions;);
    };
    class CWR_ConfigureChatMenus
    {
        init = QUOTE(call CWR_fnc_configureMenus;);
    };
};


class Extended_PostInit_EventHandlers
{
    class CWR_CreateTagDiary
    {
        init = QUOTE(call CWR_fnc_createTagMenu;);
    };
    class CWR_ThrowGrenadeEH
    {
        init = QUOTE(if isClass (configFile >> 'CfgPatches' >> 'ace_common') then { call CWR_fnc_throwGrenadeEHACE; } else { call CWR_fnc_throwGrenadeEH; };);
    };
    class CWR_UnconciousEH
    {
        init = QUOTE(call CWR_fnc_unconsciousEH);
    };
};
