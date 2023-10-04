
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
audio_player_verse_device := class(creative_device):
    @editable
    OurAudioPlayer:audio_player_device=audio_player_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        {}

    AvailableFunctions():void=
        OurAudioPlayer.Enable()
        OurAudioPlayer.Disable()
        OurAudioPlayer.Play()
        OurAudioPlayer.Stop()
        OurAudioPlayer.UnregisterAll()
        OurAudioPlayer.Show()
        OurAudioPlayer.Hide()

    AvailableAgentFunctions(InAgent:agent):void=
        OurAudioPlayer.Play(InAgent)
        OurAudioPlayer.Stop(InAgent)
        OurAudioPlayer.Register(InAgent)
        OurAudioPlayer.Unregister(InAgent)