
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# Boiler Plate Code for Vending Machine Device
# See https://dev.epicgames.com/documentation/en-us/uefn/verse-api/fortnitedotcom/devices/vending_machine_device for up to date information on the vending machine device.
vending_machine_verse_device := class(creative_device):
    @editable
    OurVendingMachine:vending_machine_device=vending_machine_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()
            
    InitalizeSubscriptions():void=
        OurVendingMachine.ItemSpawnedEvent.Subscribe(OnItemPurchased)

    OnItemPurchased(InAgent:agent):void=
        {}

    AvailableFunctions():void=
        OurVendingMachine.Enable()
        OurVendingMachine.Disable()
        OurVendingMachine.CycleToNextItem()
        OurVendingMachine.SpawnItem()