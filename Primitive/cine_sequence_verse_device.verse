
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
cine_sequence_verse_device := class(creative_device):
    @editable
    OurSequencer:cinematic_sequence_device=cinematic_sequence_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurSequencer.StoppedEvent.Subscribe(OnSequencerStopped)

    OnSequencerStopped(InTuple:tuple()):void=
        {}

    AvailableFunctions():void=
        OurSequencer.Play()
        OurSequencer.Stop()
        OurSequencer.GoToEndAndStop()
        OurSequencer.Pause()
        OurSequencer.TogglePause()

    AvailableAgentFunctions(InAgent:agent):void=
        OurSequencer.Play(InAgent)
        OurSequencer.Stop(InAgent)
        OurSequencer.GoToEndAndStop(InAgent)
        OurSequencer.Pause(InAgent)
        OurSequencer.TogglePause(InAgent)
