width=1280
height=720

midi = Midi("controllers/fighter_twister.yml")

dofile("../lua/util.lua")
dofile("db.lua")

a_vid = Video("assets/animals/free/underwater/Pexels Videos 2558530.mp4-SHRINK-REV.mp4")
b_vid = Video("assets/animals/free/underwater/Video (1).mp4-SHRINK-REV.mp4")

disable = {}
function onControl(device, control, value)
    if value < 0.5 then
        return
    end

    disable[control] = not disable[control]

    if control == "bank_1_button_1" then
        --pipeline_idx  = next_index(pipeline_idx, 1, pipelines)
    end
end

pipeline_idx = 1
function render()
    params = getControlValues(midi)

    copy_into("0", 0)

    local controls = {}
    for i=1,4 do
        for j=1,16 do
    --        table.insert(controls, params["bank_" .. i .. "_knob_" .. j])
            local v = 1
            if disable["bank_" .. i .. "_button_" .. j] then
                v = 0
            end

            table.insert(controls, v)
        end
    end

    local calls = pipelines[pipeline_idx]

    local new_calls = {}

    local mixables = 0
    for i, call in ipairs(calls) do
        local control = table.remove(controls)
        if control > 0.5 then
            table.insert(new_calls, call)
        end
    end

    rend_call_stack(new_calls)
end
