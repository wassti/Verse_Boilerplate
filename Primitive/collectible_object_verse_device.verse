
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
collectible_object_verse_device := class(creative_device):
    @editable
    OurCollectible:collectible_object_device=collectible_object_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurCollectible.CollectedEvent.Subscribe(OnCollected)

    OnCollected(InAgent:agent):void=
        {}

    AvailableFunctions():void=
        OurCollectible.Show()
        OurCollectible.Hide()
        OurCollectible.RespawnForAll()

    AvailableAgentFunctions(InAgent:agent):void=
        OurCollectible.Respawn(InAgent)