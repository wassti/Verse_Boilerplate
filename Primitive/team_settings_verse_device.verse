
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# Boiler Plate Code for Team Settings and Inventory Device
# See https://dev.epicgames.com/documentation/en-us/uefn/verse-api/fortnitedotcom/devices/team_settings_and_inventory_device for up to date information on the team settings and inventory device
team_settings_verse_device := class(creative_device):
    @editable
    OurTeamSettings:team_settings_and_inventory_device=team_settings_and_inventory_device{}

    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurTeamSettings.EnemyEliminatedEvent.Subscribe(OnEnemyEliminated)
        OurTeamSettings.TeamMemberEliminatedEvent.Subscribe(OnTeamMemberEliminated)
        OurTeamSettings.TeamMemberSpawnedEvent.Subscribe(OnTeamMemberSpawned)
        OurTeamSettings.TeamOutOfRespawnsEvent.Subscribe(OnTeamOutOfSpawns)

    OnEnemyEliminated(InAgent:agent):void=
        # InAgent is the agent who eliminated an enemy (who is also on the team(s) defined by the team settings device)
        {}
    
    OnTeamMemberEliminated(InAgent:agent):void=
        # InAgent is the agent who died
        {}
    
    OnTeamMemberSpawned(InAgent:agent):void=
        # InAgent is the agent who spawned
        {}

    OnTeamOutOfSpawns(InTuple:tuple()):void=
        {}

    IsOnTeam(InAgent:agent):logic=
        if(OurTeamSettings.IsOnTeam[InAgent]):
            return true
        return false

    AvailableAgentFunctions():void=
        OurTeamSettings.EndRound() # Ends the round, declaring the team defined by the team device as the winner