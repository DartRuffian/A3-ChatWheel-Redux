/*
 * Author: DartRuffian
 * Creates a diary tab showing all available tags and what they are replaced with.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call CWR_CreateTagMenu;
 */

// Normal text settings:
// "<font size='13' face='RobotoCondensed'>Normal Text</font>"

// Main menu that everything will be in
player createDiarySubject ["CWR_TagsSubject", "Chat Wheel Tags"];

// List form of text
private _tags =
[
    [
        "[contact]",
        '[contact] will prompt the user to open a submenu and select a distance after selection an option. This tag adds quite a bit to the message: <br />  - "Contact!" is added to the beginning <br />  - The direction the player is facing <br />  - The bearing the player is facing <br />  - The selected distance ("Close!", "Mid!", "Far!") is added to the end of the message.',
        ["Infantry [contact]!", "Contact! Infantry North, bearing 0! Close!"]
    ],
    [
        "[weapon]",
        "[weapon] will be replaced with the name of the weapon the player is currently holding.",
        ["I'm holding a [weapon]!", "I'm holding a MX!"]
    ]
];
reverse _tags; // Records are created in reverse order, this makes it appear in the same order it's written in

// The records are somewhat finnicky, if you add a record to a different a submenu, you can't access the previous submenu.
// Submenus and records are also added from bottom to top, so everything needs to be added in reverse.
// Two loops are needed (one for each submenu) because you wouldn't be able to add the title to first submenu if both were in the same loop.
{
    // Example usages of tags
    private _raw = _x#2#0;
    _raw = '<font face="etelkaMonospacePro" size="10">"' + _raw + '"</font>';

    private _formatted = _x#2#1;
    _formatted = '<font face="etelkaMonospacePro" size="10">"' + _formatted + '"</font>';
    
    player createDiaryRecord ["CWR_TagsSubject", ["Examples", (_x#0 + "<br />" + ([_raw, _formatted] joinString "<br />becomes<br />"))]];
} forEach _tags;
player createDiaryRecord ["CWR_TagsSubject", ["Examples", "<font color='#add8e6' size='20' face='RobotoCondensedBold'>Tag Examples!</font>"]];

{
    // List of each tag and what it does
    player createDiaryRecord ["CWR_TagsSubject", ["Message Tags", (_x#0 + "<br />" + _x#1)]];
} forEach _tags;
player createDiaryRecord ["CWR_TagsSubject", ["Message Tags", "<font color='#add8e6' size='20' face='RobotoCondensedBold'>Tags!</font>"]];