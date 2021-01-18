width=1280
height=720

kb = Keyboard()

dofile("../lua/util.lua")
dofile("db.lua")

a_vid = Video("assets/animals/free/underwater/Pexels Videos 2558530.mp4-SHRINK-REV.mp4")
b_vid = Video("assets/animals/free/underwater/Video (1).mp4-SHRINK-REV.mp4")

function onControl(device, control, value)
    if value < 0.5 then
        return
    end

    print(control)

    if control == "n" then
        pipeline_idx  = next_index(pipeline_idx, 1, pipelines)
    end
end

pipeline_idx = 1
function render()
    copy_into("0", 0)

    rend_call_stack(pipelines[pipeline_idx])
end
