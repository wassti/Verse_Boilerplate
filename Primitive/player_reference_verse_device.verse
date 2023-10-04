
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
player_reference_verse_device := class(creative_device):
    @editable
    OurPlayerReference:player_reference_device=player_reference_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurPlayerReference.ActivatedEvent.Subscribe(OnActivated)
        OurPlayerReference.TrackedStatChangedEvent.Subscribe(OnTrackedStatChanged)
        OurPlayerReference.AgentUpdatedEvent.Subscribe(OnAgentUpdated)
        OurPlayerReference.AgentUpdateFailsEvent.Subscribe(OnAgentUpdateFails)
        OurPlayerReference.AgentReplacedEvent.Subscribe(OnAgentReplaced)

    OnActivated(InAgent:agent):void=
        {}

    OnTrackedStatChanged(InAgent:agent):void=
        {}
    OnAgentUpdated(InAgent:agent):void=
        {}
    OnAgentUpdateFails(InAgent:agent):void=
        {}
    OnAgentReplaced(InAgent:agent):void=
        {}

    AvailableAgentFunctions(InAgent:agent):void=
        OurPlayerReference.Register(InAgent)
        if(OurPlayerReference.IsReferenced[InAgent]):

    AvailableFunctions():void=
        OurPlayerReference.Enable()
        OurPlayerReference.Disable()
        OurPlayerReference.Activate()
        OurPlayerReference.Clear()
        L_OptAgent:=OurPlayerReference.GetAgent()
        if(L_Agent:=L_OptAgent?):
        L_StatValue:=OurPlayerReference.GetStatValue()