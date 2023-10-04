
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# Boiler Plate Code for Timed Objective Device
# See https://dev.epicgames.com/documentation/en-us/uefn/verse-api/fortnitedotcom/devices/timed_objective_device for up to date information on the timed objective device
timed_objective_verse_device := class(creative_device):
    @editable
    OurTimedObjective:timed_objective_device=timed_objective_device{}

    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurTimedObjective.BeganEvent.Subscribe(OnTimerBegan)
        OurTimedObjective.EndedEvent.Subscribe(OnTimerEnded)
        OurTimedObjective.PausedEvent.Subscribe(OnTimerPaused)
        OurTimedObjective.ResumedEvent.Subscribe(OnTimerResumed)
        OurTimedObjective.RestartedEvent.Subscribe(OnTimerRetarted)
        OurTimedObjective.CompletedEvent.Subscribe(OnTimerCompleted)

    OnTimerBegan(InAgent:agent):void=
        {}

    OnTimerEnded(InAgent:agent):void=
        {}

    OnTimerPaused(InAgent:agent):void=
        {}

    OnTimerResumed(InAgent:agent):void=
        {}

    OnTimerRetarted(InAgent:agent):void=
        {}

    OnTimerCompleted(InAgent:agent):void=
        {}

    AvailableFunctions(InAgent:agent):void=
        OurTimedObjective.Enable(InAgent)
        OurTimedObjective.Disable(InAgent)
        OurTimedObjective.Show()
        OurTimedObjective.Hide()
        OurTimedObjective.Begin(InAgent)
        OurTimedObjective.End(InAgent)
        OurTimedObjective.Pause(InAgent)
        OurTimedObjective.Resume(InAgent)
        OurTimedObjective.Complete(InAgent)