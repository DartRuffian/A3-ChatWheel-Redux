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


#include "CWR_VoiceLines.hpp"


class CfgFunctions
{
    class CWR
    {
        class Settings
        {
            file = "ChatWheelRedux\Data\Functions\Settings";
            class ConfigureAddonKeybinds {};
            class ConfigureAddonOptions {};
            class CreateTagMenu {};
        };

        class Chat
        {
            file = "ChatWheelRedux\Data\Functions\Chat";
            class OpenChatWheel {};
            class SendMessage {};
            class ConfigureMenus {};
            class PlayLocalSound {};
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


class Extended_PostInit_EventHandlers
{
    class CWR_ConfigureTagDiary
    {
        init = "call CWR_fnc_CreateTagMenu;";
    };
};