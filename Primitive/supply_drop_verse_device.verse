
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# Boiler Plate Code for Supply drop spawner Device
# See https://dev.epicgames.com/documentation/en-us/uefn/verse-api/fortnitedotcom/devices/supply_drop_spawner_device for up to date information on the supply drop spawner device

supply_drop_verse_device := class(creative_device):
    @editable
    OurSupplyDrop:supply_drop_spawner_device=supply_drop_spawner_device{}
    
    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurSupplyDrop.BalloonPoppedEvent.Subscribe(OnSupplyDropped)
        OurSupplyDrop.OpenedEvent.Subscribe(OnSupplyOpened)
        OurSupplyDrop.LandingEvent.Subscribe(OnSupplyLanded)

    OnSupplyDropped(InOptAgent:?agent):void=
        {}

    OnSupplyOpened(InAgent:agent):void=
        {}

    OnSupplyLanded(InTuple:tuple()):void=
        {}
    
    AvailableAgentFunctions(InAgent:agent):void=
        OurSupplyDrop.Spawn()
        OurSupplyDrop.DestroyBalloon()
        OurSupplyDrop.Open(InAgent)
        OurSupplyDrop.Lock()
        OurSupplyDrop.Unlock()
