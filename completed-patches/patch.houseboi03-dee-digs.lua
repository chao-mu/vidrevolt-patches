width=1280
height=720

midi = Midi("controllers/fighter_twister.yml")

print("Loading vids..")
vids = {
    Video("assets/pexels/flowers-butterflies-etc/Pexels Videos 2616619.mp4-SHRINK-REV.mp4"),
    Video("assets/pexels/flowers-butterflies-etc/Pexels Videos 3617.mp4-SHRINK-REV.mp4"),
    Video("assets/pexels/flowers-butterflies-etc/Pexels Videos 2616637.mp4-SHRINK-REV.mp4"),
    Video("assets/pexels/flowers-butterflies-etc/Pexels Videos 2355058.mp4-SHRINK-REV.mp4"),
    Video("assets/pexels/flowers-butterflies-etc/Pexels Videos 3772.mp4-SHRINK-REV.mp4"),
    Video("assets/pexels/snails/Video Of Snail Moving.mp4-SHRINK-REV.mp4"),
    Video("assets/pexels/flowers-butterflies-etc/Pexels Videos 1433307 (1).mp4-SHRINK-REV.mp4"),
    Video("assets/pexels/flowers-butterflies-etc/Pexels Videos 1779441.mp4-SHRINK-REV.mp4"),
    Video("assets/pexels/flowers-butterflies-etc/Video Of Flower Blooming.mp4-SHRINK-REV.mp4"),
    Video("assets/pexels/flowers-butterflies-etc/Pexels Videos 2686405.mp4-SHRINK-REV.mp4"),
    Video("assets/pexels/flowers-butterflies-etc/Video Of Butterfly On A Flower.mp4-SHRINK-REV.mp4"),
    Video("assets/pexels/snails/Pexels Videos 1508544.mp4-SHRINK-REV.mp4"),
    Video("assets/pexels/flowers-butterflies-etc/Pexels Videos 1433307.mp4-SHRINK-REV.mp4"),
    Video("assets/pexels/flowers-butterflies-etc/Butterflies On The Ground.mp4-SHRINK-REV.mp4"),
    Video("assets/pexels/flowers-butterflies-etc/Pexels Videos 3452.mp4-SHRINK-REV.mp4"),
    Video("assets/pexels/snails/production ID_4782179.mp4-SHRINK-REV.mp4"),
}
print("Videos loaded.")

masks = {
    "shaders/masks/trans-pride.glsl",
    "shaders/masks/gay-pride.glsl",
    "shaders/masks/lesbian-pride.glsl"
}
mask_idx = 1

function shuffle(tbl)
  math.randomseed(os.time())
  for i = #tbl, 2, -1 do
    local j = math.random(i)
    tbl[i], tbl[j] = tbl[j], tbl[i]
  end
  return tbl
end

assert(#vids > 1)

--shuffle(vids)


main_vid = Video("assets/non-free/Houseboi 2021 set DD .mp4")

--a_vid = main_vid
a_vid = nil

math.randomseed(os.time())
b_idx = math.random(#vids)
b_vid = vids[b_idx]

swap_band_source = false

function onControl(controller, control, value)
    if controller ~= midi then
        return
    end

    if value < 0.5 then
        return
    end

    if control == "bank_1_button_1" then
        b_idx = next_index(b_idx, 1, vids)
        b_vid = vids[b_idx]
        print("b -> " .. b_vid)
    elseif control == "bank_1_button_2" then
        invert_band = not invert_band
    elseif control == "bank_1_button_3" then
        swap_band_source = not swap_band_source
    elseif control == "bank_1_button_9" then
        mask_idx = next_index(mask_idx, 1, masks)
    elseif control == "bank_1_button_16" then
        a_vid = main_vid
        playAudio("assets/non-free/Houseboi 2021 set DD .wav")
    end
end

-- print("a = " .. a_vid)
print("b = " .. b_vid)

passes = 0
invert_band = false
function render()
    params = getControlValues(midi)

    if passes == 2 then
    end

    rend("a", "shaders/zoom.glsl", {img0=value(a_vid), amount=value(0.98)})

    -- a minimal a to mix in at the end of the set.
    rend("minimal-a", "shaders/edges.glsl", {
        img0="a",
        mix=0.23,
    })


    rend("b", "shaders/pass.glsl", {img0={input=b_vid}})

    -- TODO: Consider Reorganize so it's all A effects then all B effects with mixing a into B in the middle

    --
    -- Calculate bands
    --

    rend("band-a", "shaders/band.glsl", {
        img0   = value("a"),
        target = params.bank_1_knob_12,
        mix    = value(1),
    });

    band_source = "b"
    if swap_band_source then
        band_source = "a"
    end

    rend("band", "shaders/band.glsl", {
        img0   = band_source,
        target = value(6, params.bank_1_knob_3),
        mix    = value(1),
    });

    rend("band-neg", "shaders/invert.glsl", {
        img0 = value("band"),
        mix  = value(1),
    })

    -- Swap bands when requested
    rend("band", "shaders/mix.glsl", {
        a="band",
        b="band-neg",
        mix_fade=invert_band,
    })

    rend("band-neg", "shaders/invert.glsl", {
        img0 = value("band"),
        mix  = value(1),
    })

    baseline_edge = 0.15
    if params.bank_1_knob_5 > 0.001 then
        baseline_edge = 0
    end

    rend("b", "shaders/edges.glsl", {
        img0="b",
        mix=baseline_edge,
    })

    -- Mix b into a
    rend("b", "shaders/mix.glsl", {
        a        = value("a"),
        b        = value("b"),
        mix_fade = value(params.bank_1_knob_2),
    })

    rend("mask", masks[mask_idx], {})

    -- KScope
    rend("mask", "shaders/kscope.glsl", {
        img0={input="mask"},
        tweak_1={input=params.bank_2_knob_2},
        mix=1,
    });

    rend("b", "shaders/mix.glsl", {
        a        = "b",
        b        = "mask",
        mix_fade = params.bank_2_knob_3,
    })

    --
    -- Layer effects
    --

    -- Displace by luminance
    rend("b", "shaders/displace_by_lum.glsl",  {
        img0 = "b",
        mix = params.bank_1_knob_15,
    })

    -- Edge detection
    rend("a", "shaders/edges.glsl", {
        img0={input="a"},
        mix={input=params.bank_1_knob_7, shift=0.23},
    })

    -- Rainbow Band
    rend("b", "shaders/rainbow-band.glsl", {
        img0={input="b"},
        mix={input=params.bank_1_knob_5},
        time={input=t("rb-b", 0.15)}
    })

    -- HSV Mix in
    rend("b_hsv", "shaders/rgb_to_hsv.glsl", {
        rgb="b",
    })

    rend("b", "shaders/mix.glsl", {
        a = "b",
        b = "b_hsv",
        mix_fade=params.bank_1_knob_6
    })

    -- Edge detection
    rend("b", "shaders/edges.glsl", {
        img0={input="b"},
        mix={input=params.bank_1_knob_8},
    })

    -- Reflect (vertical)
    rend("b", "shaders/flip-vertical.glsl", {
        img0={input="b"},
        mix={input=params.bank_1_knob_10},
    });


    -- Reflect (horizontal)
    rend("b", "shaders/flip.glsl", {
        img0={input="b"},
        mix={input=params.bank_1_knob_14},
    });

    -- Premixing to avoid flashing
    rend("a", "shaders/mix.glsl", {
        a={input="a"},
        b={input="b"},
        mix_diff={input=params.bank_1_knob_1}
    })

    --
    -- Feedback effects
    --
    rend("fb", "shaders/feedback/explode.glsl", {
         last_out="o",
    })

    copy_into("pre-fb-a", value("a"))

    rend("a", "shaders/mix.glsl", {
        a={input="a"},
        b={input="fb"},
        mix_fade={input=params.bank_1_knob_11}
    })

    rend("a", "shaders/mix.glsl", {
        a=value("a"),
        b=value("pre-fb-a"),
        mix_fade=value("band-a"),
    })

    --
    -- Mix!
    --
    rend("o", "shaders/mix.glsl", {
        a={input="a"},
        b={input="b"},
        mix_fade=value("band")
    })

    copy_into("black", 0)

    rend("o", "shaders/mix.glsl", {
        a="o",
        b="black",
        mix_fade=value("band-neg", params.bank_1_knob_4),
    })

--
--    rend("o", "shaders/mix.glsl", {
--        a="o",
--        b=0,
--        mix_fade=value("band-neg", params.bank_1_knob_4)
--    })
--
    --
    -- Mix original for ending
    --
    -- KScope
    rend("o", "shaders/kscope.glsl", {
        img0={input="o"},
        tweak_1=params.bank_2_knob_2,
        mix={input=params.bank_2_knob_1},
    });

    rend("final", "shaders/mix.glsl", {
        a={input="o"},
        b={input="minimal-a"},
        mix_fade={input=1 - params.bank_1_knob_16},
    })

    --copy_into("o", "b")
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
function t(key, speed)
    if time_params[key] ~= nil then
        time_params[key] = time_params[key] + time_delta * speed
    else
        time_params[key] = 0
    end

    return time_params[key]
end

function value(input, amp, shift)
    amp = amp or 1
    input = input or 1
    shift = shift or shift

    return {input=input, amp=amp, shift=shift}
end


function next_index(i, diff, arr)
    local new = i + diff - 1
    if new < 0 then
        new = new + #arr
    end

    new = new % #arr

    return new + 1
end

function copy_into(dest, source)
    rend(dest, "shaders/pass.glsl", { img0=source })
end
