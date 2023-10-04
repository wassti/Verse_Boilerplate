
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
item_remover_verse_device := class(creative_device):
    @editable
    OurItemRemover:item_remover_device=item_remover_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        {}

    AvailableFunctions():void=
        OurItemRemover.Enable()
        OurItemRemover.Disable()

    AvailableAgentFunctions(InAgent:agent):void=
        OurItemRemover.Remove(InAgent)