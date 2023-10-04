
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
attribute_evaluator_verse_device := class(creative_device):
    @editable
    OurEvaluator:attribute_evaluator_device=attribute_evaluator_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurEvaluator.PassEvent.Subscribe(OnEvalPass)
        OurEvaluator.FailEvent.Subscribe(OnEvalFail)

    OnEvalPass(InAgent:agent):void=
        {}

    OnEvalFail(InAgent:agent):void=
        {}

    AvailableAgentFunctions(InAgent:agent):void=
        OurEvaluator.EvaluateAgent(InAgent)