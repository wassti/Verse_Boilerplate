
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using {/Fortnite.com/Vehicles}

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
helicopter_spawner_verse_device := class(creative_device):
    @editable
    OurHeliSpawner:vehicle_spawner_helicopter_device=vehicle_spawner_helicopter_device{}

    var OurVehicle:?fort_vehicle=false

    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurHeliSpawner.AgentEntersVehicleEvent.Subscribe(OnVehicleEntered)
        OurHeliSpawner.AgentExitsVehicleEvent.Subscribe(OnVehicleExited)
        OurHeliSpawner.SpawnedEvent.Subscribe(OnVehicleSpawned)
        OurHeliSpawner.DestroyedEvent.Subscribe(OnVehicleDestroyed)

    OnVehicleEntered(InAgent:agent):void=
        {}

    OnVehicleExited(InAgent:agent):void=
        {}

    OnVehicleSpawned(InVehicle:fort_vehicle):void=
        SetSpawnedVehicle(InVehicle)

    OnVehicleDestroyed(InTuple:tuple()):void=
        UnsetDestroyedVehicle()

    SetSpawnedVehicle(InVehicle:fort_vehicle)<transacts>:void=
        set OurVehicle = option{InVehicle}

    UnsetDestroyedVehicle()<transacts>:void=
        set OurVehicle = false

    AvailableAgentFunctions(InAgent:agent):void=
        OurHeliSpawner.Enable()
        OurHeliSpawner.Disable()
        OurHeliSpawner.AssignDriver(InAgent)
        OurHeliSpawner.DestroyVehicle()
        OurHeliSpawner.RespawnVehicle()