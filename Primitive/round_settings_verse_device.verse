
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
round_settings_verse_device := class(creative_device):
    @editable
    OurRoundSettings:round_settings_device=round_settings_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurRoundSettings.RoundBeginEvent.Subscribe(OnRoundBegin)

    OnRoundBegin(InTuple:tuple()):void=
        {}

    AvailableAgentFunctions(InAgent:agent):void=
        OurRoundSettings.EndRound(InAgent) # Ends the round immediately with `Agent`'s team set as the winner of the round.

    AvailableFunctions():void=
        OurRoundSettings.Enable()
        OurRoundSettings.Disable()
        OurRoundSettings.EnableMatchmaking()
        OurRoundSettings.DisableMatchmaking()
        OurRoundSettings.ToggleMatchmaking()
        OurRoundSettings.DisableEndRoundConditions()