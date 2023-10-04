
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
race_checkpoint_verse_device := class(creative_device):
    @editable
    OurRaceCheckpoint:race_checkpoint_device=race_checkpoint_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurRaceCheckpoint.CheckpointBecomesCurrentForTheFirstTimeEvent.Subscribe(OnCheckpointBecomesCurrentForTheFirstTime)
        OurRaceCheckpoint.CheckpointBecomesCurrentEvent.Subscribe(OnCheckpointBecomesCurrentEvent)
        OurRaceCheckpoint.CheckpointCompletedEvent.Subscribe(OnCheckpointCompleted)

    OnCheckpointBecomesCurrentForTheFirstTime(InAgent:agent):void=
        {}

    OnCheckpointBecomesCurrentEvent(InAgent:agent):void=
        {}

    OnCheckpointCompleted(InAgent:agent):void=
        {}

    AvailableAgentFunctions(InAgent:agent):void=
        OurRaceCheckpoint.SetAsCurrentCheckpoint(InAgent) 

    AvailableFunctions():void=
        OurRaceCheckpoint.Enable()
        OurRaceCheckpoint.Disable()