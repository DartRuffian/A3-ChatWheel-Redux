#define MAINPREFIX DA
#define PREFIX CWR
#define MOD_NAME Chat Wheel Redux
#define AUTHOR "DartRuffian"

#ifdef __A3_DEBUG__
    #include "\z\cwr\addons\main\script_debug.hpp"
#endif

#include "\z\cwr\addons\main\script_version.hpp"

#define REQUIRED_VERSION 2.18
#define REQUIRED_CBA_VERSION {3,18,0}

#define VERSION     MAJOR.MINOR
#define VERSION_STR MAJOR.MINOR.PATCH.BUILD
#define VERSION_AR  MAJOR,MINOR,PATCH,BUILD

#ifndef COMPONENT_BEAUTIFIED
    #define COMPONENT_BEAUTIFIED COMPONENT
#endif
#ifdef SUBCOMPONENT
    #ifndef SUBCOMPONENT_BEAUTIFIED
        #define SUBCOMPONENT_BEAUTIFIED SUBCOMPONENT
    #endif
    #define COMPONENT_NAME QUOTE(PREFIX - COMPONENT_BEAUTIFIED (SUBCOMPONENT_BEAUTIFIED))
#else
    #define COMPONENT_NAME QUOTE(PREFIX - COMPONENT_BEAUTIFIED)
#endif