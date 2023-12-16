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

        class Utils
        {
            file = QPATHTOF(functions\utils);
            class findAllVoicelineTags {};
            class getConfigNameFromTag {};
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