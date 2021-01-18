width=1920
height=1080

midi = Midi("controllers/akai-apc40.yml")

test = false

function make_test()
    return {
        cl_1_1=Video("assets/disco-clips/girls-dancing-2.mkv", {"mirror"}),
        cl_1_2=Video("assets/disco-clips/afrofuturism-dance-trails-black-background_2.mkv", {"mirror"}),
    }
end

function make_disco()
    return {
        cl_1_1=Video("assets/disco/Boney M - Daddy Cool 1976/weird-dancing.mkv", {"mirror"}),
        cl_1_2=Video("assets/disco/Boney M - Daddy Cool 1976/spin.mkv", {"mirror"}),
        cl_1_3=Video("assets/disco/A Taste Of Honey - Boogie Oogie Oogie/guitar-afro-01.mkv", {"mirror"}),
        cl_1_4=Video("assets/disco-clips/sylvester-fan.mkv", {"mirror"}),
        cl_1_5=Video("assets/disco-clips/girls-dancing-2.mkv", {"mirror"}),
        cl_2_1=Video("assets/disco-clips/afrofuturism-dance-trails-black-background_2.mkv", {"mirror"}),
        cl_2_2=Video("assets/disco-clips/disco_balls.mkv", {}),
        cl_2_3=Video("assets/disco-clips/closeup_sequence_sexy.mkv", {}),
        cl_2_4=Video("assets/disco-clips/disco_humping_closeup.mkv", {}),
        cl_2_5=Video("assets/disco/Bee Gees - How Deep Is Your Love (1977)_-XpqqjU7u5Yc/lights-slow.mkv", {}),
        cl_3_1=Video("assets/disco/Bee Gees - How Deep Is Your Love (1977)_-XpqqjU7u5Yc/walking-away-towards-lights.mkv", {}),
        cl_3_2=Video("assets/disco/Bee Gees - How Deep Is Your Love (1977)_-XpqqjU7u5Yc/lights-on-sticks.mkv", {}),
        cl_3_3=Video("assets/disco/Boney M - Daddy Cool 1976/chopping-1.mkv", {}),
        cl_3_4=Video("assets/disco/Gloria Gaynor - I Will Survive/spin-dance.hap.mov", {"mirror"}),
        cl_3_5=Video("assets/disco/Gloria Gaynor - I Will Survive/spin-01.hap.mov", {"mirror"}),
        cl_4_1=Video("assets/disco/Gloria Gaynor - I Will Survive/roller-dance-01.hap.mov", {"mirror"}),
        cl_4_2=Video("assets/disco/Gloria Gaynor - I Will Survive/spin-02.hap.mov", {"mirror"}),
    }
end

function make_animals()
    return {
        cl_1_1=Video("assets/animals/ducks/mobs/Ducks Quacking  - Featuring Mallard Duck, Wigeon, Moorhen, Rook and Mute Swan-SxTn1cNrSgI.mkv", {}),
        cl_1_3=Video("assets/animals/ducks/pool/Baby ducks taking a bath-Tqj4zeh3yZ8.mp4", {}),
        cl_1_4=Video("assets/animals/ducks/petting/ducks like pets-nosApmDjhBg.webm", {}),
        cl_1_5=Video("assets/animals/ducks/petting/Petting a Duck _ May 2019-p0QzaA01pog.mp4", {}),
        cl_2_1=Video("assets/animals/ducks/petting/Petting a duck to sleep-OxQuILsDfVs.mp4", {}),
        cl_2_3=Video("assets/animals/ducks/ducklings/without-mom/Baby Mallard Ducks in my yard!-DRYog0J8dEY.mp4", {}),
        cl_2_4=Video("assets/animals/ducks/ducklings/without-mom/Baby Duck Can't Stay Awake-LGrpsZ7BsQA.mkv", {}),
        cl_2_5=Video("assets/animals/ducks/quacking-eating/Flapper, my chatterbox pet duck-qE5t9VZyh_U.mkv", {}),
        cl_3_1=Video("assets/animals/ducks/ducks-in-sink/Baby Ducks Diving In The Sink LMAO! p1-HUZFj90KT7c.mkv", {}),
        cl_3_2=Video("assets/animals/hedge-hogs/How to Pick Up and Hold a Hedgehog-G1omwD9mpyE.mkv", {}),
        cl_3_3=Video("assets/animals/otters/Cute otter asks for head Rubs-LuDQ_c7RLnc.mp4", {}),
        cl_3_4=Video("assets/animals/dogs/trampoline/ - Pitbull jumping on trampoline-_FwQTLrX2Pw.mp4", {}),
        cl_3_5=Video("assets/animals/bats/eating-fruit/Please don't take my banana away!-WaPXhYaFReY.mp4", {}),
        cl_4_1=Video("assets/animals/bats/eating-fruit/Humphrey the bat eats a banana-agvSgtPTw-w.mp4", {}),
        cl_4_2=Video("assets/animals/elephants/babies-other/Wild Baby Elephant Funny Playing And Sleeping-azOppe_RJJY.mp4", {}),
        cl_4_3=Video("assets/animals/mixed/Pig walking a cat-JlfWbxZZ7sE.mkv", {}),
        cl_4_4=Video("assets/animals/racoons/riding-things/Melanie Raccoon riding scooter-5dlIShp87LA.mkv", {}),
        cl_4_5=Video("assets/animals/racoons/riding-things/Melanie Raccoon riding bike-side angle-IwtdIXWGry4.mkv", {}),
        cl_5_1=Video("assets/animals/racoons/eating/Raccoon eats grapes with his little hands-jyCmnvBbm8Q.mkv", {}),
        cl_5_2=Video("assets/animals/colugos/Malayan Colugo - Hindhede Nature Park-ITMSp0PVdIs.webm", {}),
        cl_5_3=Video("assets/animals/polar-bears/Polar bears - new cub and mother, in the Ranua Zoo at Lapland in Finland.-HDiZB3mViE4.mp4", {}),
        cl_5_4=Video("assets/animals/quokka/Quokkas arrive at Australian Reptile Park-XE3t__2CIn4.mkv", {}),
        cl_5_5=Video("assets/processed/animals/tamandua/Hugging a Tamandua-_hap_-8NlvlhfE2h0.mov", {}),
        cl_6_1=Video("assets/processed/animals/alpacas/❤ Cute and Adorable  Baby Alpacas ❤-_hap_-FSKZ4IowkYU.mov", {}),
        cl_6_2=Video("assets/processed/animals/snow-leapords/OMG baby snow leopards!-n8RoLp9WdqA-_hap.mov", {}),
        cl_6_3=Video("assets/processed/animals/syngnathiformes/Sea Dragons and Seahorses-fpCQKTJCjSA-_hap.mov", {}),
        cl_6_4=Video("assets/animals/cats/torties/Tortie kitten cuteness overload-Z07yExTKCDg.webm", {}),
        cl_6_5=Video("assets/animals/cats/torties/Meow Meow Tortie. My Cat 16-IjhlkNmYNoo.mp4", {}),
        cl_7_1=Video("assets/animals/cats/torties/Angel (tortie)  @ Kitty City Cat Rescue-jrfVnPjTJzE.mp4", {}),
        cl_7_2=Video("assets/animals/cats/torties/Tortie Kitten Wakes Up For Dog Panting & Then Falls Asleep Again - So Tired & Cute-iqwATZTRPCk.mp4", {}),
        cl_7_3=Video("assets/animals/cats/roombas/Kittie Coaster! Cat riding a roomba roller coaster!-17zHN3HUoto.mp4", {}),
        cl_7_4=Video("assets/animals/cats/roombas/Funny Roomba Cat!!! Rides roomba hoover like a boss-VQ7xraKJ5Ko.mp4", {}),
        cl_7_5=Video("assets/animals/cats/roombas/Funny Roomba Cat!!! Rides roomba hoover like a boss!-uGI8Od22WM4.mkv", {}),
        cl_8_1=Video("assets/animals/cephalopod/cuttlefish/Cuttlefish - Sepia Apama-qeRpWpiJdwY.mkv", {}),
    }
end

if (test) then
    disco = make_test()
    animals = disco
else
    disco = make_disco()
    animals = make_animals()
end

media = {
    disco=disco,
    animals=animals
}

masks = {
    "lesb-mask",
    --Image("assets/masks/pumpkin.png"),
    --Image("assets/masks/bat-profile.png"),
    "gay-mask",
    "trans-mask",
}
mask_idx = 1

params = getControlValues(midi)

scene_triggers = {
    cs_6="a",
    cs_7="b",
    cs_8={"a", "b"}
}

bin_triggers = {
    launch_1="disco",
    launch_2="animals"
}

scene_target = "a"
bin_target = "disco"

scene = {a=media[bin_target].cl_1_1, b=media[bin_target].cl_1_2}
function onControl(controller, control, value)
    if controller == midi then
        params[control] = value

        if value[1] < 0.5 then
            return
        end

        local s = scene_triggers[control]
        if s ~= nil then
            scene_target = s
        end

        local b = bin_triggers[control]
        if b ~= nil then
            bin_target = b
        end

        local m = media[bin_target][control]
        if m ~= nil then
            if type(scene_target) == "table" then
                for _, s in ipairs(scene_target) do
                    scene[s] = m
                end
            else
                scene[scene_target] = m
            end
        end
        
        if control == "cs_1" then
            scene.a = random_media("a")
        elseif control == "cs_2" then
            scene.b = random_media("b")
        elseif control == "cs_3" then
            scene.a = random_media("a")
            scene.b = random_media("b")
        elseif control == "cs_4" then
            cur_a = scene.a
            cur_b = scene.b
            scene.a = cur_b
            scene.b = cur_a
        end

        if control == "bank_left" then
            mask_idx = next_index(mask_idx, -1, masks)
        elseif control == "bank_right" then
            mask_idx = next_index(mask_idx, 1, masks)
        end
    end
end

time_params = {}
function time_param(key, speed)
    if time_params[key] ~= nil then
        time_params[key] = time_params[key] + time_delta * speed[1]
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

previous_media = {}
function random_media(s)
    if previous_media[bin_target] == nil then
        previous_media[bin_target] = {}
    end
    if previous_media[bin_target][s] == nil then
        previous_media[bin_target][s] = {}
    end    
    
    prev = previous_media[bin_target][s]
    
    local all_keys = {}
    local candidates = {}
    for k in pairs(media[bin_target]) do
        if prev[k] == nil then
            table.insert(candidates, k)
        end
        
        table.insert(all_keys, k)
    end
    
    if #candidates == 0 then
        candidates = all_keys
        previous_media[bin_target][s] = {}
    end
    
    local m_key = candidates[math.random(#candidates)]
    previous_media[bin_target][s][m_key] = true
    
    return media[bin_target][m_key]
end

function render()
    -- t = math.sin(time_ms / 1000) * .5 + .5

    -- Color sin (pre-process)
    rend("a", "shaders/daily/00003.glsl", {
        img0={input=scene.a},
        mix={input=params.tc_1, amp=params.pan},
        time={input=time_param("sin-a", params.tc_5)}
    })

    rend("b", "shaders/daily/00003.glsl", {
        img0={input=scene.b},
        mix={input=params.tc_2, amp=params.send_a},
        time={input=time_param("sin-b", params.tc_6)}
    })

    -- Rainbow Band (pre-process)
    rend("a", "shaders/rainbow-band.glsl", {
        img0={input="a"},
        mix={input=params.tc_3, amp=params.send_b},
        time={input=time_param("rb-a", params.tc_7)}
    })

    rend("b", "shaders/rainbow-band.glsl", {
        img0={input="b"},
        mix={input=params.tc_4, amp=params.send_c},
        time={input=time_param("rb-b", params.tc_8)}
    })

    -- Knot (pre-process)
    rend("a", "shaders/knoty.glsl", {
        img0={input="a"},
        mix={input=params.dc_2, amp=params.dc_on_off}
    })

    rend("b", "shaders/knoty.glsl", {
        img0={input="b"},
        mix={input=params.dc_6, amp=params.dc_on_off}
    })

    -- Mix!
    rend("o", "shaders/mix.glsl", {
        a={input="a"},
        b={input="b"},
        mix_fade={input=params.fader_1},
        mix_lumin_a={input=params.fader_2},
        mix_lumin_b={input=params.fader_3},
        mix_bars={input=params.fader_4},
        mix_diff={input=params.fader_5}
    })

    -- Edge Detection
    rend("o", "shaders/edges.glsl", {
        img0={input="o"},
        mix={input=params.dc_1, amp=params.dc_clip},
        noise={input=params.fader_7}
    })

    -- Mask
    rend("trans-mask", "shaders/masks/trans-pride.glsl", {})
    rend("gay-mask", "shaders/masks/gay-pride.glsl", {})
    rend("lesb-mask", "shaders/masks/lesbian-pride.glsl", {})
    rend("o", "shaders/mask.glsl", {
        img0={input="o"},
        mask={input=masks[mask_idx]},
        mix={input=params.dc_5}
    });

    -- KScope (post-process)
    rend("o", "shaders/kscope.glsl", {
        img0={input="o"},
        mix={input=params.dc_3, amp=params.dc_left},
        tweak_1={input=params.dc_7}
    });

    -- Mirror Grid
    rend("mirror_mask", "shaders/masks/stripes.glsl", {
        width={input=params.dc_4, amp=params.dc_right},
        height={input=params.dc_8, amp=params.dc_right},
    });

    rend("o", "shaders/mirror.glsl", {
        img0={input="o"},
        mix_x={input={"mirror_mask", "x"}},
        mix_y={input={"mirror_mask", "y"}}
    });

    rend("o", "shaders/color-tweak.glsl", {
        img0={input="o"},
        gamma_inc={
            input=params.fader_8,
            amp=2
        }
    })

    -- Box in
    rend("o", "shaders/boxin.glsl", {
        img0={input="o"},
        shrink={input=params.fader_master}
    });

    -- Fade to black
    rend("o", "shaders/mix.glsl", {
        a={input="o"},
        b={input=0},
        mix_fade={input=params.cross_fade}
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
