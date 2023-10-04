
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
physics_boulder_verse_device := class(creative_device):
    @editable
    OurBoulder:physics_boulder_device=physics_boulder_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurBoulder.BalancedBoulderSpawnedEvent.Subscribe(OnBalancedBoulderSpawned)
        OurBoulder.BalancedBoulderDestroyedEvent.Subscribe(OnBalancedBoulderDestroyed)
        OurBoulder.BaseDestroyedEvent.Subscribe(OnBaseDestroyed)
        OurBoulder.RollingBoulderDestroyedEvent.Subscribe(OnRollingBoulderDestroyed)

    OnBalancedBoulderSpawned(InTuple:tuple()):void=
        {}

    OnBalancedBoulderDestroyed(InTuple:tuple()):void=
        {}

    OnBaseDestroyed(InTuple:tuple()):void=
        {}

    OnRollingBoulderDestroyed(InTuple:tuple()):void=
        {}

    AvailableFunctions():void=
        OurBoulder.DestroyBase()
        OurBoulder.ReleaseRollingBoulder()
        OurBoulder.DestroyRollingBoulder()