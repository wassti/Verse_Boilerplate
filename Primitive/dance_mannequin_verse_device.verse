
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
dance_mannequin_verse_device := class(creative_device):
    @editable
    OurDancer:dance_mannequin_device=dance_mannequin_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        {}

    AvailableFunctions():void=
        OurDancer.Enable()
        OurDancer.Disable()
        OurDancer.ActivateDefaultPreset()
        OurDancer.ActivatePreset2()
        OurDancer.ActivatePreset3()
        OurDancer.DeactivateSkinAndEmoteCapture()

    AvailableAgentFunctions(InAgent:agent):void=
        OurDancer.ActivateSkinAndEmoteCapture(InAgent)