
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
map_indicator_verse_device := class(creative_device):
    @editable
    OurMapIndicator:map_indicator_device=map_indicator_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        {}

    AvailableAgentFunctions(InAgent:agent):void=
        OurMapIndicator.ActivateObjectivePulse(InAgent)
        OurMapIndicator.DeactivateObjectivePulse(InAgent)

    AvailableFunctions():void=
        OurMapIndicator.Enable()
        OurMapIndicator.Disable()