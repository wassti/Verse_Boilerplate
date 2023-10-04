
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
fuel_pump_verse_device := class(creative_device):
    @editable
    OurFuelPump:fuel_pump_device=fuel_pump_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurFuelPump.EmptyEvent.Subscribe(OnFuelPumpEmpty)

    OnFuelPumpEmpty(InAgent:agent):void=
        {}

    AvailableAgentFunctions():void=
        OurFuelPump.Enable()
        OurFuelPump.Disable()
        OurFuelPump.Reset()

    AvailableAgentFunctions(InAgent:agent):void=
        OurFuelPump.Empty(InAgent) # Grants fuel to `Agent`