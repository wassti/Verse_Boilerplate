
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using {/Fortnite.com/Vehicles}

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
octane_spawner_verse_device := class(creative_device):
    @editable
    OurOctaneSpawner:vehicle_spawner_octane_device=vehicle_spawner_octane_device{}

    var OurVehicle:?fort_vehicle=false

    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurOctaneSpawner.AgentEntersVehicleEvent.Subscribe(OnVehicleEntered)
        OurOctaneSpawner.AgentExitsVehicleEvent.Subscribe(OnVehicleExited)
        OurOctaneSpawner.SpawnedEvent.Subscribe(OnVehicleSpawned)
        OurOctaneSpawner.DestroyedEvent.Subscribe(OnVehicleDestroyed)

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
        OurOctaneSpawner.Enable()
        OurOctaneSpawner.Disable()
        OurOctaneSpawner.AssignDriver(InAgent)
        OurOctaneSpawner.DestroyVehicle()
        OurOctaneSpawner.RespawnVehicle()