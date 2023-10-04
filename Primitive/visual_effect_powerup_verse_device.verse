
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath }

# Boiler Plate Code for Visual Effect Powerup Device
# See https://dev.epicgames.com/documentation/en-us/uefn/verse-api/fortnitedotcom/devices/visual_effect_powerup_device for up to date information on the visual effect powerup device.

visual_effect_powerup_verse_device := class(creative_device):
    @editable
    OurVisualEffectPowerup:visual_effect_powerup_device=visual_effect_powerup_device{}

    var AgentsThatArePoweredup:[]agent=array{}
    var OriginalTransform:transform=transform{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()
        #if(L_obj:=creative_object[OurVisualEffectPowerup]):
            #if(L_obj.IsValid[]):
                set OriginalTransform = OurVisualEffectPowerup.GetTransform()
            
    InitalizeSubscriptions():void=
        OurVisualEffectPowerup.ItemPickedUpEvent.Subscribe(OnPowerupPickedUp)

    OnPowerupPickedUp(InAgent:agent):void=
        Print("Powerup Picked Up By Agent")

    AvailableFunctions(InFloat:float):void=
        OurVisualEffectPowerup.Spawn()
        #OurVisualEffectPowerup.Despawn()

        L_Float:float=30.0
        OurVisualEffectPowerup.SetDuration(L_Float)

        L_Duration:float=OurVisualEffectPowerup.GetDuration()

    GetRemainingTime(InAgent:agent):float=
        return OurVisualEffectPowerup.GetRemainingTime(InAgent)

    HasEffect(InAgent:agent):logic=
        if(OurVisualEffectPowerup.HasEffect[InAgent]):
            return true
        return false
        
    GrantPowerup(InAgent:agent):void=
        OurVisualEffectPowerup.Pickup(InAgent)
        