
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# Boiler Plate Code for Teleporter Device
# See https://dev.epicgames.com/documentation/en-us/uefn/verse-api/fortnitedotcom/devices/teleporter_device for up to date information on the teleporter device
teleporter_verse_device := class(creative_device):
    @editable
    OurTeleporter:teleporter_device=teleporter_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurTeleporter.EnterEvent.Subscribe(OnTeleporterEntered)
        OurTeleporter.TeleportedEvent.Subscribe(OnTeleported)


    OnTeleporterEntered(InAgent:agent):void=
        {}

    OnTeleported(InAgent:agent):void=
        {}   

    AvailableFunctions(InAgent:agent):void=   
        OurTeleporter.Enable()
        OurTeleporter.Disable()
        OurTeleporter.Activate(InAgent) #This behaves as if the user stepped into this teleporter
        OurTeleporter.ActivateLinkToTarget()
        OurTeleporter.ResetLinkToTarget()
        OurTeleporter.Teleport(InAgent) #This will teleport the user to this teleporter