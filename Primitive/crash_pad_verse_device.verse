
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
crash_pad_verse_device := class(creative_device):
    @editable
    OurCrashPad:crash_pad_device=crash_pad_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurCrashPad.LaunchedEvent.Subscribe(OnLaunched)

    OnLaunched(InAgent:agent):void=
        {}

    AvailableFunctions():void=
        OurCrashPad.Enable()
        OurCrashPad.Disable()