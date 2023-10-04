
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath }

# Boiler Plate Code for VFX Spawner Device
# See https://dev.epicgames.com/documentation/en-us/uefn/verse-api/fortnitedotcom/devices/vfx_spawner_device for up to date information on the vfx spawner device.
vfx_spawner_verse_device := class(creative_device):
    @editable
    OurVfxSpawner:vfx_spawner_device=vfx_spawner_device{}

    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()
            
    InitalizeSubscriptions():void=
        OurVfxSpawner.EffectEnabledEvent.Subscribe(OnEffectEnabled)
        OurVfxSpawner.EffectDisabledEvent.Subscribe(OnEffectDisabled)

    OnEffectEnabled(InTuple:tuple()):void=
        #whats in this tuple? idk.... :(
        {}

    OnEffectDisabled(InTuple:tuple()):void=
        {}

    AvailableFunctions(InTransform:transform):void=
        OurVfxSpawner.Enable()
        OurVfxSpawner.Disable()
        if(OurVfxSpawner.TeleportTo[InTransform]){}