
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
automated_turret_verse_device := class(creative_device):
    @editable
    OurAutoTurret:automated_turret_device=automated_turret_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurAutoTurret.ActivatedEvent.Subscribe(OnTurretActivated)
        OurAutoTurret.DamagedEvent.Subscribe(OnTurretDamaged)
        OurAutoTurret.DestroyedEvent.Subscribe(OnTurretDestroyed)


    OnTurretActivated(InOptAgent:?agent):void=
        {}

    OnTurretDamaged(InOptAgent:?agent):void=
        {}

    OnTurretDestroyed(InOptAgent:?agent):void=
        {}

    AvailableFunctions():void=
        OurAutoTurret.Enable()
        OurAutoTurret.Disable()
        OurAutoTurret.UseDefaultTeam()
        OurAutoTurret.UseTeamWildlifeAndCreatures()

    AvailableAgentFunctions(InAgent:agent):void=
        OurAutoTurret.SetTeam(InAgent)