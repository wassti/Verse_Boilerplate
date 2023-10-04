
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
hud_message_verse_device := class(creative_device):
    @editable
    OurHUDMessage:hud_message_device=hud_message_device{}

    StringToMessage<localizes>(value:string) : message = "{value}"

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        {}
    
    AvailableFunctions():void=
        OurHUDMessage.Show()
        OurHUDMessage.Show(StringToMessage("SomeText"))
        OurHUDMessage.Hide()
        OurHUDMessage.SetDisplayTime(0.0)
        L_DisplayTime:=OurHUDMessage.GetDisplayTime()
        OurHUDMessage.SetText(StringToMessage("SomeText"))

    AvailableAgentFunctions(InAgent:agent):void=
        OurHUDMessage.Show(InAgent)
        DisplayTime:=30.0
        OurHUDMessage.Show(InAgent,StringToMessage("SomeText"),?DisplayTime:=DisplayTime)