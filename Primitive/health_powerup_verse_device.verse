
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
health_powerup_verse_device := class(creative_device):
    @editable
    OurHealthPowerup:health_powerup_device=health_powerup_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        {}

    AvailableFunctions():void=
        OurHealthPowerup.SetMagnitude(9001.0)
        L_Magnitude:=OurHealthPowerup.GetMagnitude()