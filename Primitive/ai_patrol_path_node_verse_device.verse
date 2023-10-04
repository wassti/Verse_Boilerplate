
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
ai_patrol_path_node_verse_device := class(creative_device):
    @editable
    OurPath:ai_patrol_path_device=ai_patrol_path_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurPath.NodeReachedEvent.Subscribe(OnNodeReached)
        OurPath.NextNodeUnreachableEvent.Subscribe(OnNextNodeUnreachable)
        OurPath.PatrolPathStartedEvent.Subscribe(OnPatrolPathStarted)
        OurPath.PatrolPathStoppedEvent.Subscribe(OnPatrolPathStopped)

    OnNodeReached(InAgent:agent):void=
        {}

    OnNextNodeUnreachable(InAgent:agent):void=
        {}

    OnPatrolPathStarted(InAgent:agent):void=
        {}

    OnPatrolPathStopped(InAgent:agent):void=
        {}

    AvailableFunctions():void=
        OurPath.Enable()
        OurPath.Disable()

    AvailableAgentFunctions(InAgent:agent):void=
        OurPath.Assign(InAgent)
        OurPath.GoToNextPatrolGroup(InAgent)