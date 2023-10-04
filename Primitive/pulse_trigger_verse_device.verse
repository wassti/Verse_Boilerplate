
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
pulse_trigger_verse_device := class(creative_device):
    @editable
    OurPulseTrigger:pulse_trigger_device=pulse_trigger_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        {}

    AvailableFunctions():void=
        OurPulseTrigger.Enable()
        OurPulseTrigger.Disable()
        OurPulseTrigger.Begin()
        OurPulseTrigger.End()
        OurPulseTrigger.ResumeSequence()
        OurPulseTrigger.SetDamage(9001.0)
        L_Damage:=OurPulseTrigger.GetDamage()
        OurPulseTrigger.SetLoopCount(9001)
        L_LoopCount:=OurPulseTrigger.GetLoopCount()
        OurPulseTrigger.SetWaveSpeed(9001.0)
        L_WaveSpeed:=OurPulseTrigger.GetWaveSpeed()