
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
elimination_manager_verse_device := class(creative_device):
    @editable
    OurElimManager:elimination_manager_device=elimination_manager_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurElimManager.EliminatedEvent.Subscribe(OnEliminated)
        OurElimManager.EliminationEvent.Subscribe(OnElimination)

    OnEliminated(InAgent:agent):void=
        {}

    OnElimination(InOptAgent:?agent):void=
        if(L_Agent:=InOptAgent?):