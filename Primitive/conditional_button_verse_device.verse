
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
conditional_button_verse_device := class(creative_device):
    @editable
    OurConditionalButton:conditional_button_device=conditional_button_device{}

    StringToMessage<localizes>(value:string) : message = "{value}"

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurConditionalButton.ActivatedEvent.Subscribe(OnActivated)
        OurConditionalButton.NotEnoughItemsEvent.Subscribe(OnNotEnoughItems)

    OnActivated(InAgent:agent):void=
        {}

    OnNotEnoughItems(InAgent:agent):void=
        {}

    AvailableFunctions():void=
        OurConditionalButton.Enable()
        OurConditionalButton.Disable()
        OurConditionalButton.Reset()
        OurConditionalButton.SetInteractionText(StringToMessage("SomeText"))
        OurConditionalButton.SetInteractionTime(3.0)
        L_InteractTime:=OurConditionalButton.GetInteractionTime()
        OurConditionalButton.SetItemCountRequired(10,0)
        OurConditionalButton.GetItemCountRequired(0)
        OurConditionalButton.GetRemainingItemCountRequired(0)
        OurConditionalButton.SetItemScore(0,99)
        OurConditionalButton.GetItemScore(0)

    AvailableAgentFunctions(InAgent:agent):void=
        OurConditionalButton.Activate(InAgent)
        OurConditionalButton.Toggle(InAgent)
        L_ItemCount:=OurConditionalButton.GetItemCount(InAgent, 0)
        if(OurConditionalButton.IsHoldingItem[InAgent,0]):
        if(OurConditionalButton.HasAllItems[InAgent]):