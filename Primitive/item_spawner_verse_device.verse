
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
item_spawner_verse_device := class(creative_device):
    @editable
    OurSpawner:item_spawner_device=item_spawner_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        {}

    AvailableFunctions():void=
        OurSpawner.CycleToNextItem()
        OurSpawner.SpawnItem()
        OurSpawner.SetEnableRespawnTimer(false)
        L_bEnableRespawnTimer:=OurSpawner.GetEnableRespawnTimer()
        OurSpawner.SetTimeBetweenSpawns(9001.0)
        L_TimeBetweenSpawns:=OurSpawner.GetTimeBetweenSpawns()