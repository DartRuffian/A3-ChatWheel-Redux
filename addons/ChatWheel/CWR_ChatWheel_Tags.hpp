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

    class Distance
    {
        description = "Opens a new menu to select from 'Close', 'Medium', or 'Far'.";
        statement = QUOTE('not implemented');
        example = "'There's infantry [tag]' → 'There's infantry close'";
    };

    class Status
    {
        description = "Opens a new menu to select from 'Green', 'Yellow', 'Red', or 'Black'.";
        statement = QUOTE('not implemented');
        example = "'Status [tag]' → 'Status Green'";
    };

    class Launcher
    {
        description = "Opens a new menu to select from 'Permission to fire', 'Clear backblast', 'Backblast clear', or 'Rocket rocket rocket'.";
        statement = QUOTE('not implemented');
        example = "'[tag]?' → 'Permission to fire?'";
    };
};