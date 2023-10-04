
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /Verse.org/Colors }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
grind_rail_verse_device := class(creative_device):
    @editable
    OurGrindRail:grind_rail_device=grind_rail_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurGrindRail.StartedGrindingEvent.Subscribe(OnGrindStart)
        OurGrindRail.EndedGrindingEvent.Subscribe(OnGrindEnd)


    OnGrindStart(InAgent:agent):void=
        {}

    OnGrindEnd(InAgent:agent):void=
        {}

    AvailableFunctions():void=
        OurGrindRail.Enable()
        OurGrindRail.Disable()
        OurGrindRail.SetRailColor(NamedColors.Blue)
        OurGrindRail.Hide()
        OurGrindRail.Show()