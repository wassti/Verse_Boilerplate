
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
pinball_bumper_verse_device := class(creative_device):
    @editable
    OurBumper:pinball_bumper_device=pinball_bumper_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurBumper.ActivatedEvent.Subscribe(OnFlipperActivation)

    OnFlipperActivation(InAgent:agent):void=
        {}

    AvailableFunctions():void=
        OurBumper.Enable()
        OurBumper.Disable()
        OurBumper.Activate()