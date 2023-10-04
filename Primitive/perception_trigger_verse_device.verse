
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
perception_trigger_verse_device := class(creative_device):
    @editable
    OurPerceptionTrigger:perception_trigger_device=perception_trigger_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurPerceptionTrigger.AgentLooksAtDeviceEvent.Subscribe(OnAgentLooksAt)
        OurPerceptionTrigger.AgentLooksAwayFromDeviceEvent.Subscribe(OnAgentLooksAway)
        OurPerceptionTrigger.DeviceSeesAgentEvent.Subscribe(OnDeviceSeesAgent)
        OurPerceptionTrigger.DeviceLosesSightOfAgentEvent.Subscribe(OnDeviceLosesSightOfAgent)

    OnAgentLooksAt(InAgent:agent):void=
        {}

    OnAgentLooksAway(InAgent:agent):void=
        {}

    OnDeviceSeesAgent(InAgent:agent):void=
        {}

    OnDeviceLosesSightOfAgent(InAgent:agent):void=
        {}
