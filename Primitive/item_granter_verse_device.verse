
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
item_granter_verse_device := class(creative_device):
    @editable
    OurItemGranter:item_granter_device=item_granter_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurItemGranter.ItemGrantedEvent.Subscribe(OnItemGranted)

    OnItemGranted(InAgent:agent):void=
        {}

    AvailableFunctions():void=
        OurItemGranter.Enable()
        OurItemGranter.Disable()
        OurItemGranter.SetNextItem(0)
        OurItemGranter.RestockItems()

    AvailableAgentFunctions(InAgent:agent):void=
        OurItemGranter.ClearSaveData(InAgent)
        OurItemGranter.CycleToNextItem(InAgent)
        OurItemGranter.CycleToPreviousItem(InAgent)
        OurItemGranter.CycleToRandomItem(InAgent)
        OurItemGranter.GrantItem(InAgent)