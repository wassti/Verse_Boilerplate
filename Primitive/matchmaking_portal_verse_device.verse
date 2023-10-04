
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# https://dev.epicgames.com/documentation/en-us/uefn/verse-api/fortnitedotcom/devices/matchmaking_portal_device
matchmaking_portal_verse_device := class(creative_device):
    @editable
    OurPortal:matchmaking_portal_device=matchmaking_portal_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        {}

    AvailableFunctions():void=
        OurPortal.Enable()
        OurPortal.Disable()