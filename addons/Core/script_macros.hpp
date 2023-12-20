#ifdef __A3_DEBUG__
    #include "\BNA\BNA_KC\addons\Core\script_debug.hpp"
#endif
#include "\x\cba\addons\main\script_macros_common.hpp"

// Functions
#undef PREP
#ifdef DISABLE_COMPILE_CACHE
    #define PREP(fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fnc,fncName).sqf)
#else
    #define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
#endif

#define CLASS(var1) DOUBLES(PREFIX,var1)
#define QCLASS(var1) QUOTE(CLASS(var1))

#define SCOPE_PUBLIC scope = 2; \
scopeArsenal = 2; \
scopeCurator = 2
#define SCOPE_HIDDEN scope = 1; \
scopeArsenal = 0; \
scopeCurator = 0
#define SCOPE_PRIVATE scope = 0; \
scopeArsenal = 0; \
scopeCurator = 0

// Booleans
#define TRUE 1
#define FALSE 0