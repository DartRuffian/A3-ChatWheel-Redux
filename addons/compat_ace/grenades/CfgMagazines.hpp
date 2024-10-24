class CfgMagazines {
    class HandGrenade;
    class ACE_HandFlare_Base: HandGrenade {
        GVARMAIN(grenadeType) = ECSTRING(chatwheel,grenadeType_Flare);
    };

    class ACE_M84: HandGrenade {
        GVARMAIN(grenadeType) = ECSTRING(chatwheel,grenadeType_Flashbang);
    };

    class ACE_CTS9: HandGrenade {
        GVARMAIN(grenadeType) = ECSTRING(chatwheel,grenadeType_Flashbang);
    };

    class SmokeShell;
    class ACE_M14: SmokeShell {
        GVARMAIN(grenadeType) = ECSTRING(chatwheel,grenadeType_Incendiary);
        GVARMAIN(grenadeLocalized) = ECSTRING(chatwheel,grenadeType_Incendiary_localized);
    };
};