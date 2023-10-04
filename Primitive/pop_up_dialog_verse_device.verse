
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
pop_up_dialog_verse_device := class(creative_device):
    @editable
    OurPopup:popup_dialog_device=popup_dialog_device{}

    StringToMessage<localizes>(value:string) : message = "{value}"

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurPopup.RespondingButtonEvent.Subscribe(OnPopupResponse)
        OurPopup.ShownEvent.Subscribe(OnPopupShown)
        OurPopup.DismissedEvent.Subscribe(OnPopupDismissed)
        OurPopup.TimeOutEvent.Subscribe(OnPopupTimedOut)


    OnPopupResponse(InTuple:tuple(agent,int)):void=
        # Sends the `agent` that pushed the button.
        # Sends the `int` index of the clicked the button.
        {}

    OnPopupShown(InAgent:agent):void=
        {}
    OnPopupDismissed(InAgent:agent):void=
        {}
    OnPopupTimedOut(InAgent:agent):void=
        {}

    AvailableAgentFunctions(InAgent:agent):void=
        OurPopup.Show(InAgent)
        OurPopup.Hide(InAgent)

    AvailableFunctions():void=
        OurPopup.Enable()
        OurPopup.Disable()
        OurPopup.Show()
        OurPopup.Hide()
        OurPopup.SetButtonCount(9001)
        L_ZerothText:=OurPopup.GetButtonText(0)
        OurPopup.SetButtonText(StringToMessage("SomeText"),0)
        OurPopup.SetDescriptionText(StringToMessage("Some Description"))
        L_DescriptionText:=OurPopup.GetDescriptionText()
        OurPopup.SetTitleText(StringToMessage("SomeText"))
        L_TitleText:=OurPopup.GetTitleText()