width=640 * 2
height=480 * 2

midi = Midi("controllers/akai-apc40.yml")

vids = {
    Video("assets/80s/misc/Cherry/Flock_DancingCircles.mov", {"mirror"}),
    Video("assets/80s/misc/Cherry/Flock_DrummingBam.mov", {"mirror"}),
    Video("assets/80s/misc/Cherry/Flock_RockingHorse2.mov", {"mirror"}),
    Video("assets/80s/misc/Cherry/Flock_YellowVestDancer.mov", {"mirror"}),
    Video("assets/80s/misc/Cherry/SimpleMinds_Scanner.mov", {"mirror"}),
    Video("assets/80s/misc/Cherry/Flock_GlitchyTorsoDancer.mov", {"mirror"}),
    Video("assets/80s/misc/Cherry/Flock_DancingRED.mov", {"mirror"}),
    Video("assets/80s/misc/Cherry/Flock_DrummingPotsPans.mov", {"mirror"}),
    Video("assets/80s/misc/Cherry/Warrior_NetDancers.mov", {"mirror"}),
    Video("assets/80s/misc/Cherry/SimpleMinds_Scanner2.mov", {"mirror"}),
    Video("assets/80s/misc/Cherry/Flock_HappyTorsoDancer.mov", {"mirror"}),
    Video("assets/80s/misc/Cherry/SimpleMinds_Bass.mov", {"mirror"}),
    Video("assets/80s/misc/Cherry/Warrior_RibbonFaces.mov", {"mirror"}),
    Video("assets/80s/misc/Durian/ABC_BandPlay1.mov", {"mirror"}),
    Video("assets/80s/misc/Durian/NewOrder_TrioRun.mov", {"mirror"}),
    Video("assets/80s/misc/Durian/ABC_BandCircle1.mov", {"mirror"}),
    Video("assets/80s/misc/Durian/NewOrder_TrioDance1.mov", {"mirror"}),
    Video("assets/80s/misc/Durian/ABC_BandPlay2.mov", {"mirror"}),
    Video("assets/80s/misc/Durian/Erasure_RoofGroove1.mov", {"mirror"}),
    Video("assets/80s/misc/Durian/NewOrder_TrioHop.mov", {"mirror"}),
    Video("assets/80s/misc/Durian/NewOrder_PocketShapes.mov", {"mirror"}),
    Video("assets/80s/misc/Durian/Cameo_Cage.mov", {"mirror"}),
    Video("assets/80s/misc/Durian/NewOrder_Slaps.mov", {"mirror"}),
    Video("assets/80s/misc/Durian/ABC_BandFloat.mov", {"mirror"}),
    Video("assets/80s/misc/Durian/NewOrder_MoveScreen.mov", {"mirror"}),
    Video("assets/80s/misc/Durian/NewOrder_SoloRun.mov", {"mirror"}),
    Video("assets/80s/misc/Durian/Cameo_DancingCops.mov", {"mirror"}),
    Video("assets/80s/misc/Durian/Cameo_StrippingCop.mov", {"mirror"}),
    Video("assets/80s/misc/Durian/Erasure_NotWetRainGroove.mov", {"mirror"}),
    Video("assets/80s/misc/Durian/NewOrder_TrioStairHop.mov", {"mirror"}),
    Video("assets/80s/misc/Durian/Cameo_FreakOut.mov", {"mirror"}),
    Video("assets/80s/misc/Durian/Erasure_DanceSweep.mov", {"mirror"}),
    Video("assets/80s/misc/Durian/Cameo_Disco.mov", {"mirror"}),
    Video("assets/80s/misc/Elderberry/BonnieTyler_Greasers.mov", {"mirror"}),
    Video("assets/80s/misc/Elderberry/GraceJones_Locker.mov", {"mirror"}),
    Video("assets/80s/misc/Elderberry/TalkingHeads_SillyWalk.mov", {"mirror"}),
    Video("assets/80s/misc/Elderberry/GraceJones_SuitRun.mov", {"mirror"}),
    Video("assets/80s/misc/Elderberry/Olivia_OliviaandBike.mov", {"mirror"}),
    Video("assets/80s/misc/Elderberry/GraceJones_DotDressTwirl.mov", {}),
    Video("assets/80s/misc/Elderberry/Olivia_HoldingHands.mov", {"mirror"}),
    Video("assets/80s/misc/Elderberry/Wham_BackupSnaps.mov", {"mirror"}),
    Video("assets/80s/misc/Elderberry/GraceJones_CarPalmTrees.mov", {"mirror"}),
    Video("assets/80s/misc/Elderberry/Wham_ChooseLifeShirtDance.mov", {"mirror"}),
    Video("assets/80s/misc/Elderberry/Wham_GoofyDance.mov", {"mirror"}),
    Video("assets/80s/misc/Elderberry/TalkingHeads_BluePopup.mov", {"mirror"}),
    Video("assets/80s/misc/Elderberry/GraceJones_CarYelling.mov", {"mirror"}),
    Video("assets/80s/misc/Elderberry/GraceJones_Clothesline.mov", {"mirror"}),
    Video("assets/80s/misc/Elderberry/GraceJones_CutoutAnimation.mov", {"mirror"}),
    Video("assets/80s/misc/Elderberry/Wham_BlacklightBackups.mov", {"mirror"}),
    Video("assets/80s/misc/Elderberry/Olivia_BikeHunk.mov", {"mirror"}),
    Video("assets/80s/misc/oranges/The Gap Band - You Dropped A Bomb On Me (Official Video)-17lkdqoLt44_x264_005.mov", {"mirror"}),
    Video("assets/80s/misc/oranges/Kylie Minogue - The Loco-motion - Official Video-POWsFzSFLCE_x264.mov", {"mirror"}),
    Video("assets/80s/misc/oranges/The Gap Band - You Dropped A Bomb On Me (Official Video)-17lkdqoLt44_x264_001.mov", {"mirror"}),
    Video("assets/80s/misc/oranges/The Gap Band - You Dropped A Bomb On Me (Official Video)-17lkdqoLt44_x264_003.mov", {"mirror"}),
    Video("assets/80s/misc/oranges/The Gap Band - You Dropped A Bomb On Me (Official Video)-17lkdqoLt44_x264.mov", {"mirror"}),
    Video("assets/80s/misc/oranges/The Power Station - Some Like It Hot-Hw1t7OCESUw_x264_002.mov", {"mirror"}),
    Video("assets/80s/misc/oranges/The Human League - (Keep Feeling) Fascination-QqqBs6kkzHE_x264_002.mov", {"mirror"}),
    Video("assets/80s/misc/oranges/The Human League - (Keep Feeling) Fascination-QqqBs6kkzHE_x264_001.mov", {"mirror"}),
    Video("assets/80s/misc/oranges/The Gap Band - You Dropped A Bomb On Me (Official Video)-17lkdqoLt44_x264_002.mov", {"mirror"}),
    Video("assets/80s/misc/oranges/Depeche Mode - Just Can-t Get Enough (Official Video)-_6FBfAQ-NDE_x264.mov", {"mirror"}),
    Video("assets/80s/misc/oranges/Trans-X - Living On Video (Official Music Video)-b9xBAtCsCTQ_x264_003.mov", {"mirror"}),
    Video("assets/80s/misc/oranges/The Power Station - Some Like It Hot-Hw1t7OCESUw_x264_001.mov", {"mirror"}),
    Video("assets/80s/misc/dj_alone.mov", {"mirror"}),
    Video("assets/80s/misc/Pirateplus3Flags.mov", {"mirror"}), -- cropping may be needed
    --Video("assets/80s/misc/LatexDevilDance3.mov", {"mirror"}), -- black bars on all sides, low quality, but good content
    Video("assets/80s/misc/FeetWalking2.mov", {"mirror"}),
    Video("assets/80s/misc/HandinShirt.mov", {"mirror"}),
    Video("assets/80s/misc/FootballDanceBattle.mov", {"mirror"}),
    Video("assets/80s/misc/LatexDevilDance2.mov", {"mirror"}), -- black bars, but decent quality
    Video("assets/80s/misc/LatexDevilDance4.mov", {"mirror"}), -- black bars, but decent quality
    Video("assets/80s/misc/3PeopleDancingFire2.mov", {"mirror"}),  -- black bars, but decent quality
    Video("assets/80s/misc/3PeopleDancingFire3.mov", {"mirror"}),-- black bars, but decent quality
    Video("assets/80s/misc/PirateplusFlag.mov", {"mirror"}), -- cropping may be needed
    Video("assets/80s/misc/3PeopleDancingFire4.mov", {"mirror"}),  -- black bars
    Video("assets/80s/misc/PurpleRobe6armsdance.mov", {"mirror"}), -- cropping needed
    Video("assets/80s/misc/PopMuzik_dancing.mov", {"mirror"}),
    Video("assets/80s/misc/FeetWalking1.mp4.mov", {"mirror"}),
    Video("assets/80s/misc/3peopleDancingParkingLot.mov", {"mirror"}), -- cropping needed
    Video("assets/80s/misc/FootballDancePartner.mov", {"mirror"}), -- cropping needed
    Video("assets/80s/misc/3PeopleDancingParkingLot2.mov", {"mirror"}),  -- cropping needed
    Video("assets/80s/misc/FootBallManyDancers.mov", {"mirror"}),  -- cropping needed
    Video("assets/80s/misc/purpleRobeDanceinaFrame.mov", {"mirror"}), -- cn
    Video("assets/80s/misc/3PeopleDancingRiverside.mov", {"mirror"}), -- cn  ,
    Video("assets/80s/misc/3PeopleDanceFire.mov", {"mirror"}), -- cn ,
    Video("assets/80s/misc/LatexDevilDance1.mov", {"mirror"}), -- cn ,
    Video("assets/80s/misc/3PeopleDancingFire5.mov", {"mirror"}), -- cn  ,
    Video("assets/80s/misc/3PeopleDancingFire6.mov", {"mirror"}), -- cn  ,
    Video("assets/80s/misc/dj_w_ladies.mov", {"mirror"}),
    Video("assets/80s/Peter Gabriel - Sledgehammer (HD version)-OJWJE0x7T4Q/dancing-chicken.mkv.hap.mov", {"mirror"}),
    Video("assets/80s/Eurythmics - Sweet Dreams (Are Made Of This) (Official Video)-qeMFqkcPYcg/bow.mkv.hap.mov", {"mirror"}),
    Video("assets/80s/Eurythmics - Sweet Dreams (Are Made Of This) (Official Video)-qeMFqkcPYcg/stick-in-hand.mkv.hap.mov", {"mirror"}),
    Video("assets/80s/Eurythmics - Sweet Dreams (Are Made Of This) (Official Video)-qeMFqkcPYcg/mouth-keyboard.mkv.hap.mov", {"mirror"}),
    Video("assets/80s/The B-52's - 'Rock Lobster' (Official Music Video)-ofkzvM7Skxg/lobster-record-player.mkv.hap.mov", {"mirror"}),
    Video("assets/80s/Yazoo - Don't Go-VML1u8KJjEo/walk-by.mkv.hap.mov", {"mirror"}),
    Video("assets/80s/Yazoo - Don't Go-VML1u8KJjEo/pull-lever.mkv.hap.mov", {"mirror"}),
    Video("assets/80s/Yazoo - Don't Go-VML1u8KJjEo/painting.mkv.hap.mov", {"mirror"}),
    Video("assets/80s/Yazoo - Don't Go-VML1u8KJjEo/smokey-science.mkv.hap.mov", {"mirror"}),
    Video("assets/80s/Yazoo - Don't Go-VML1u8KJjEo/keyboard-pressing.mkv.hap.mov", {"mirror"}),
}

logo = Image("assets/houseboi/houseboi-halo-sticker.png")

function shuffle(tbl)
  math.randomseed(os.time())
  for i = #tbl, 2, -1 do
    local j = math.random(i) tbl[i], tbl[j] = tbl[j], tbl[i] end return tbl
end

assert(#vids > 1)

shuffle(vids)

math.randomseed(os.time())
a_idx = math.random(#vids)
b_idx = math.random(#vids)
while a_idx == b_idx do
    b_idx = math.random(#vids)
end

a_vid = vids[a_idx]
b_vid = vids[b_idx]

masks = {
    "shaders/masks/trans-pride.glsl",
    "shaders/masks/gay-pride.glsl",
    "shaders/masks/lesbian-pride.glsl"
}
mask_idx = 1

function onControl(controller, control, value)
    if controller ~= midi then
        return
    end

    if value < 0.5 then
        return
    end

    if control == "cs_1" then
        a_idx = next_index(a_idx, 1, vids)
        a_vid = vids[a_idx]
        print("a: " .. a_vid)
    elseif control == "cs_2" then
        b_idx = next_index(b_idx, 1, vids)
        b_vid = vids[b_idx]
        print("b: " .. b_vid)
    elseif control == "cs_3" then
        b_vid = a_vid
    elseif control == "cs_4" then
        b_vid, a_vid = a_vid, b_vid
    elseif control == "cs_7" then
        a_vid = logo
    elseif control == "cs_8" then
        b_vid = logo
    elseif control == "bank_left" then
        mask_idx = next_index(mask_idx, -1, masks)
    elseif control == "bank_right" then
        mask_idx = next_index(mask_idx, 1, masks)
    end
end

print("a: " .. a_vid)
print("b: " .. b_vid)

function render()
    params = getControlValues(midi)

    rend("a_lum_mask", "shaders/maskify.glsl", {
        img0={input=a_vid},
        lumin_threshold={input=params.fader_2},
        negate={input=1};
    })

    rend("a_lum_mask_2", "shaders/maskify.glsl", {
        img0={input=a_vid},
        lumin_threshold={input=1 - params.fader_3},
    })

    -- Color sin (pre-process)
    rend("a", "shaders/daily/00003.glsl", {
        img0={input=a_vid},
        mix={input=params.tc_1, amp=params.pan},
        time={input=time_param("sin-a", params.tc_5)}
    })

    rend("b", "shaders/daily/00003.glsl", {
        img0={input=b_vid},
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
        mix_fade2={input="a_lum_mask"},
        mix_fade3={input="a_lum_mask_2"},
        mix_bars={input=params.fader_4},
        mix_diff={input=params.fader_5}
    })

    -- Edge detection
    rend("edged", "shaders/edges.glsl", {
        img0={input="o"},
        mix={input=params.dc_1},
        noise={input=params.dc_5},
        thresh={input=params.dc_2},
        negate={input=params.dc_clip}
    })

    -- Reintroduce image
    rend('mag', 'shaders/magnitude.glsl', {img0={input="edged"}})
    rend("o", "shaders/mix.glsl", {
        a={input="edged"},
        b={input="o"},
        mix_fade={input="mag", amp=4 * params.dc_6}
    })

    -- Mask (in an inversion)
    rend("inverted", "shaders/invert.glsl", {img0={input="o"}});
    rend("mask", masks[mask_idx], {})
    rend("o", "shaders/mix.glsl", {
        a={input="o"},
        b={input="inverted"},
        mix_fade={input="mask", amp=params.activator_1}
    })

    -- KScope
    rend("o", "shaders/kscope.glsl", {
        img0={input="o"},
        mix={input=params.dc_3},
        tweak_1={input=params.dc_7},
        center={input="o"}
    });

    -- Mirror Grid
    rend("mirror_mask", "shaders/masks/stripes.glsl", {
        width={input=params.dc_4},
        height={input=params.dc_8},
    });

    -- Mirror
    rend("o", "shaders/mirror.glsl", {
        img0={input="o"},
        mix_x={input={"mirror_mask", "x"}},
        mix_y={input={"mirror_mask", "y"}}
    });

    -- Invert based on image B
    rend("o", "shaders/invert.glsl", {
        img0={input="o"},
        mix={input="b", amp=params.fader_6},
    })

    -- Post color tweak
    rend("o", "shaders/color-tweak.glsl", {
        img0={input="o"},
        gamma_inc={
            input=params.fader_7,
            amp=2
        }
    })

    -- Brighter
    rend("o", "shaders/brighter.glsl", {
        img0={input="o"},
        intensity={input=params.fader_8}
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
