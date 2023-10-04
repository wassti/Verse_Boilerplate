
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
prop_o_matic_verse_device := class(creative_device):
    @editable
    OurPropManager:prop_o_matic_manager_device=prop_o_matic_manager_device{}


    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurPropManager.BeginEnteringDisguiseEvent.Subscribe(OnBeginEnteringDisguise)
        OurPropManager.FinishEnteringDisguiseEvent.Subscribe(OnFinishEnteringDisguise)
        OurPropManager.ExitingDisguiseEvent.Subscribe(OnExitingDisguise)

    OnBeginEnteringDisguise(InAgent:agent):void=
        {}

    OnFinishEnteringDisguise(InAgent:agent):void=
        {}

    OnExitingDisguise(InAgent:agent):void=
        {}

    AvailableAgentFunctions(InAgent:agent):void=
        if(OurPropManager.IsPlayerProp[InAgent]):
            
        OurPropManager.PingPlayerProp(InAgent) 

    AvailableFunctions():void=
        OurPropManager.SetPingProps(true)
        OurPropManager.SetPingProps(false)
        OurPropManager.SetPingFrequency(30.0)
        OurPropManager.SetShowPropsRemaining(true)
        OurPropManager.SetShowPropPingCooldown(true)
        OurPropManager.PingPlayerProps()