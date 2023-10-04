
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
score_manager_verse_device := class(creative_device):
    @editable
    OurScoreManager:score_manager_device=score_manager_device{}
    
    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurScoreManager.MaxTriggersEvent.Subscribe(OnMaxTriggers)
        OurScoreManager.ScoreOutputEvent.Subscribe(OnScoreOutput)

    OnMaxTriggers(InAgent:agent):void=
        {}

    OnScoreOutput(InAgent:agent):void=
        {}

    AvailableAgentFunctions(InAgent:agent):void=
        OurScoreManager.Enable(InAgent)
        OurScoreManager.Disable(InAgent)
        OurScoreManager.Reset(InAgent)
        OurScoreManager.Increment(InAgent)
        OurScoreManager.Decrement(InAgent)
        OurScoreManager.SetToAgentScore(InAgent) # Sets the score to be awarded by the next activation to `Agent`'s current score.
        L_AgentScore:int=OurScoreManager.GetCurrentScore(InAgent) # Returns the current score for `Agent`.

    AvailableFunctions():void=
        OurScoreManager.Enable()
        OurScoreManager.Disable()
        OurScoreManager.Reset()
        OurScoreManager.Increment()
        OurScoreManager.Decrement()
        OurScoreManager.SetScoreAward(9001)
        WhatNineThousand:int=OurScoreManager.GetScoreAward()