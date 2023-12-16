#include "script_component.hpp"

#include "XEH_PREP.hpp"

uiNamespace setVariable [QGVAR(messages), createHashmap];
uiNamespace setVariable [QGVAR(voiceLines), createHashmap];

call FUNC(scanConfig);