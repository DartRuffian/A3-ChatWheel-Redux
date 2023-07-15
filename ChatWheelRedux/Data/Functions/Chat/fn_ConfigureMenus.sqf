// CBA's implementation of Hashmaps are sorted by insertion order, while BIS game's are not.
// Order is important since the order of the keys is how they are displayed in the chat menu.
CWR_messagesHashMap =
[
    [
        ["Medic", "I need a medic!"],
        ["Help", "Help me!"],
        ["Apologize", "Sorry!"],
        ["Follow", "Follow me!"],
        ["Contact", "Infantry [callOut]!"],
        // "[callout]" is replaced with the bearing, direction, and a distance, and 
        // "Contact!" is appended to the beginning
        ["Vehicle", "Vehicle [callOut]!"],
        ["Fortification", "Fortification [callOut]!"],
        ["Low Ammo", "I need ammo for my [currentWeapon]!"],
        // "[currentWeapon]" is replaced with the displayName of the player's current weapon
        ["Custom 1", "Default Message"], // Configurable messages that can be set in the addon options
        ["Custom 2", "Default Message"],
        ["Custom 3", "Default Message"],
        ["Custom 4", "Default Message"]
    ],
    "Default Message"
] call CBA_fnc_hashCreate;