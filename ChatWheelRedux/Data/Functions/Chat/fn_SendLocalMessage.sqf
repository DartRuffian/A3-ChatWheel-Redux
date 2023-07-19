/*
 * Authors: DartRuffian
 * Determines whether a message should be sent based on user settings. If yes, it sends the message.
 *
 * Arguments:
 * 0: The sender of the message <Object>
 * 1: The message to be sent <String>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "Local Message"] remoteExecCall ["CWR_fnc_SendLocalMessage", (units group player)];
 * // Sends the message as the local player to all group members with the setting enabled
 */

params ["_sender", "_message"];

if (CWR_AutoMessages_Enabled) then
{
    _sender groupChat _message;
};