
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
tracker_verse_device := class(creative_device):
    @editable
    OurTracker:tracker_device=tracker_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurTracker.CompleteEvent.Subscribe(OnTrackerCompleted)

    OnTrackerCompleted(InAgent:agent):void=
        Print("Tracker Completed")