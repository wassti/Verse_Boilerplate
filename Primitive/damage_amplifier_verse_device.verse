
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
damage_amplifier_verse_device := class(creative_device):
    @editable
    OurDamageAmplifier:damage_amplifier_powerup_device=damage_amplifier_powerup_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurDamageAmplifier.ItemPickedUpEvent.Subscribe(OnItemPickedUp)

    OnItemPickedUp(InAgent:agent):void=
        {}

    AvailableFunctions():void=
        OurDamageAmplifier.SetMagnitude(9001.0)
        L_Magnitude:=OurDamageAmplifier.GetMagnitude()
        OurDamageAmplifier.Spawn()
        OurDamageAmplifier.Despawn()
        OurDamageAmplifier.SetDuration(30.0)
        L_Duration:=OurDamageAmplifier.GetDuration()
        OurDamageAmplifier.Pickup()

    AvailableAgentFunctions(InAgent:agent):void=
        if(OurDamageAmplifier.HasEffect[InAgent]):
        OurDamageAmplifier.Pickup(InAgent)
        L_RemainingTime:=OurDamageAmplifier.GetRemainingTime(InAgent)
