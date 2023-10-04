
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
button_verse_device := class(creative_device):
    @editable
    OurButton:button_device=button_device{}

    StringToMessage<localizes>(value:string) : message = "{value}"

    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurButton.InteractedWithEvent.Subscribe(OnAgentInteracted)

    OnAgentInteracted(InAgent:agent):void=
        {}

    AvailableFunctions():void=
        OurButton.Enable()
        OurButton.Disable()
        OurButton.SetInteractionText(StringToMessage("SomeText"))
        OurButton.SetInteractionTime(3.0)
        L_InteractTime:=OurButton.GetInteractionTime()
        OurButton.SetMaxTriggerCount(1)
        L_MaxTriggerCount:=OurButton.GetMaxTriggerCount()
        L_TriggerCountRemaining:=OurButton.GetTriggerCountRemaining()