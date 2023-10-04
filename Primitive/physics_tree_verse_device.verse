
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
physics_tree_verse_device := class(creative_device):
    @editable
    OurTree:physics_tree_device=physics_tree_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurTree.TreeSpawnedEvent.Subscribe(OnTreeSpawned)
        OurTree.LogDestroyedEvent.Subscribe(OnLogDestroyed)
        OurTree.StumpDestroyedEvent.Subscribe(OnStumpDestroyed)
        OurTree.TreeKnockedDownEvent.Subscribe(OnTreeKnockedDown)

    OnTreeSpawned(InTuple:tuple()):void=
        {}

    OnLogDestroyed(InTuple:tuple()):void=
        {}

    OnStumpDestroyed(InTuple:tuple()):void=
        {}

    OnTreeKnockedDown(InTuple:tuple()):void=
        {}

    AvailableFunctions():void=
        OurTree.ReleaseLog()
        OurTree.DestroyLog()
        OurTree.DestroyStump()