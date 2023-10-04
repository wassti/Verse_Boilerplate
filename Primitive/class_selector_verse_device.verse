
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
class_selector_verse_device := class(creative_device):
    @editable
    OurSelector:class_and_team_selector_device=class_and_team_selector_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurSelector.ClassSwitchedEvent.Subscribe(OnClassSwitched)
        OurSelector.TeamSwitchedEvent.Subscribe(OnTeamSwitched)

    OnClassSwitched(InAgent:agent):void=
        {}

    OnTeamSwitched(InAgent:agent):void=
        {}
    
    AvailableFunctions():void=
        OurSelector.Enable()
        OurSelector.Disable()

    AvailableAgentFunctions(InAgent:agent):void=
        OurSelector.ChangeClass(InAgent)
        OurSelector.ChangeTeam(InAgent)
        OurSelector.ChangeTeamAndClass(InAgent)
        OurSelector.ChangeSelectorTeam(InAgent)