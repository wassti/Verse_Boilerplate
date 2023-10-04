
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# Boiler Plate Code for Trick Tile Device
# See https://dev.epicgames.com/documentation/en-us/uefn/verse-api/fortnitedotcom/devices/trick_tile_device for up to date information on the trick tile device
trick_tile_verse_device := class(creative_device):
    @editable
    OurTrickTile:trick_tile_device=trick_tile_device{}
    
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurTrickTile.ActivatedEvent.Subscribe(OnTileActivated)
        OurTrickTile.TriggeredEvent.Subscribe(OnTileTriggered)

    OnTileActivated(InAgent:agent):void=
        {}

    OnTileTriggered(InAgent:agent):void=
        {}


    AvailableFunctions(InFloat:float):void=
        OurTrickTile.Enable()
        OurTrickTile.Disable()
        OurTrickTile.ToggleEnabled()
        OurTrickTile.Reset()
        OurTrickTile.EnableAgentContactTrigger()
        OurTrickTile.DisableAgentContactTrigger()
        OurTrickTile.ToggleAgentContactTrigger()
        OurTrickTile.Trigger()