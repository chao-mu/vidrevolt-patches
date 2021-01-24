width=1280
height=720

midi = Midi("controllers/fighter_twister.yml")

dofile("../lua/util.lua")
dofile("db.lua")

a_vid = Video("assets/animals/free/underwater/Pexels Videos 2558530.mp4-SHRINK-REV.mp4")
b_vid = Video("assets/animals/free/underwater/Video (1).mp4-SHRINK-REV.mp4")

function onControl(device, control, value)
    if value < 0.5 then
        return
    end

    print(control)

    if control == "bank_1_button_1" then
        pipeline_idx  = next_index(pipeline_idx, 1, pipelines)
    end
end

pipeline_idx = 1
function render()
    params = getControlValues(midi)

    copy_into("0", 0)

    local controls = {}
    for i=1,1 do
        for j=1,16 do
            table.insert(controls, params["bank_" .. i .. "_knob_" .. j])
        end
    end

    local calls = pipelines[pipeline_idx]

    for i, call in ipairs(calls) do
        local inputs = call.inputs
        local mix = inputs["mix"]
        if #controls > 0 then
            if type(mix) == "string" then
                local control = table.remove(controls)
                inputs["mix"] = value(mix, control)
            elseif type(mix) == "table" then
                local control = table.remove(controls)
                inputs["mix"].amp = control
            end
        end
    end

    rend_call_stack(calls)
end
