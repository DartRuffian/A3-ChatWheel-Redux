#include "script_component.hpp"

#include "XEH_PREP.hpp"

uiNamespace setVariable [QGVAR(messages), []];
uiNamespace setVariable [QGVAR(voiceLines), []];

call FUNC(scanConfig);