#define EMPTY(var1) \
    class var1 { \
        voiceLines[] = {}; \
    }

class GVAR(VoiceLines) {
    EMPTY(NeedMedic);
    EMPTY(NeedHelp);
    EMPTY(Sorry);
    EMPTY(Thanks);
    EMPTY(FollowMe);
    EMPTY(ContactInfantry);
    EMPTY(ContactVehicle);
    EMPTY(ContactFortification);
    EMPTY(NeedAmmo);
    EMPTY(ACECheck);
    EMPTY(StatusGreen);
    EMPTY(StatusYellow);
    EMPTY(StatusRed);
    EMPTY(StatusBlack);
    EMPTY(AskFirePermission);
    EMPTY(ClearBackblast);
    EMPTY(BackblastClear);
    EMPTY(RocketFire);
    EMPTY(Unconscious);
    EMPTY(ThrowGrenade);
    EMPTY(ThrowSmoke);
    EMPTY(ThrowChemlight);
    EMPTY(ThrowIR);
};