
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# Boiler Plate Code for Radio Device
# See https://dev.epicgames.com/documentation/en-us/uefn/verse-api/fortnitedotcom/devices/radio_device for up to date information on the radio device.

radio_verse_device := class(creative_device):
    @editable
    OurRadio:radio_device=radio_device{}

    OnBegin<override>()<suspends>:void=
        {}

    AvailableAgentFunctions(InAgent:agent):void=
        OurRadio.Register(InAgent)
        OurRadio.Unregister(InAgent)

    AvailableFunctions():void=
        OurRadio.Play()
        OurRadio.Stop()
        OurRadio.UnregisterAll()
        OurRadio.Show()
        OurRadio.Hide()