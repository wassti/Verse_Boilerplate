
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
guard_spawner_verse_device := class(creative_device):
    @editable
    OurGuardSpawner:guard_spawner_device=guard_spawner_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurGuardSpawner.SpawnedEvent.Subscribe(OnGuardSpawned)
        OurGuardSpawner.AlertedEvent.Subscribe(OnGuardAlerted)
        OurGuardSpawner.TargetLostEvent.Subscribe(OnGuardTargetLost)
        OurGuardSpawner.SuspiciousEvent.Subscribe(OnGuardSuspicious)
        OurGuardSpawner.UnawareEvent.Subscribe(OnGuardUnaware)
        OurGuardSpawner.DamagedEvent.Subscribe(OnGuardDamaged)
        OurGuardSpawner.EliminatedEvent.Subscribe(OnGuardEliminated)
        OurGuardSpawner.EliminatingEvent.Subscribe(OnGuardEliminating)
        OurGuardSpawner.HiredEvent.Subscribe(OnGuardHired)
        OurGuardSpawner.DismissedEvent.Subscribe(OnGuardDismissed)

    OnGuardSpawned(InAgent:agent):void=
        {}

    OnGuardAlerted(InInteractionResult:device_ai_interaction_result):void=
        {}

    OnGuardTargetLost(InInteractionResult:device_ai_interaction_result):void=
        {}

    OnGuardSuspicious(InAgent:agent):void=
        {}

    OnGuardUnaware(InAgent:agent):void=
        {}

    OnGuardDamaged(InInteractionResult:device_ai_interaction_result):void=
        {}

    OnGuardEliminated(InInteractionResult:device_ai_interaction_result):void=
        {}

    OnGuardEliminating(InInteractionResult:device_ai_interaction_result):void=
        {}

    OnGuardHired(InInteractionResult:device_ai_interaction_result):void=
        {}

    OnGuardDismissed(InInteractionResult:device_ai_interaction_result):void=
        {}

    AvailableFunctions():void=
        OurGuardSpawner.Enable()
        OurGuardSpawner.Disable()
        OurGuardSpawner.Reset()
        OurGuardSpawner.Spawn()
        OurGuardSpawner.Despawn()
        OurGuardSpawner.DismissAllHiredGuards()
        OurGuardSpawner.SetGuardsHireable()
        OurGuardSpawner.SetGuardsNotHireable()
        L_SpawnLimit:=OurGuardSpawner.GetSpawnLimit()

    AvailableAgentFunctions(InAgent:agent):void=
        OurGuardSpawner.Spawn(InAgent)
        OurGuardSpawner.Despawn(InAgent)
        OurGuardSpawner.Hire(InAgent)
        OurGuardSpawner.ForceAttackTarget(InAgent)