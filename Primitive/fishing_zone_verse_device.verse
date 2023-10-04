
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
fishing_zone_verse_device := class(creative_device):
    @editable
    OurFishingZone:fishing_zone_device=fishing_zone_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurFishingZone.CaughtEvent.Subscribe(OnFishCaught)
        OurFishingZone.EmptyEvent.Subscribe(OnFishEmpty)

    OnFishCaught(InAgent:agent):void=
        {}

    OnFishEmpty(InAgent:agent):void=
        {}

    AvailableAgentFunctions():void=
        OurFishingZone.Enable()
        OurFishingZone.Disable()
        OurFishingZone.Reset()
        OurFishingZone.Restock()