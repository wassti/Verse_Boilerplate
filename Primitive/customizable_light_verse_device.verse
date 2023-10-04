
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
customizable_light_verse_device := class(creative_device):
    @editable
    OurLight:customizable_light_device=customizable_light_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        {}

    AvailableFunctions():void=
        OurLight.Enable()
        OurLight.Disable()
        OurLight.Reset()
        OurLight.TurnOn()
        OurLight.TurnOff()
        OurLight.Toggle()
        OurLight.DimLight()
        OurLight.UndimLight()