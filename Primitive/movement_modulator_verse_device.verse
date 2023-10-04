
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
movement_modulator_verse_device := class(creative_device):
    @editable
    OurMovementMod:movement_modulator_device=movement_modulator_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurMovementMod.ActivationEvent.Subscribe(OnActivation)

    OnActivation(InAgent:agent):void=
        {}

    AvailableAgentFunctions(InAgent:agent):void=
        OurMovementMod.Activate(InAgent)

    AvailableFunctions():void=
        OurMovementMod.Enable()
        OurMovementMod.Disable()