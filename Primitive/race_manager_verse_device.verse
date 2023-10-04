
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
race_manager_verse_device := class(creative_device):
    @editable
    OurRaceManager:race_manager_device=race_manager_device{}

    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurRaceManager.RaceBeganEvent.Subscribe(OnRaceBegan)
        OurRaceManager.RaceCompletedEvent.Subscribe(OnRaceCompleted)
        OurRaceManager.FirstLapCompletedEvent.Subscribe(OnFirstLapCompleted)
        OurRaceManager.LapCompletedEvent.Subscribe(OnLapCompleted)

    OnRaceBegan(InAgent:agent):void=
        {}

    OnRaceCompleted(InAgent:agent):void=
        {}

    OnFirstLapCompleted(InAgent:agent):void=
        {}

    OnLapCompleted(InAgent:agent):void=
        {}

    AvailableFunctions():void=
        OurRaceManager.Enable()
        OurRaceManager.Disable()
        OurRaceManager.Begin()
        OurRaceManager.End()