class CfgMagazines {
    class CA_Magazine;
    class HandGrenade: CA_Magazine {
        GVARMAIN(grenadeType) = CSTRING(grenadeType_Grenade);
    };

    class SmokeShell: HandGrenade {
        GVARMAIN(grenadeType) = CSTRING(grenadeType_Smoke);
    };

    class Chemlight_green: SmokeShell {
        GVARMAIN(grenadeType) = CSTRING(grenadeType_Chemlight);
    };

    class B_IR_Grenade: CA_Magazine {
        GVARMAIN(grenadeType) = CSTRING(grenadeType_IR);
        GVARMAIN(grenadeLocalized) = CSTRING(grenadeType_IR_localized);
    };
};