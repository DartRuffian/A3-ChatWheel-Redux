#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Removes double and/or single quotes from a given string.
 * By default, removes double and single quotes.
 *
 * Arguments:
 * 0: The original string <STRING>
 * 1: Remove double quotes <BOOL>
 * 2: Remove single quotes <BOOL>
 *
 * Return Value:
 * The edited string
 *
 * Example:
 * ["Th'is m'essage 'h'as 'a' l'o't' 'o'f' q'u'o't'es in it.", false, true] call CWR_Core_fnc_removeQuotes;
 */

params [["_str", "", [""]], ["_removeDouble", true, [true]], ["_removeSingle", true, [true]]];

if (_removeSingle) then
{
    _str = [_str, "'", ""] call FUNC(stringReplace);
};

if (_removeDouble) then
{
    _str = [_str, '"', ""] call FUNC(stringReplace);
};

_str;