
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
pinball_flipper_verse_device := class(creative_device):
    @editable
    OurFlipper:pinball_flipper_device=pinball_flipper_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurFlipper.ActivatedEvent.Subscribe(OnFlipperActivation)

    OnFlipperActivation(InAgent:agent):void=
        {}

    AvailableAgentFunctions(InAgent:agent):void=
        OurFlipper.Activate(InAgent)

    AvailableFunctions():void=
        OurFlipper.Enable()
        OurFlipper.Disable()