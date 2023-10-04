
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# Boiler Plate Code for Skydive Volume Device
# See https://dev.epicgames.com/documentation/en-us/uefn/verse-api/fortnitedotcom/devices/skydive_volume_device for up to date information on the skydive volume device

skydive_volume_verse_device := class(creative_device):
    @editable
    OurSkydiveVolume:skydive_volume_device=skydive_volume_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurSkydiveVolume.AgentEntersEvent.Subscribe(OnAgentEnteredSkydive)
        OurSkydiveVolume.AgentExitsEvent.Subscribe(OnAgentExitedSkydive)
        OurSkydiveVolume.ZoneOccupiedEvent.Subscribe(OnAgentExitedSkydive)
        OurSkydiveVolume.ZoneEmptiedEvent.Subscribe(OnAgentExitedSkydive)

    OnAgentEnteredSkydive(InAgent:agent):void=
        {}

    OnAgentExitedSkydive(InAgent:agent):void=
        {}
    
    AvailableAgentFunctions(InAgent:agent):void=
        OurSkydiveVolume.EnableVolumeLocking()
        OurSkydiveVolume.DisableVolumeLocking()
        if(OurSkydiveVolume.IsInVolume[InAgent]){}
