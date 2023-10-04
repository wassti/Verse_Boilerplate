
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
capture_item_spawner_verse_device := class(creative_device):
    @editable
    OurCaptureItemSpawner:capture_item_spawner_device=capture_item_spawner_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurCaptureItemSpawner.ItemCapturedEvent.Subscribe(OnItemCaptured)
        OurCaptureItemSpawner.ItemPickedUpEvent.Subscribe(OnItemPickedUp)
        OurCaptureItemSpawner.ItemDroppedEvent.Subscribe(OnItemDropped)
        OurCaptureItemSpawner.ItemReturnedEvent.Subscribe(OnItemReturned)

    OnItemCaptured(InAgent:agent):void=
        {}

    OnItemPickedUp(InAgent:agent):void=
        {}

    OnItemDropped(InAgent:agent):void=
        {}

    OnItemReturned(InAgent:agent):void=
        {}

    AvailableFunctions():void=
        OurCaptureItemSpawner.Enable()
        OurCaptureItemSpawner.Disable()