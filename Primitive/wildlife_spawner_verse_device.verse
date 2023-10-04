
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# Boiler Plate Code for Wildlife Spawner Device
# See https://dev.epicgames.com/documentation/en-us/uefn/verse-api/fortnitedotcom/devices/wildlife_spawner_device for up to date information on the wildlife spawner device.
wildlife_spawner_verse_device := class(creative_device):
    @editable
    OurWildlifeSpawner:wildlife_spawner_device=wildlife_spawner_device{}

    var AgentsThatAreRiding:[]agent=array{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        InitalizeSubscriptions()

    InitalizeSubscriptions():void=
        OurWildlifeSpawner.DamagedEvent.Subscribe(OnWildlifeDamaged)            #Damaged
        OurWildlifeSpawner.DismountedEvent.Subscribe(OnWildlifeDismounted)      #Dismounted
        OurWildlifeSpawner.EliminatedEvent.Subscribe(OnWildlifeEliminated)      #Eliminated
        OurWildlifeSpawner.EliminatingEvent.Subscribe(OnWildlifeEliminating)    #Eliminating (The causer of an elimination)
        OurWildlifeSpawner.ForceSpawnedEvent.Subscribe(OnWildlifeForceSpawned)  #ForceSpawnedEvent
        OurWildlifeSpawner.RiddenEvent.Subscribe(OnWildlifeMounted)             #Ridden
        OurWildlifeSpawner.SomethingIsEatenEvent.Subscribe(OnWildlifeAte)       #Wildlife Ate Something
        OurWildlifeSpawner.SpawnedEvent.Subscribe(OnWildlifeSpawned)            #Wildlife Spawned
        OurWildlifeSpawner.TamedEvent.Subscribe(OnWildlifeTamed)                #Wildlife Tamed
        OurWildlifeSpawner.UntamedEvent.Subscribe(OnWildlifeUntamed)            #Wildlife Untamed
        
    AddAgentToRiding(InAgent:agent)<transacts>:void=
        set AgentsThatAreRiding += array{InAgent}
    
    RemoveAgentFromRiding(InAgent:agent)<transacts>:void=
        if (set AgentsThatAreRiding = AgentsThatAreRiding.RemoveFirstElement[InAgent]){}

    OnWildlifeEliminated(InResult:device_ai_interaction_result):void=
        L_OptSourceAgent:=InResult.Source
        if(L_SourceAgent:agent=L_OptSourceAgent?):
            Print("Wildlife Eliminated: Source Agent True")
        else:
            Print("Wildlife Eliminated by non-Agent")
        L_OptTargetAgent:=InResult.Target
        if(L_TargetAgent:agent=L_OptTargetAgent?):
            Print("Wildlife Eliminated: Target Agent True")

    OnWildlifeEliminating(InResult:device_ai_interaction_result):void=
        L_OptSourceAgent:=InResult.Source
        if(L_SourceAgent:agent=L_OptSourceAgent?):
            Print("Wildlife Eliminating: Source Agent True")
        else:
            Print("Wildlife Eliminating a non-Agent")
        L_OptTargetAgent:=InResult.Target
        if(L_TargetAgent:agent=L_OptTargetAgent?):
            Print("Wildlife Eliminating: Target Agent True")

    OnWildlifeDamaged(InResult:device_ai_interaction_result):void=
        L_OptSourceAgent:=InResult.Source
        if(L_SourceAgent:agent=L_OptSourceAgent?):
            Print("Wildlife Damaged: Source Agent True")
        else:
            Print("Wildlife Damaged by non-Agent")
        L_OptTargetAgent:=InResult.Target
        if(L_TargetAgent:agent=L_OptTargetAgent?): #in what context is this used? will this have an agent if the wildlife is tamed? idk....
            Print("Wildlife Damaged: Target Agent True")

    OnWildlifeDismounted(InResult:device_ai_interaction_result):void=
        L_OptSourceAgent:=InResult.Source
        if(L_SourceAgent:agent=L_OptSourceAgent?):
            RemoveAgentFromRiding(L_SourceAgent) #Remove the agent from the array that is tracking the agents that are riding wildlife
            Print("Wildlife Dismounted: Source Agent True")
        L_OptTargetAgent:=InResult.Target
        if(L_TargetAgent:agent=L_OptTargetAgent?):
            Print("Wildlife Dismounted: Target Agent True")

    OnWildlifeMounted(InResult:device_ai_interaction_result):void=
        L_OptSourceAgent:=InResult.Source
        if(L_SourceAgent:agent=L_OptSourceAgent?):
            AddAgentToRiding(L_SourceAgent) #Remove the agent from the array that is tracking the agents that are riding wildlife
            Print("Wildlife Mounted: Source Agent True")
        L_OptTargetAgent:=InResult.Target
        if(L_TargetAgent:agent=L_OptTargetAgent?):
            Print("Wildlife Mounted: Target Agent True")

    OnWildlifeAte(InSatedWildlife:agent):void=
        Print("Wildlife Ate Something")
    
    OnWildlifeSpawned(InSpawnedWildlife:agent):void=
        Print("Wildlife Spawned")

    OnWildlifeForceSpawned(InSpawnedWildlife:agent):void=
        Print("Wildlife force Spawned")

    OnWildlifeTamed(InResult:device_ai_interaction_result):void=
        L_OptSourceAgent:=InResult.Source
        if(L_SourceAgent:agent=L_OptSourceAgent?):
            Print("Wildlife Tamed: Source Agent True")
        L_OptTargetAgent:=InResult.Target
        if(L_TargetAgent:agent=L_OptTargetAgent?):
            Print("Wildlife Tamed: Target Agent True")

    OnWildlifeUntamed(InResult:device_ai_interaction_result):void=
        L_OptSourceAgent:=InResult.Source
        if(L_SourceAgent:agent=L_OptSourceAgent?):
            Print("Wildlife Untamed: Source Agent True")
        L_OptTargetAgent:=InResult.Target
        if(L_TargetAgent:agent=L_OptTargetAgent?):
            Print("Wildlife Untamed: Target Agent True")
        