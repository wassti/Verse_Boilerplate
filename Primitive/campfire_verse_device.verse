
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
campfire_verse_device := class(creative_device):
    @editable
    OurCampfire:campfire_device=campfire_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurCampfire.AgentEntersEffectAreaEvent.Subscribe(OnAgentEnters)
        OurCampfire.AgentExitsEffectAreaEvent.Subscribe(OnAgentExits)
        OurCampfire.CampfirePulseEvent.Subscribe(OnCampfirePulse)
        OurCampfire.AgentPulsedEvent.Subscribe(OnAgentPulsed)
        OurCampfire.LitEvent.Subscribe(OnCampfireLit)
        OurCampfire.ExtinguishedEvent.Subscribe(OnCampfireExtinguished)
        OurCampfire.EnabledEvent.Subscribe(OnCampfireEnabled)
        OurCampfire.DisabledEvent.Subscribe(OnCampfireDisabled)

    OnAgentEnters(InAgent:agent):void=
        {}

    OnAgentExits(InAgent:agent):void=
        {}

    OnCampfirePulse(InTuple:tuple()):void=
        {}

    OnAgentPulsed(InAgent:agent):void=
        {}

    OnCampfireLit(InAgent:agent):void=
        {}

    OnCampfireExtinguished(InAgent:agent):void=
        {}

    OnCampfireEnabled(InTuple:tuple()):void=
        {}

    OnCampfireDisabled(InTuple:tuple()):void=
        {}

    AvailableFunctions():void=
        OurCampfire.Enable()
        OurCampfire.Disable()
        OurCampfire.AddWood()

    AvailableAgentFunctions(InAgent:agent):void=
        OurCampfire.Light(InAgent)
        OurCampfire.Extinguish(InAgent)