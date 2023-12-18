class CLASS(RscChatWheel)
{
    idd = IDD_CHATWHEEL_MAIN;
    duration = 1e+6;
    onLoad = "uiNamespace setVariable ['CWR_RscChatWheel', _this select 0]; call CWR_ChatWheel_fnc_populateChatWheel";

    class Controls
    {
        class Messages: RscListBox
        {
            idc = IDC_CHATWHEEL_MESSAGES;
            x = __EVAL(GUI_GRID_CENTER_X);
            y = __EVAL(GUI_GRID_CENTER_Y);
            w = __EVAL(5 * GUI_GRID_CENTER_W);
            h = __EVAL(10 * GUI_GRID_CENTER_H);

            colorText[] = IGUI_TEXT_COLOR;
            colorBackground[] = IGUI_BCG_COLOR;
        };
    };
};