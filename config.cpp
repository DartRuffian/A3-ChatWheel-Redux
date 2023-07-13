class cfgpatches
{
    class jen_chat
    {
        author = "Jenna";
        weapons[]={};
        units[]={};
        requiredversion = 0.1;
        requiredaddons[]={};
    };
};

class Extended_PostInit_EventHandlers {
    class jen_chat_keybindings {
        init = "call compileScript ['\jen_chatwheel\xeh_postinit.sqf']";
    };
};

class Extended_PreInit_EventHandlers {
    class jen_chat_settings {
        init = "call compileScript ['\jen_chatwheel\xeh_preinit.sqf']";
    };
};

class cfgfunctions
{
    class jen
    {
        class functions
        {
            class chat
            {
                file = "\jen_chatwheel\functions\jen_chat.sqf";
            };
        };
    };
};