
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
explosive_verse_device := class(creative_device):
    @editable
    OurExplosive:explosive_device=explosive_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurExplosive.ExplodedEvent.Subscribe(OnExploded)

    OnExploded(InAgent:agent):void=
        {}

    AvailableFunctions():void=
        OurExplosive.Show()
        OurExplosive.Hide()
        OurExplosive.Reset()

    AvailableAgentFunctions(InAgent:agent):void=
        OurExplosive.Explode(InAgent)