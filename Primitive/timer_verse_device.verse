
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# Boiler Plate Code for Timer Device
# See https://dev.epicgames.com/documentation/en-us/uefn/verse-api/fortnitedotcom/devices/timer_device for up to date information on the timer device

timer_verse_device := class(creative_device):
    @editable
    OurTimer:timer_device=timer_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        if(OurTimer.IsStatePerAgent[]):
            InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurTimer.SuccessEvent.Subscribe(OnTimerSuccess)
        OurTimer.FailureEvent.Subscribe(OnTimerFailure)
        OurTimer.StartUrgencyModeEvent.Subscribe(OnTimerUrgencyMode)
        
    OnTimerSuccess(InOptAgent:?agent):void=
        {}

    OnTimerFailure(InOptAgent:?agent):void=
        {}

    OnTimerUrgencyMode(InOptAgent:?agent):void=
        {}


    AvailableFunctions(InAgent:agent):void=
        OurTimer.Enable(InAgent)
        OurTimer.Disable(InAgent)
        OurTimer.Reset(InAgent)
        OurTimer.Start(InAgent)
        OurTimer.Pause(InAgent)
        OurTimer.Resume(InAgent)
        OurTimer.Complete(InAgent)
        OurTimer.Save(InAgent)
        OurTimer.Load(InAgent)
        OurTimer.ClearPersistenceData(InAgent)
        
        L_Float:float=30.0
        OurTimer.SetActiveDuration(L_Float ,InAgent)
        L_Duration:float=OurTimer.GetActiveDuration(InAgent)

        OurTimer.SetLapTime(InAgent)
        
        L_Float2:float=30.0
        OurTimer.SetMaxDuration(L_Float2)
        L_MaxDuration:float=OurTimer.GetMaxDuration()

        