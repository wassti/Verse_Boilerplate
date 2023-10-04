
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using {/Fortnite.com/Vehicles}

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
pickup_truck_spawner_verse_device := class(creative_device):
    @editable
    OurTruckSpawner:vehicle_spawner_pickup_truck_device=vehicle_spawner_pickup_truck_device{}

    var OurVehicle:?fort_vehicle=false

    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurTruckSpawner.AgentEntersVehicleEvent.Subscribe(OnVehicleEntered)
        OurTruckSpawner.AgentExitsVehicleEvent.Subscribe(OnVehicleExited)
        OurTruckSpawner.SpawnedEvent.Subscribe(OnVehicleSpawned)
        OurTruckSpawner.DestroyedEvent.Subscribe(OnVehicleDestroyed)

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
        OurTruckSpawner.Enable()
        OurTruckSpawner.Disable()
        OurTruckSpawner.AssignDriver(InAgent)
        OurTruckSpawner.DestroyVehicle()
        OurTruckSpawner.RespawnVehicle()