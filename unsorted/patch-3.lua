width=1280
height=720

midi = Midi("controllers/fighter_twister.yml")

print("Loading videos...")
vids = {
    Video("assets/animals/ducks/mobs/Ducks Quacking  - Featuring Mallard Duck, Wigeon, Moorhen, Rook and Mute Swan-SxTn1cNrSgI.mkv", {}),
    Video("assets/animals/ducks/pool/Baby ducks taking a bath-Tqj4zeh3yZ8.mp4", {}),
    Video("assets/animals/ducks/petting/ducks like pets-nosApmDjhBg.webm", {}),
    Video("assets/animals/ducks/petting/Petting a Duck _ May 2019-p0QzaA01pog.mp4", {}),
    Video("assets/animals/ducks/petting/Petting a duck to sleep-OxQuILsDfVs.mp4", {}),
    Video("assets/animals/ducks/ducklings/without-mom/Baby Mallard Ducks in my yard!-DRYog0J8dEY.mp4", {}),
    Video("assets/animals/ducks/ducklings/without-mom/Baby Duck Can't Stay Awake-LGrpsZ7BsQA.mkv", {}),
    Video("assets/animals/ducks/quacking-eating/Flapper, my chatterbox pet duck-qE5t9VZyh_U.mkv", {}),
    Video("assets/animals/ducks/ducks-in-sink/Baby Ducks Diving In The Sink LMAO! p1-HUZFj90KT7c.mkv", {}),
    Video("assets/animals/hedge-hogs/How to Pick Up and Hold a Hedgehog-G1omwD9mpyE.mkv", {}),
    Video("assets/animals/otters/Cute otter asks for head Rubs-LuDQ_c7RLnc.mp4", {}),
    Video("assets/animals/dogs/trampoline/ - Pitbull jumping on trampoline-_FwQTLrX2Pw.mp4", {}),
    Video("assets/animals/bats/eating-fruit/Please don't take my banana away!-WaPXhYaFReY.mp4", {}),
    Video("assets/animals/bats/eating-fruit/Humphrey the bat eats a banana-agvSgtPTw-w.mp4", {}),
    Video("assets/animals/elephants/babies-other/Wild Baby Elephant Funny Playing And Sleeping-azOppe_RJJY.mp4", {}),
    Video("assets/animals/mixed/Pig walking a cat-JlfWbxZZ7sE.mkv", {}),
    Video("assets/animals/racoons/riding-things/Melanie Raccoon riding scooter-5dlIShp87LA.mkv", {}),
    Video("assets/animals/racoons/riding-things/Melanie Raccoon riding bike-side angle-IwtdIXWGry4.mkv", {}),
    Video("assets/animals/racoons/eating/Raccoon eats grapes with his little hands-jyCmnvBbm8Q.mkv", {}),
    Video("assets/animals/colugos/Malayan Colugo - Hindhede Nature Park-ITMSp0PVdIs.webm", {}),
    Video("assets/animals/polar-bears/Polar bears - new cub and mother, in the Ranua Zoo at Lapland in Finland.-HDiZB3mViE4.mp4", {}),
    Video("assets/animals/quokka/Quokkas arrive at Australian Reptile Park-XE3t__2CIn4.mkv", {}),
    Video("assets/processed/animals/tamandua/Hugging a Tamandua-_hap_-8NlvlhfE2h0.mov", {}),
    --Video("assets/processed/animals/alpacas/❤ Cute and Adorable  Baby Alpacas ❤-_hap_-FSKZ4IowkYU.mov", {}),
    --Video("assets/processed/animals/snow-leapords/OMG baby snow leopards!-n8RoLp9WdqA-_hap.mov", {}),
    Video("assets/processed/animals/syngnathiformes/Sea Dragons and Seahorses-fpCQKTJCjSA-_hap.mov", {}),
    Video("assets/animals/cats/torties/Tortie kitten cuteness overload-Z07yExTKCDg.webm", {}),
    Video("assets/animals/cats/torties/Meow Meow Tortie. My Cat 16-IjhlkNmYNoo.mp4", {}),
    Video("assets/animals/cats/torties/Angel (tortie)  @ Kitty City Cat Rescue-jrfVnPjTJzE.mp4", {}),
    Video("assets/animals/cats/torties/Tortie Kitten Wakes Up For Dog Panting & Then Falls Asleep Again - So Tired & Cute-iqwATZTRPCk.mp4", {}),
    Video("assets/animals/cats/roombas/Kittie Coaster! Cat riding a roomba roller coaster!-17zHN3HUoto.mp4", {}),
    Video("assets/animals/cats/roombas/Funny Roomba Cat!!! Rides roomba hoover like a boss-VQ7xraKJ5Ko.mp4", {}),
    Video("assets/animals/cats/roombas/Funny Roomba Cat!!! Rides roomba hoover like a boss!-uGI8Od22WM4.mkv", {}),
    Video("assets/animals/cephalopod/cuttlefish/Cuttlefish - Sepia Apama-qeRpWpiJdwY.mkv", {}),
}
print("Videos loaded!")

function shuffle(tbl)
  math.randomseed(os.time())
  for i = #tbl, 2, -1 do
    local j = math.random(i)
    tbl[i], tbl[j] = tbl[j], tbl[i]
  end
  return tbl
end

assert(#vids > 1)

shuffle(vids)

math.randomseed(os.time())
a_idx = math.random(#vids)
b_idx = math.random(#vids)
while a_idx == b_idx do
    b_idx = math.random(#vids)
end

a_vid = Webcam(1)
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
        print("a -> " .. a_vid)
    elseif control == "bank_1_button_3" then
        invert_band = not invert_band
    elseif control == "bank_1_button_4" then
        swap_band_source = not swap_band_source
    end
end

-- print("a = " .. a_vid)
print("b = " .. b_vid)

passes = 0
invert_band = false
function render()
    params = getControlValues(midi)


    rend("a", "shaders/zoom.glsl", {img0=value(a_vid), amount=value(0.98)})

    rend("b", "shaders/pass.glsl", {img0={input=b_vid}})

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
        mix={input=params.bank_1_knob_7},
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

    rend("fb", "shaders/feedback/implode.glsl", {
         last_out="o",
    })

    copy_into("pre-fb-b", value("b"))

    rend("b", "shaders/mix.glsl", {
        a={input="b"},
        b={input="fb"},
        mix_fade={input=params.bank_1_knob_9}
    })

    rend("b", "shaders/mix.glsl", {
        a=value("b"),
        b=value("pre-fb-b"),
        mix_fade=value("band"),
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
