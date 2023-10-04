
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
firefly_spawner_verse_device := class(creative_device):
    @editable
    OurFireflySpawner:firefly_spawner_device=firefly_spawner_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurFireflySpawner.OnFirefliesCollected.Subscribe(OnFireflyCollected)

    OnFireflyCollected(InAgent:agent):void=
        {}

    AvailableFunctions():void=
        OurFireflySpawner.Enable()
        OurFireflySpawner.Disable()
        OurFireflySpawner.Respawn()
        OurFireflySpawner.ResetRespawnCount()