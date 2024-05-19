#define SCOPE_PUBLIC scope = 2; \
scopeArsenal = 2; \
scopeCurator = 2
#define SCOPE_HIDDEN scope = 1; \
scopeArsenal = 0; \
scopeCurator = 0
#define SCOPE_PRIVATE scope = 0; \
scopeArsenal = 0; \
scopeCurator = 0

#define TRUE 1
#define FALSE 0

#define IGUI_SAVEX 0
#define IGUI_SAVEY 1
#define IGUI_SAVEW 2
#define IGUI_SAVEH 3
#define IGUI_SAVEALL IGUI_SAVEX, IGUI_SAVEY, IGUI_SAVEW, IGUI_SAVEH