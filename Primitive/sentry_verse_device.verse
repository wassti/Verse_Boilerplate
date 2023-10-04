
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# Boiler Plate Code for Sentry Device
# See https://dev.epicgames.com/documentation/en-us/uefn/verse-api/fortnitedotcom/devices/sentry_device for up to date information on the sentry device

sentry_verse_device := class(creative_device):
    @editable
    OurSentry:sentry_device=sentry_device{}
    
    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurSentry.AlertedEvent.Subscribe(OnSentryAlerted)
        OurSentry.ExitsAlertEvent.Subscribe(OnSentryExitsAlert)
        OurSentry.EntersAlertCooldownEvent.Subscribe(OnSentryEntersAlertCooldown)
        OurSentry.AttackingEvent.Subscribe(OnSentryAttacking)
        OurSentry.EliminatedEvent.Subscribe(OnSentryEliminated)
        OurSentry.EliminatingACreatureEvent.Subscribe(OnSentryEliminatedACreature)
        OurSentry.EliminatingAgentEvent.Subscribe(OnSentryEliminatedAgent)
        
    OnSentryAlerted(InAgent:agent):void=
        {}

    OnSentryExitsAlert(InTuple:tuple()):void=
        {}

    OnSentryEntersAlertCooldown(InTuple:tuple()):void=
        {}

    OnSentryAttacking(InAgent:agent):void=
        {}

    OnSentryEliminated(InOptAgent:?agent):void=
        {}

    OnSentryEliminatedACreature(InTuple:tuple()):void=
        {}

    OnSentryEliminatedAgent(InAgent:agent):void=
        {}

    AvailableAgentFunctions(InAgent:agent):void=
        OurSentry.JoinTeam(InAgent)
        OurSentry.Target(InAgent)

    AvailableFunctions():void=
        OurSentry.Enable()
        OurSentry.Disable()
        OurSentry.Spawn()
        OurSentry.DestroySentry()
        OurSentry.ResetTeam()
        OurSentry.Pacify()
        OurSentry.EnableAlert()
        OurSentry.ResetAlertCooldown()