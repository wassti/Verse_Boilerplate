
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# Boiler Plate Code for Real Time Clock Device
# See https://dev.epicgames.com/documentation/en-us/uefn/verse-api/fortnitedotcom/devices/real_time_clock_device for up to date information on the real time clock device.

realtime_clock_verse_device := class(creative_device):
    @editable
    OurRTC:real_time_clock_device=real_time_clock_device{}

    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurRTC.DurationElapsedEvent.Subscribe(OnDurationElapsed)
        OurRTC.TimeReachedEvent.Subscribe(OnTimeReached)
        OurRTC.EnablingAfterTimeReachedEvent.Subscribe(OnEnablingAfterTimeReached)
        OurRTC.EnablingBeforeTimeReachedEvent.Subscribe(OnEnablingBeforeTimeReached)

    OnDurationElapsed(InTuple:tuple()):void=
        {}

    OnTimeReached(InTuple:tuple()):void=
        {}

    OnEnablingAfterTimeReached(InTuple:tuple()):void=
        {}

    OnEnablingBeforeTimeReached(InTuple:tuple()):void=
        {}

    AvailableFunctions():void=
        OurRTC.Enable()
        OurRTC.Disable()