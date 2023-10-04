
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
billboard_verse_device := class(creative_device):
    @editable
    OurBillboard:billboard_device=billboard_device{}

    StringToMessage<localizes>(value:string) : message = "{value}"

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        {}

    AvailableFunctions():void=
        OurBillboard.ShowText()
        OurBillboard.HideText()
        OurBillboard.UpdateDisplay()
        OurBillboard.SetShowBorder(false)
        L_bShowBorder:=OurBillboard.GetShowBorder()
        OurBillboard.SetText(StringToMessage("SomeText"))
        OurBillboard.SetTextSize(16)
        L_TextSize:=OurBillboard.GetTextSize()