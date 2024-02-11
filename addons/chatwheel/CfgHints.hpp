class CfgHints {
    class GVAR(UserGuide) {
        displayName = CSTRING(hint_UserGuide_Name);

        class KeybindsAndOptions {
            displayName = QUOTE(MOD_NAME);
            displayNameShort = CSTRING(hint_UserGuide_KeybindsAndOptions_DisplayNameShort);
            description = CSTRING(hint_UserGuide_KeybindsAndOptions_Description);

            image = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa";
            noImage = "false";
        };
    };
};