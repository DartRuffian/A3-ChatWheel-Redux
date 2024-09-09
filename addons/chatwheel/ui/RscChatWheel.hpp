class CLASS(RscChatWheel) {
    idd = IDD_CHATWHEEL_MAIN;
    duration = 1e+6;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQCLASS(RscChatWheel),_this select 0)];);
    onUnload = QUOTE(uiNamespace setVariable [ARR_2(QQCLASS(RscChatWheel),nil)]);

    class Controls {
        class Messages: RscListBox {
            idc = IDC_CHATWHEEL_MESSAGES;
            x = QUOTE(profileNamespace getVariable [ARR_2(QQUOTE(DOUBLES(IGUI,GVAR(grid_chatwheel_x))),GUI_GRID_CENTER_X)]);
            y = QUOTE(profileNamespace getVariable [ARR_2(QQUOTE(DOUBLES(IGUI,GVAR(grid_chatwheel_y))),GUI_GRID_CENTER_Y)]);
            w = QUOTE(profileNamespace getVariable [ARR_2(QQUOTE(DOUBLES(IGUI,GVAR(grid_chatwheel_w))),5 * GUI_GRID_CENTER_W)]);
            h = QUOTE(profileNamespace getVariable [ARR_2(QQUOTE(DOUBLES(IGUI,GVAR(grid_chatwheel_h))),10 * GUI_GRID_CENTER_H)]);

            colorText[] = IGUI_TEXT_COLOR;
            colorBackground[] = IGUI_BCG_COLOR;
        };
    };
};