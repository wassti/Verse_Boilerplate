
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
player_spawner_verse_device := class(creative_device):
    @editable
    OurSpawner:player_spawner_device=player_spawner_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurSpawner.SpawnedEvent.Subscribe(OnPlayerSpawned)
    
    OnPlayerSpawned(InAgent:agent):void=
        {}

    AvailableFunctions():void=
        OurSpawner.Enable()
        OurSpawner.Disable()