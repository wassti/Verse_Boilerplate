
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
player_counter_verse_device := class(creative_device):
    @editable
    OurPlayerCounter:player_counter_device=player_counter_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurPlayerCounter.CountSucceedsEvent.Subscribe(OnCountSucceeds)
        OurPlayerCounter.CountFailsEvent.Subscribe(OnCountFails)
        OurPlayerCounter.CountedEvent.Subscribe(OnCounted)
        OurPlayerCounter.RemovedEvent.Subscribe(OnRemovedFromCount)

    OnCountSucceeds(InTuple:tuple()):void=
        {}

    OnCountFails(InTuple:tuple()):void=
        {}

    OnCounted(InAgent:agent):void=
        {}

    OnRemovedFromCount(InAgent:agent):void=
        {}

    AvailableAgentFunctions(InAgent:agent):void=
        OurPlayerCounter.Register(InAgent)
        OurPlayerCounter.Unregister(InAgent)
        if(OurPlayerCounter.IsCounted[InAgent]):

    AvailableFunctions():void=
        OurPlayerCounter.Enable()
        OurPlayerCounter.Disable()
        OurPlayerCounter.Reset()
        OurPlayerCounter.IncrementTargetCount()
        OurPlayerCounter.DecrementTargetCount()
        OurPlayerCounter.CompareToTarget()
        OurPlayerCounter.TransmitForAllCounted()
        OurPlayerCounter.UnregisterAll()
        OurPlayerCounter.ShowInfoPanel()
        OurPlayerCounter.HideInfoPanel()
        if(OurPlayerCounter.IsShowingInfoPanel[]):
        OurPlayerCounter.SetTargetCount(9001)
        L_TargetCount:=OurPlayerCounter.GetTargetCount()
        L_CurrentCount:=OurPlayerCounter.GetCount()
        if(OurPlayerCounter.IsPassingTest[]):