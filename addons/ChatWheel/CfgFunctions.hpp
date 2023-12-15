class CfgFunctions
{
    class CWR
    {
        class Settings
        {
            file = QPATHTOF(functions\settings);
            class configureAddonKeybinds {};
            class configureAddonOptions {};
            class createTagMenu {};
        };

        class Chat
        {
            file = QPATHTOF(functions\chat);
            class openChatWheel {};
            class processTags {};
            class sendGroupMessage {};
            class sendLocalMessage {};
            class configureMenus {};
        };

        class Sounds
        {
            file = QPATHTOF(functions\sounds);
            class playLocalSound {};
        };

        class Utils
        {
            file = QPATHTOF(functions\utils);
            class getDirFromBearing {};
            class stringReplace {};
            class removeQuotes {};
            class findAllVoicelineTags {};
            class getConfigNameFromTag {};
            class devLog {};

            class isPlayer {};
            class getNearbyPlayers {};

            class sortByDistance {};
        };

        class EventHandlers
        {
            file = QPATHTOF(functions\eventHandlers);
            class throwGrenadeMain {};
            class throwGrenadeEH {};
            class throwGrenadeEHACE {};
            class unconsciousEH {};
        };
    };
};