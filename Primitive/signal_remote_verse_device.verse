
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# Boiler Plate Code for Signal Remote Device
# See https://dev.epicgames.com/documentation/en-us/uefn/verse-api/fortnitedotcom/devices/signal_remote_manager_device for up to date information on the signal remote device

signal_remote_verse_device := class(creative_device):
    @editable
    OurRemoteManager:signal_remote_manager_device=signal_remote_manager_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurRemoteManager.PrimarySignalEvent.Subscribe(OnPrimarySignal)
        OurRemoteManager.SecondarySignalEvent.Subscribe(OnSecondarySignal)

    OnPrimarySignal(InAgent:agent):void=
        {}

    OnSecondarySignal(InAgent:agent):void=
        {}

    AvailableFunctions():void=
        OurRemoteManager.Enable()
        OurRemoteManager.Disable()