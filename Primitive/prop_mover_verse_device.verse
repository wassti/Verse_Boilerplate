
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
prop_mover_verse_device := class(creative_device):
    @editable
    OurPropMover:prop_mover_device=prop_mover_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurPropMover.EnabledEvent.Subscribe(OnPropMoverEnabled)
        OurPropMover.DisabledEvent.Subscribe(OnPropMoverDisabled)
        OurPropMover.BeganEvent.Subscribe(OnPropMoverBegan)
        OurPropMover.EndedEvent.Subscribe(OnPropMoverEnded)
        OurPropMover.FinishedEvent.Subscribe(OnPropMoverFinished)
        OurPropMover.MovementModeChangedEvent.Subscribe(OnPropMoverMovementModeChanged)
        OurPropMover.AgentHitEvent.Subscribe(OnPropMoverAgentHitEvent)
        OurPropMover.AIHitEvent.Subscribe(OnPropMoverAIHitEvent)
        OurPropMover.PropHitEvent.Subscribe(OnPropMoverPropHitEvent)

    OnPropMoverEnabled(InTuple:tuple()):void=
        {}

    OnPropMoverDisabled(InTuple:tuple()):void=
        {}

    OnPropMoverBegan(InTuple:tuple()):void=
        {}

    OnPropMoverEnded(InTuple:tuple()):void=
        {}

    OnPropMoverFinished(InTuple:tuple()):void=
        {}

    OnPropMoverMovementModeChanged(InTuple:tuple()):void=
        {}

    OnPropMoverAgentHitEvent(InAgent:agent):void=
        {}

    OnPropMoverAIHitEvent(InTuple:tuple()):void=
        {}

    OnPropMoverPropHitEvent(InTuple:tuple()):void=
        {}

    AvailableFunctions():void=
        OurPropMover.Enable()
        OurPropMover.Disable()
        OurPropMover.Reset()
        OurPropMover.Begin()
        OurPropMover.End()
        OurPropMover.Advance()
        OurPropMover.Reverse()
        OurPropMover.SetTargetDistance(9001.0)
        L_TargetDistance:=OurPropMover.GetTargetDistance()
        OurPropMover.SetTargetSpeed(9001.0)
        L_TargetSpeed:=OurPropMover.GetTargetSpeed()