
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
class_selector_ui_verse_device := class(creative_device):
    @editable
    OurSelectorUI:class_selector_ui_device=class_selector_ui_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurSelectorUI.ClassSelectedEvent.Subscribe(OnClassSelected)
        OurSelectorUI.UIClosedEvent.Subscribe(OnUIClosed)
        OurSelectorUI.UIOpenedEvent.Subscribe(OnUIOpened)

    OnClassSelected(InAgent:agent):void=
        {}

    OnUIClosed(InAgent:agent):void=
        {}

    OnUIOpened(InAgent:agent):void=
        {}

    AvailableFunctions():void=
        OurSelectorUI.Enable()
        OurSelectorUI.Disable()

    AvailableAgentFunctions(InAgent:agent):void=
        OurSelectorUI.Show(InAgent)