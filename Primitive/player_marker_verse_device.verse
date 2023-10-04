
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
player_marker_verse_device := class(creative_device):
    @editable
    OurPlayerMarker:player_marker_device=player_marker_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurPlayerMarker.FirstItemValueChangedEvent.Subscribe(OnFirstItemValueChanged)
        OurPlayerMarker.SecondItemValueChangedEvent.Subscribe(OnSecondItemValueChanged)
        OurPlayerMarker.FirstItemValueReachedEvent.Subscribe(OnFirstItemValueReached)
        OurPlayerMarker.SecondItemValueReachedEvent.Subscribe(OnSecondItemValueReached)

    OnFirstItemValueChanged(InAgent:agent):void=
        {}

    OnSecondItemValueChanged(InAgent:agent):void=
        {}

    OnFirstItemValueReached(InAgent:agent):void=
        {}

    OnSecondItemValueReached(InAgent:agent):void=
        {}

    AvailableAgentFunctions(InAgent:agent):void=
        OurPlayerMarker.Attach(InAgent)
        OurPlayerMarker.Detach(InAgent)

    AvailableFunctions():void=
        OurPlayerMarker.Enable()
        OurPlayerMarker.Disable()
        OurPlayerMarker.DetachFromAll()