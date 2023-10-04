
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
animated_mesh_verse_device := class(creative_device):
    @editable
    OurAnimMesh:animated_mesh_device=animated_mesh_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        {}

    AvailableFunctions():void=
        OurAnimMesh.Play()
        OurAnimMesh.Pause()
        OurAnimMesh.PlayReverse()