width=640 * 2
height=480 * 2

midi = Midi("controllers/fighter_twister.yml")

function onControl(controller, control, value)
    if controller ~= midi then
        return
    end

    if value < 0.5 then
        return
    end

    if control == "bank_1_button_16" then
        print("Playing!")
        a_vid = Video("assets/satan-santa/GodDeckYeTiming2020.mp4")
        playAudio("assets/audio/God Deck Ye Merry Jinglemen.wav")
        b_vid = a_vid
    end
end

function render()
    params = getControlValues(midi)

    rend("b", "shaders/feedback/00001.glsl", {
        ingest={input=1},
        img0={input=b_vid},
    });

    rend("a_lum_mask", "shaders/maskify.glsl", {
        img0={input="b"},
        lumin_threshold={input=params.bank_1_knob_3},
        negate={input=1};
    })

    rend("a_lum_mask_2", "shaders/maskify.glsl", {
        img0={input=b_vid},
        lumin_threshold={input=1 - params.bank_1_knob_2},
    })

    -- Rainbow Band (pre-process)
    rend("a", "shaders/rainbow-band.glsl", {
        img0={input=a_vid},
        mix={input=params.bank_1_knob_5},
        time={input=time_param("rb-a", params.bank_1_knob_6)}
    })

    rend("b", "shaders/rainbow-band.glsl", {
        img0={input=b_vid},
        mix={input=params.bank_1_knob_7},
        time={input=time_param("rb-b", params.bank_1_knob_8)}
    })

    -- Edge detection
    rend("edged", "shaders/edges.glsl", {
        img0={input="a"},
        mix={input=params.bank_1_knob_9},
        noise={input=params.bank_1_knob_10},
        thresh={input=params.bank_1_knob_11},
    })

    -- Reintroduce image
    rend('mag', 'shaders/magnitude.glsl', {img0={input="edged"}})
    rend("a", "shaders/mix.glsl", {
        a={input="edged"},
        b={input="a"},
        mix_fade={input="mag", amp=4 * params.bank_1_knob_12}
    })

    -- Edge detection
    rend("edged", "shaders/edges.glsl", {
        img0={input="b"},
        mix={input=params.bank_1_knob_13},
        noise={input=params.bank_1_knob_14},
        thresh={input=params.bank_1_knob_15},
    })

    -- Reintroduce image
    rend('mag', 'shaders/magnitude.glsl', {img0={input="edged"}})
    rend("b", "shaders/mix.glsl", {
        a={input="edged"},
        b={input="b"},
        mix_fade={input="mag", amp=4 * params.bank_1_knob_16}
    })

    -- Feedback
    out = "a"
    if params.bank_1_button_1 > 0.5 then
        out = rend("feedback", "shaders/feedback/00001.glsl", {
            ingest={input=0},
            last_out={input="o"}
        });
    end

    --
    -- Mix!
    --

    rend("o", "shaders/band_mix.glsl", {
        a={input=out},
        b={input="b"},
        reference={input=a_vid},
        time={input=time_param("bm", 0.25)},
        mix={input=params.bank_1_knob_4}
    });

    rend("o", "shaders/mix.glsl", {
        a={input="o"},
        b={input="b"},
        mix_fade2={input="a_lum_mask"},
        mix_fade3={input="a_lum_mask_2"},
        mix_diff={input=params.bank_1_knob_1}
    })

end

-- https://stackoverflow.com/questions/9168058/how-to-dump-a-table-to-console
--function dump(o)
--   if type(o) == 'table' then
--      local s = '{ '
--      for k,v in pairs(o) do
--         if type(k) ~= 'number' then k = '"'..k..'"' end
--         s = s .. '['..k..'] = ' .. dump(v) .. ','
--      end
--      return s .. '} '
--   else
--      return tostring(o)
--   end
--end

time_params = {}
function time_param(key, speed)
    if time_params[key] ~= nil then
        time_params[key] = time_params[key] + time_delta * speed
    else
        time_params[key] = 0
    end

    return time_params[key]
end

function next_index(i, diff, arr)
    local new = i + diff - 1
    if new < 0 then
        new = new + #arr
    end

    new = new % #arr

    return new + 1
end
