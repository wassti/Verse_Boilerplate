
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
mutator_zone_verse_device := class(creative_device):
    @editable
    OurMutatorZone:mutator_zone_device=mutator_zone_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurMutatorZone.AgentBeginsEmotingEvent.Subscribe(OnAgentBeginsEmoting)
        OurMutatorZone.AgentEndsEmotingEvent.Subscribe(OnAgentEndsEmoting)
        OurMutatorZone.AgentEntersEvent.Subscribe(OnAgentEnters)
        OurMutatorZone.AgentExitsEvent.Subscribe(OnAgentExits)

    OnAgentBeginsEmoting(InAgent:agent):void=
        {}

    OnAgentEndsEmoting(InAgent:agent):void=
        {}

    OnAgentEnters(InAgent:agent):void=
        {}

    OnAgentExits(InAgent:agent):void=
        {}

    AvailableAgentFunctions(InAgent:agent):void=
        OurMutatorZone.UpdateSelectedClass(InAgent)
        OurMutatorZone.UpdateSelectedTeam(InAgent)
        if(OurMutatorZone.IsInVolume[InAgent]):