-- RandomX 
-- Description: Transform Randomizer for 3ds Max
-- Version: 0.4
-- Author: Markulie
-- Created: May 4, 2015
-- Updated: August 21, 2022

global rltRandomX
try destroyDialog rltRandomX catch()

rollout rltRandomX "RandomX 0.4"
(
        label lbl_move_rotate "M O V E             R O T A T E" pos:[30,3]
    
        spinner spn_mxMove "Max:" type:#integer range:[0,3000,30] pos:[20,20] width:65
        spinner spn_mnMove "Min: " type:#integer range:[0,3000,0] pos:[20,40] width:65
        radiobuttons rdi_movAxis labels:#("X","Y","Z") pos:[5,62] offset:[0,5] default:1
        slider sld_move pos:[5,80]
                        type:#integer range:[-(spn_mxMove.value),(spn_mxMove.value),0]
                        width:95 offset:[0,5]
        on spn_mxMove changed value do
        (
        sld_move.range = [-(spn_mxMove.value),(spn_mxMove.value),0]
        sld_move.ticks = 8
        )
    
        on sld_move buttonup do
        (
            if selection.count<=1 then
            (
            messagebox "Please select some objects first."
            sld_move.range = [-(spn_mxMove.value),(spn_mxMove.value),0]
            sld_move.ticks =8
            )
            else
            (
                if (rdi_movAxis.state == 1) do
                (
                    coll2 = $
                    arr = coll2 as array
                    for i = 1 to arr.count do
                    (
                        seed (random 1 50000)
                        in coordsys local arr[i].pos = random [(spn_mnMove.value),0,0] [(sld_move.value),0,0]
                    )
                )
            
                if (rdi_movAxis.state == 2) do
                (
                    coll2 = $
                    arr = coll2 as array
                    for i = 1 to arr.count do
                    (
                        seed (random 1 50000)
                        in coordsys local arr[i].pos = random [0,(spn_mnMove.value),0] [0,(sld_move.value),0]
                    )
                    
                )
                
                if (rdi_movAxis.state == 3) do
                (
                    coll2 = $
                    arr = coll2 as array
                    for i = 1 to arr.count do
                    (
                        seed (random 1 50000)
                        in coordsys local arr[i].pos = random [0,0,(spn_mnMove.value)] [0,0,(sld_move.value)]
                    )
                )
                
                sld_move.range = [-(spn_mxMove.value),(spn_mxMove.value),0]
                sld_move.ticks =8
            )
        )
        
    spinner spn_mxRotation " Max: " type:#integer range:[0,360,30] pos:[110-5+3,20] width:65
    spinner spn_mnRotation " Min:  " type:#integer range:[0,(spn_mxRotation.value),0] pos:[110-5+3,40] width:65
    radiobuttons rdi_rotAxis labels:#("X","Y","Z") pos:[91,62] offset:[0,5] default:1
    slider sld_rotate pos:[93,80] \
                      type:#integer range:[-(spn_mxRotation.value),(spn_mxRotation.value),0]\
                      width:95  offset:[0,5]
    
                
        on spn_mxRotation changed value do
        (
            sld_rotate.range = [-(spn_mxRotation.value),(spn_mxRotation.value),0]
            sld_rotate.ticks = 8
        )
        
        on sld_rotate buttonup do
        (
            if selection.count<=1 then 
            (
                messagebox "Please select some objects first."
                sld_rotate.range = [-(spn_mxRotation.value),(spn_mxRotation.value),0]
                sld_rotate.ticks = 8
            )
            else
            (
                if (rdi_rotAxis.state == 1) do
                (
                    coll2 = $
                    arr = coll2 as array
                    for i = 1 to arr.count do
                    (
                        seed (random 1 50000)
                        in coordsys local rotate arr[i] (EulerAngles (random (spn_mnRotation.value) (sld_rotate.value)) 0 0)
                    )
                )
                
                if (rdi_rotAxis.state == 2) do
                (
                    coll2 = $
                    arr = coll2 as array
                    for i = 1 to arr.count do
                    (
                        seed (random 1 50000)
                        in coordsys local rotate arr[i] (EulerAngles 0(random (spn_mnRotation.value) (sld_rotate.value))0)
                    )
                )
                
                if (rdi_rotAxis.state == 3) do
                (
                    coll2 = $
                    arr = coll2 as array
                    for i = 1 to arr.count do
                    (
                        seed (random 1 50000)
                        in coordsys local rotate arr[i] (EulerAngles 0 0 (random (spn_mnRotation.value) (sld_rotate.value)))
                    )
                )
                sld_rotate.range = [-(spn_mxRotation.value),(spn_mxRotation.value),0]
                sld_rotate.ticks = 8
            )
        )
    
    
    hyperLink author "markulie" address:"https://markulie.github.io" color:(color 255 255 255) hovercolor:(color 255 150 255) visitedcolor:(color 255 255 255) align:#center

)
createDialog rltRandomX 180 140