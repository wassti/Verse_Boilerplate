
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# Boiler Plate Code for Trigger Device
# See https://dev.epicgames.com/documentation/en-us/uefn/verse-api/fortnitedotcom/devices/trigger_device for up to date information on the trigger device
trigger_verse_device := class(creative_device):
    @editable
    OurTrigger:trigger_device=trigger_device{}


    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurTrigger.TriggeredEvent.Subscribe(OnTriggerTriggered)

    OnTriggerTriggered(InOptAgent:?agent):void=
        if(L_InAgent:=InOptAgent?):
            Print("Agent Triggered!")
        else:
            Print("Non-agent Triggered!")

    TriggerTheTrigger(InAgent:agent):void=
        OurTrigger.Trigger(InAgent)
