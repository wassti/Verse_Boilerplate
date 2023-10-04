
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
hud_controller_verse_device := class(creative_device):
    @editable
    OurHUDController:hud_controller_device=hud_controller_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        {}

    AvailableFunctions():void=
        OurHUDController.Enable()
        OurHUDController.Disable()
        OurHUDController.ResetAffectedClass()
        OurHUDController.ResetAffectedTeam()

    AvailableAgentFunctions(InAgent:agent):void=
        OurHUDController.UpdateAffectedClass(InAgent)
        OurHUDController.UpdateAffectedTeam(InAgent)