class CfgUIGrids {
    class IGUI {
        class Variables {
            class GVAR(Grid_ChatWheel) {
                displayName = CSTRING(hud_ChatWheel);
                description = CSTRING(hudDescription_ChatWheel);
                preview = QPATHTOF(data\GUI\Cfg\UIGrids\grid_ChatWheel_ca.paa); // TODO: Move preview text by ~3 pixels (OCD)
                saveToProfile[] = {IGUI_SAVEALL};
            };
        };

        class Presets {
            class Arma3 {
                class Variables {
                    GVAR(Grid_ChatWheel)[] = { {
                            QUOTE(GUI_GRID_CENTER_X),
                            QUOTE(GUI_GRID_CENTER_Y),
                            QUOTE(5 * GUI_GRID_CENTER_W),
                            QUOTE(10 * GUI_GRID_CENTER_H)
                        },
                        QUOTE(GUI_GRID_CENTER_W),
                        QUOTE(GUI_GRID_CENTER_H)
                    };
                };
            };
        };
    };
};