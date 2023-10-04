
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
character_verse_device := class(creative_device):
    @editable
    OurCharacterDevice:character_device=character_device{}

    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurCharacterDevice.InteractedWithEvent.Subscribe(OnCharacterInteractedWith)

    OnCharacterInteractedWith(InAgent:agent):void=
        {}

    AvailableFunctions():void=
        OurCharacterDevice.Enable()
        OurCharacterDevice.Disable()
        OurCharacterDevice.Show()
        OurCharacterDevice.Hide()
        OurCharacterDevice.PlayEmote()