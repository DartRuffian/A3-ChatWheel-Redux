class CfgPatches
{
    class ChatWheelRedux
    {
        author = "DartRuffian";
        weapons[] = {};
        units[] = {};
        requiredversion = 0.1;
        requiredaddons[] =
        {
            "cba_settings",
            "cba_keybinding"
        };
    };
};


class CfgFunctions
{
    class CWR
    {
        class Settings
        {
            file = "ChatWheelRedux\Data\Functions\Settings";
            class ConfigureAddonKeybinds {};
            class ConfigureAddonOptions {};
        };

        class Chat
        {
            file = "ChatWheelRedux\Data\Functions\Chat";
            class Chat {};
            class SendMessage {};
            class ConfigureMenus {};
        };

        class Utils
        {
            file = "ChatWheelRedux\Data\Functions\Utils";
            class GetDirFromBearing {};
            class StringReplace {};
            class RemoveQuotes {};
        };
    };
};


class Extended_PreInit_EventHandlers
{
    class CWR_ConfigureKeybinds
    {
        init = "call CWR_fnc_ConfigureAddonKeybinds;";
    };
    class CWR_ConfigureOptions
    {
        init = "call CWR_fnc_ConfigureAddonOptions;";
    };
    class CWR_ConfigureChatMenus
    {
        init = "call CWR_fnc_ConfigureMenus;";
    };
};


// class Extended_PostInit_EventHandlers
// {
//     class CWR_Something
//     {
//         init = "call CWR_fnc_Something;";
//     };
// };