
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
prop_manipulator_verse_device := class(creative_device):
    @editable
    OurPropMani:prop_manipulator_device=prop_manipulator_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurPropMani.DamagedEvent.Subscribe(OnPropDamaged)
        OurPropMani.DestroyedEvent.Subscribe(OnPropDestroyed)
        OurPropMani.HarvestingEvent.Subscribe(OnPropHarvested)
        OurPropMani.ResourceDepletionEvent.Subscribe(OnPropResourceDepeleted)

    OnPropDamaged(InAgent:agent):void=
        {}

    OnPropDestroyed(InAgent:agent):void=
        {}

    OnPropHarvested(InAgent:agent):void=
        {}

    OnPropResourceDepeleted(InAgent:agent):void=
        {}

    AvailableFunctions():void=
        OurPropMani.Enable()
        OurPropMani.Disable()
        OurPropMani.ShowProps()
        OurPropMani.HideProps()
        OurPropMani.ExhaustResources()
        OurPropMani.RestockResources()
        OurPropMani.RestoreHealth()
        OurPropMani.SetResourceOverridesActive()
        OurPropMani.DisableResourceNodeOverrides()