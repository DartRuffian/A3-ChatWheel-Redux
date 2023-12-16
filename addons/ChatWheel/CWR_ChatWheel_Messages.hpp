class GVAR(Messages)
{
    class NeedMedic
    {
        displayName = "Call Medic";
        message = "[vl-NeedMedic]I need a medic!";
        order = 0;
    };

    class NeedHelp
    {
        displayName = "Call Help";
        message = "[vl-NeedHelp]I need help!";
        order = 1;
    };

    class Apologize
    {
        displayName = "Apologize";
        message = "[vl-Sorry]Sorry!";
        order = 2;
    };

    class ThankYou
    {
        displayName = "Thank You";
        message = "[vl-Thanks]Thank you!";
        order = 3;
    };

    class Follow
    {
        displayName = "Follow Me";
        message = "[vl-FollowMe]Follow me!";
        order = 4;
    };

    class Contact
    {
        displayName = "Contact";
        message = "";
        order = 5;

        class Infantry
        {
            displayName = "Infantry";
            message = "[vl-ContactInfantry]Contact! Infantry [direction], bearing [bearing]! [distance]!";
            order = 0;
        };
        class Vehicle
        {
            displayName = "Vehicle";
            message = "[vl-ContactVehicle]Contact! Vehicle [direction], bearing [bearing]! [distance]!";
            order = 1;
        };
        class Fortification
        {
            displayName = "Fortification";
            message = "[vl-ContactFort]Contact! Fortification [direction], bearing [bearing]! [distance]!";
            order = 2;
        };
    };

    class NeedAmmo
    {
        displayName = "Need Ammo";
        message = "[vl-NeedAmmo]I need ammo for my [weapon]!";
        order = 6;
    };

    class ACECheck
    {
        displayName = "ACE Check";
        message = "";
        order = 7;

        class CallCheck
        {
            displayName = "Call";
            message = "[vl-ACECheck]ACE Check!";
            order = 0;
        };
        class StatusGreen
        {
            displayName = "Green";
            message = "[vl-StatusGreen]Status Green!";
            order = 1;
        };
        class StatusYellow
        {
            displayName = "Yellow";
            message = "[vl-StatusYellow]Status Yellow!";
            order = 2;
        };
        class StatusRed
        {
            displayName = "Red";
            message = "[vl-StatusRed]Status Red!";
            order = 3;
        };
        class StatusBlack
        {
            displayName = "Black";
            message = "[vl-StatusBlack]Status Black!";
            order = 4;
        };
    };

    class Launcher
    {
        displayName = "Launcher";
        message = "";
        order = 8;

        class AskPermission
        {
            displayName = "Permission to Fire?";
            message = "[vl-AskFirePermission]Permission to fire?";
            order = 0;
        };
        class ClearBackblast
        {
            displayName = "Clear Backblast";
            message = "[vl-ClearBackblast]Clear backblast!";
            order = 1;
        };
        class BackblastClear
        {
            displayName = "Backblast Clear";
            message = "[vl-BackblastClear]Backblast clear!";
            order = 2;
        };
        class FireRocket
        {
            displayName = "Rocket Rocket Rocket!";
            message = "[vl-RocketFire]Rocket! Rocket! Rocket!";
            order = 3;
        };
    };
};