class GVAR(Tags)
{
    class Bearing
    {
        description = "Your current bearing.";
        statement = QUOTE(round direction player);
        example = "'I'm facing [tag]' → 'I'm facing 0'";
    };

    class Direction
    {
        description = "Your current direction.";
        statement = QUOTE(round direction player call EFUNC(Core,bearingToDirection));
        example = "'I'm facing [tag]' → 'I'm facing North'";
    };

    class Weapon
    {
        description = "Your current held weapon.";
        statement = QUOTE(getText (configFile >> 'CfgWeapons' >> currentWeapon player >> 'displayName'));
        example = "'I'm holding a [tag]' → 'I'm holding a MX 6.5mm'";
    };

    class Contact
    {
        description = "Opens a new menu to select from 'Infantry', 'Vehicle', or 'Fortification'.";
        statement = "";
        example = "'Contact, [tag]!' → 'Contact, infantry!'";

        class Options
        {
            // Contact! Infantry [direction], Bearing [bearing]! [distance]!
            class Infantry
            {
                displayName = "Infantry";
                statement = QUOTE('[vl-ContactInfantry]infantry');
                order = 0;
            };
            class Vehicle
            {
                displayName = "Vehicle";
                statement = QUOTE('[vl-ContactVehicle]vehicle');
                order = 1;
            };
            class Fortification
            {
                displayName = "Fortification";
                statement = QUOTE('[vl-ContactFortification]fortification');
                order = 2;
            };
        };
    };

    class Distance
    {
        description = "Opens a new menu to select from 'Close', 'Medium', or 'Far'.";
        statement = "";
        example = "'There's infantry [tag]' → 'There's infantry close'";

        class Options
        {
            class Close
            {
                displayName = "Close";
                statement = QUOTE('close');
                order = 0;
            };
            class Medium
            {
                displayName = "Medium";
                statement = QUOTE('medium');
                order = 1;
            };
            class Far
            {
                displayName = "Far";
                statement = QUOTE('far');
                order = 2;
            };
        };
    };

    class Status
    {
        description = "Opens a new menu to select from 'Call Check', 'Green', 'Yellow', 'Red', or 'Black'.";
        statement = "";
        example = "'Status [tag]' → 'Status green'";

        class Options
        {
            class CallCheck
            {
                displayName = "Call Check";
                statement = QUOTE('[vl-ACECheck]ACE check');
                order = 0;
            };
            class StatusGreen
            {
                displayName = "Green";
                statement = QUOTE('[vl-StatusGreen]green');
                order = 1;
            };
            class StatusYellow
            {
                displayName = "Yellow";
                statement = QUOTE('[vl-StatusYellow]yellow');
                order = 2;
            };
            class StatusRed
            {
                displayName = "Red";
                statement = QUOTE('[vl-StatusRed]red');
                order = 3;
            };
            class StatusBlack
            {
                displayName = "Black";
                statement = QUOTE('[vl-StatusBlack]black');
                order = 4;
            };
        };
    };

    class Launcher
    {
        description = "Opens a new menu to select from 'Permission to fire', 'Clear backblast', 'Backblast clear', or 'Rocket rocket rocket'.";
        statement = "";
        example = "'[tag]?' → 'Permission to fire?'";

        class Options
        {
            class AskPermission
            {
                displayName = "Permission to Fire?";
                statement = QUOTE('[vl-AskFirePermission]Permission to fire');
                order = 0;
            };
            class ClearBackblast
            {
                displayName = "Clear Backblast";
                statement = QUOTE('[vl-ClearBackblast]Clear backblast');
                order = 1;
            };
            class BackblastClear
            {
                displayName = "Backblast Clear";
                statement = QUOTE('[vl-BackblastClear]Backblast clear');
                order = 2;
            };
            class FireRocket
            {
                displayName = "Rocket Rocket Rocket!";
                statement = QUOTE('[vl-RocketFire]Rocket rocket rocket');
                order = 3;
            };
        };
    };
};