
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
player_checkpoint_pad_verse_device := class(creative_device):
    @editable
    OurCheckpoint:player_checkpoint_device=player_checkpoint_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurCheckpoint.FirstActivationEvent.Subscribe(OnFirstActivation)
        OurCheckpoint.FirstActivationPerAgentEvent.Subscribe(OnFirstActivationPerAgent)

    OnFirstActivation(InAgent:agent):void=
        {}

    OnFirstActivationPerAgent(InAgent:agent):void=
        {}

    AvailableAgentFunctions(InAgent:agent):void=
        OurCheckpoint.Register(InAgent)

    AvailableFunctions():void=
        OurCheckpoint.Enable()
        OurCheckpoint.Disable()