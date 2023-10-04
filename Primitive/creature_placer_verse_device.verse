
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
creature_placer_verse_device := class(creative_device):
    @editable
    OurCreaturePlacer:creature_placer_device=creature_placer_device{}
    
    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurCreaturePlacer.SpawnedEvent.Subscribe(OnCreatureSpawned)
        OurCreaturePlacer.EliminatedEvent.Subscribe(OnCreatureEliminated)

    OnCreatureSpawned(InAgent:agent):void=
        {}

    OnCreatureEliminated(InOptAgent:?agent):void=
        {}

    AvailableFunctions():void=
        OurCreaturePlacer.Spawn()
        OurCreaturePlacer.Despawn()
