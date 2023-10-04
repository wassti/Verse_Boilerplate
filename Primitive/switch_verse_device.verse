
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /Verse.org/Assets }
using { /UnrealEngine.com/Temporary/Diagnostics }



# Boiler Plate Code for Switch Device
# See https://dev.epicgames.com/documentation/en-us/uefn/verse-api/fortnitedotcom/devices/switch_device for up to date information on the switch device

switch_verse_device := class(creative_device):
    @editable
    OurSwitch:switch_device=switch_device{}

    StringToMessage<localizes>(value:string) : message = "{value}"

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurSwitch.TurnedOnEvent.Subscribe(OnSwitchTurnedOn)
        OurSwitch.TurnedOffEvent.Subscribe(OnSwitchTurnedOff)
        OurSwitch.IfOnWhenCheckedEvent.Subscribe(CheckedSwitchOn)
        OurSwitch.IfOffWhenCheckedEvent.Subscribe(CheckedSwitchOff)
        OurSwitch.StateSaveEvent.Subscribe(OnStateSaved)
        OurSwitch.StateChangesEvent.Subscribe(OnStateChanged)

    OnSwitchTurnedOn(InAgent:agent):void=
        {}
    OnSwitchTurnedOff(InAgent:agent):void=
        {}
    CheckedSwitchOn(InTuple:tuple()):void=
        {}

    CheckedSwitchOff(InTuple:tuple()):void=
        {}

    OnStateSaved(InTuple:tuple()):void=
        {}

    OnStateChanged(InTuple:tuple()):void=
        {}


    AvailableAgentFunctions(InAgent:agent):void=
        OurSwitch.Enable()
        OurSwitch.Disable()
        OurSwitch.Disable()
        OurSwitch.TurnOn(InAgent)
        OurSwitch.TurnOff(InAgent)
        OurSwitch.ToggleState(InAgent)
        OurSwitch.LoadState(InAgent)
        OurSwitch.SaveState(InAgent)
        OurSwitch.CheckState(InAgent)
        OurSwitch.ClearPersistenceData(InAgent)
        OurSwitch.ClearAllPersistenceData()

        if(OurSwitch.IsStatePerAgent[]):
            if(OurSwitch.GetCurrentState[InAgent]){} #calling this event will eventually fire either IfOnWhenCheckedEvent or IfOffWhenCheckedEvent
        else:
            if(OurSwitch.GetCurrentState[]){}
        
        L_InteractionTime:=OurSwitch.GetInteractionTime()
        OurSwitch.SetInteractionTime(L_InteractionTime+3.0)
        
        OurSwitch.SetTurnOnInteractionText(StringToMessage("Turn On"))
        OurSwitch.SetTurnOffInteractionText(StringToMessage("Turn Off"))
