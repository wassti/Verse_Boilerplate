
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
damage_volume_verse_device := class(creative_device):
    @editable
    OurDmgVolume:damage_volume_device=damage_volume_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurDmgVolume.AgentEntersEvent.Subscribe(OnAgentEnters)
        OurDmgVolume.AgentExitsEvent.Subscribe(OnAgentExits)

    OnAgentEnters(InAgent:agent):void=
        {}

    OnAgentExits(InAgent:agent):void=
        {}

    AvailableFunctions():void=
        OurDmgVolume.SetDamage(9001)
        L_Damage:=OurDmgVolume.GetDamage()

    AvailableAgentFunctions(InAgent:agent):void=
        OurDmgVolume.UpdateSelectedClass(InAgent)
        OurDmgVolume.UpdateSelectedTeam(InAgent)
        if(OurDmgVolume.IsInVolume[InAgent]):
