
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
capture_area_verse_device := class(creative_device):
    @editable
    OurCaptureArea:capture_area_device=capture_area_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurCaptureArea.AgentEntersEvent.Subscribe(OnAgentEnters)
        OurCaptureArea.AgentExitsEvent.Subscribe(OnAgentExits)
        OurCaptureArea.FirstAgentEntersEvent.Subscribe(OnFirstAgentEnters)
        OurCaptureArea.LastAgentExitsEvent.Subscribe(OnLastAgentExits)
        OurCaptureArea.AreaIsContestedEvent.Subscribe(OnAreaIsContested)
        OurCaptureArea.AreaIsScoredEvent.Subscribe(OnAreaIsScored)
        OurCaptureArea.ControlChangeStartsEvent.Subscribe(OnControlChangeStarts)
        OurCaptureArea.ControlChangeEvent.Subscribe(OnControlChange)
        OurCaptureArea.ItemIsConsumedEvent.Subscribe(OnItemIsConsumed)
        OurCaptureArea.ItemIsDeliveredEvent.Subscribe(OnItemIsDelivered)

    OnAgentEnters(InAgent:agent):void=
        {}

    OnAgentExits(InAgent:agent):void=
        {}

    OnFirstAgentEnters(InAgent:agent):void=
        {}

    OnLastAgentExits(InAgent:agent):void=
        {}

    OnAreaIsContested(InAgent:agent):void=
        {}

    OnAreaIsScored(InAgent:agent):void=
        {}

    OnControlChangeStarts(InAgent:agent):void=
        {}

    OnControlChange(InAgent:agent):void=
        {}

    OnItemIsConsumed(InAgent:agent):void=
        {}

    OnItemIsDelivered(InAgent:agent):void=
        {}

    AvailableFunctions():void=
        OurCaptureArea.Enable()
        OurCaptureArea.Disable()
        OurCaptureArea.ToggleEnabled()
        OurCaptureArea.AllowCapture()
        OurCaptureArea.DisallowCapture()
        OurCaptureArea.ToggleCaptureAllowed()
        OurCaptureArea.Reset()
        OurCaptureArea.Neutralize()
        OurCaptureArea.ActivateObjectivePulse()
        OurCaptureArea.DeactivateObjectivePulse()
        OurCaptureArea.SetHeight(9001.0)
        L_Height:=OurCaptureArea.GetHeight()
        OurCaptureArea.SetRadius(9001.0)
        L_Radius:=OurCaptureArea.GetRadius()

    AvailableAgentFunctions(InAgent:agent):void=
        OurCaptureArea.GiveControl(InAgent)