
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
creature_spawner_verse_device := class(creative_device):
    @editable
    OurCreatureSpawner:creature_spawner_device=creature_spawner_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurCreatureSpawner.SpawnedEvent.Subscribe(OnCreatureSpawned)
        OurCreatureSpawner.EliminatedEvent.Subscribe(OnCreatureEliminated)

    OnCreatureSpawned(InAgent:agent):void=
        {}

    OnCreatureEliminated(InInteractionResult:device_ai_interaction_result):void=
        {}

    AvailableFunctions():void=
        OurCreatureSpawner.Enable()
        OurCreatureSpawner.Disable()
        OurCreatureSpawner.DestroySpawner()
        OurCreatureSpawner.EliminateCreatures()
        L_SpawnLimit:=OurCreatureSpawner.GetSpawnLimit()