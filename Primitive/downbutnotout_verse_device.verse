
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
downbutnotout_verse_device := class(creative_device):
    @editable
    OurDBNO:down_but_not_out_device=down_but_not_out_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurDBNO.AgentDownedEvent.Subscribe(OnAgentDowned)
        OurDBNO.AgentPickedUpEvent.Subscribe(OnAgentPickedUp)
        OurDBNO.AgentDroppedEvent.Subscribe(OnAgentDropped)
        OurDBNO.AgentThrownEvent.Subscribe(OnAgentThrown)
        OurDBNO.AgentRevivedEvent.Subscribe(OnAgentRevived)
        OurDBNO.ShakeDownEvent.Subscribe(OnShakeDown)
        OurDBNO.ShakenDownEvent.Subscribe(OnShakenDown)

    OnAgentDowned(InAgent:agent):void=
        {}

    OnAgentPickedUp(InAgent:agent):void=
        {}

    OnAgentDropped(InAgent:agent):void=
        {}

    OnAgentThrown(InAgent:agent):void=
        {}

    OnAgentRevived(InAgent:agent):void=
        {}

    OnShakeDown(InAgent:agent):void=
        {}

    OnShakenDown(InAgent:agent):void=
        {}

    AvailableFunctions():void=
        OurDBNO.Enable()
        OurDBNO.Disable()

    AvailableAgentFunctions(InAgent:agent):void=
        OurDBNO.Down(InAgent)
        OurDBNO.Revive(InAgent)