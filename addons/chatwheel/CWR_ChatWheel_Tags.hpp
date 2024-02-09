class CWR_ChatWheel_Tags
{
    class Bearing
    {
        description = CSTRING(tag_Bearing);
        statement = QUOTE(round direction _this);
        example = CSTRING(tagExample_Bearing);
    };

    class Direction
    {
        description = CSTRING(tag_Direction);
        statement = QUOTE(round direction _this call EFUNC(main,bearingToDirection));
        example = CSTRING(tagExample_Direction);
    };

    class Weapon
    {
        description = CSTRING(tag_Weapon);
        statement = QUOTE(getText (configFile >> 'CfgWeapons' >> currentWeapon _this >> 'displayName'));
        example = CSTRING(tagExample_Weapon);
    };

    class Contact
    {
        description = CSTRING(tag_Contact);
        statement = "";
        example = CSTRING(tagExample_Contact);

        class Options
        {
            // Contact! Infantry [direction], Bearing [bearing]! [distance]!
            class Infantry
            {
                displayName = CSTRING(tagTitle_Contact_Infantry);
                statement = QUOTE(LLSTRING(tag_Contact_Infantry));
                order = 0;
            };
            class Vehicle
            {
                displayName = CSTRING(tagTitle_Contact_Vehicle);
                statement = QUOTE(LLSTRING(tag_Contact_Vehicle));
                order = 1;
            };
            class Fortification
            {
                displayName = CSTRING(tagTitle_Contact_Fortification);
                statement = QUOTE(LLSTRING(tag_Contact_Fortification));
                order = 2;
            };
        };
    };

    class Distance
    {
        description = CSTRING(tag_Distance);
        statement = "";
        example = CSTRING(tagExample_Distance);

        class Options
        {
            class Close
            {
                displayName = CSTRING(tagTitle_Distance_Close);
                statement = QUOTE(LLSTRING(tag_Distance_Close));
                order = 0;
            };
            class Medium
            {
                displayName = CSTRING(tagTitle_Distance_Medium);
                statement = QUOTE(LLSTRING(tag_Distance_Medium));
                order = 1;
            };
            class Far
            {
                displayName = CSTRING(tagTitle_Distance_Far);
                statement = QUOTE(LLSTRING(tag_Distance_Far));
                order = 2;
            };
        };
    };

    class Status
    {
        description = CSTRING(tag_Status);
        statement = "";
        example = CSTRING(tagExample_Status);

        class Options
        {
            class CallCheck
            {
                displayName = CSTRING(tagTitle_Status_CallCheck);
                statement = QUOTE(LLSTRING(tag_Status_CallCheck));
                order = 0;
            };
            class Green
            {
                displayName = CSTRING(tagTitle_Status_Green);
                statement = QUOTE(LLSTRING(tag_Status_Green));
                order = 1;
            };
            class Yellow
            {
                displayName = CSTRING(tagTitle_Status_Yellow);
                statement = QUOTE(LLSTRING(tag_Status_Yellow));
                order = 2;
            };
            class Red
            {
                displayName = CSTRING(tagTitle_Status_Red);
                statement = QUOTE(LLSTRING(tag_Status_Red));
                order = 3;
            };
            class Black
            {
                displayName = CSTRING(tagTitle_Status_Black);
                statement = QUOTE(LLSTRING(tag_Status_Black));
                order = 4;
            };
        };
    };

    class Launcher
    {
        description = CSTRING(tag_Launcher);
        statement = "";
        example = CSTRING(tagExample_Launcher);

        class Options
        {
            class AskPermission
            {
                displayName = CSTRING(tagTitle_Launcher_AskPermission);
                statement = QUOTE(LLSTRING(tag_Launcher_AskPermission));
                order = 0;
            };
            class ClearBackblast
            {
                displayName = CSTRING(tagTitle_Launcher_ClearBackblast);
                statement = QUOTE(LLSTRING(tag_Launcher_ClearBackblast));
                order = 1;
            };
            class BackblastClear
            {
                displayName = CSTRING(tagTitle_Launcher_BackblastClear);
                statement = QUOTE(LLSTRING(tag_Launcher_BackblastClear));
                order = 2;
            };
            class FireRocket
            {
                displayName = CSTRING(tagTitle_Launcher_FireRocket);
                statement = QUOTE(LLSTRING(tag_Launcher_FireRocket));
                order = 3;
            };
        };
    };
};