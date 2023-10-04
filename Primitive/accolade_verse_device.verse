
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
accolade_verse_device := class(creative_device):
    @editable
    OurAccolade:accolades_device=accolades_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurAccolade.TestAwardEvent.Subscribe(OnTestAwardEvent)

    OnTestAwardEvent(InAgent:agent):void=
        {}


    AvailableFunctions():void=
        OurAccolade.Enable()
        OurAccolade.Disable()

    AvailableAgentFunctions(InAgent:agent):void=
        OurAccolade.Award(InAgent)