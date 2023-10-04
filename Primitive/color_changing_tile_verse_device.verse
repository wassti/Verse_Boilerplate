
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
color_changing_tile_verse_device := class(creative_device):
    @editable
    OurTile:color_changing_tiles_device=color_changing_tiles_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurTile.ActivatedEvent.Subscribe(OnActivated)

    OnActivated(InAgent:agent):void=
        {}

    AvailableFunctions():void=
        OurTile.Enable()
        OurTile.Disable()
        OurTile.Show()
        OurTile.Hide()
        OurTile.Reset()

    AvailableAgentFunctions(InAgent:agent):void=
        OurTile.SetTeam(InAgent)