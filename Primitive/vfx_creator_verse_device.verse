
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# Boiler Plate Code for VFX Creator Device
# See https://dev.epicgames.com/documentation/en-us/uefn/verse-api/fortnitedotcom/devices/vfx_creator_device for up to date information on the vfx spawner device.
vfx_creator_verse_device := class(creative_device):
    @editable
    OurVfxCreator:vfx_creator_device=vfx_creator_device{}


    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        {}
        # This Class Has No Members/Subscriptions

    # These functions are only valid if Stick to Player is enabled.
    AvailableAgentFunctions(InAgent:agent):void=
        OurVfxCreator.Begin(InAgent)
        OurVfxCreator.BeginForAll()
        OurVfxCreator.End()
        OurVfxCreator.EndForAll()
        OurVfxCreator.Remove(InAgent)
        OurVfxCreator.SpawnAt(InAgent)
        OurVfxCreator.Toggle(InAgent)
        OurVfxCreator.ToggleForAll()
        OurVfxCreator.TogglePauseForAll()

    AvailableFunctions():void=
        OurVfxCreator.Begin()
        OurVfxCreator.Disable()
        OurVfxCreator.Enable()
        OurVfxCreator.End()
        OurVfxCreator.Toggle()
        OurVfxCreator.ToggleEnabled()
        OurVfxCreator.TogglePause()