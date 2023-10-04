
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using {/Fortnite.com/Vehicles}

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
nitro_drifter_sedan_spawner_verse_device := class(creative_device):
    @editable
    OurNitroSedanSpawner:vehicle_spawner_nitro_drifter_sedan_device=vehicle_spawner_nitro_drifter_sedan_device{}

    var OurVehicle:?fort_vehicle=false

    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurNitroSedanSpawner.AgentEntersVehicleEvent.Subscribe(OnVehicleEntered)
        OurNitroSedanSpawner.AgentExitsVehicleEvent.Subscribe(OnVehicleExited)
        OurNitroSedanSpawner.SpawnedEvent.Subscribe(OnVehicleSpawned)
        OurNitroSedanSpawner.DestroyedEvent.Subscribe(OnVehicleDestroyed)

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
        OurNitroSedanSpawner.Enable()
        OurNitroSedanSpawner.Disable()
        OurNitroSedanSpawner.AssignDriver(InAgent)
        OurNitroSedanSpawner.DestroyVehicle()
        OurNitroSedanSpawner.RespawnVehicle()