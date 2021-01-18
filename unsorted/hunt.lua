width=1280
height=720

dofile("../lua/ChaosMonkey.lua")
dofile("../lua/util.lua")

--midi = Midi("controllers/fighter_twister.yml")

kb = Keyboard()

a_vid = Video("assets/animals/free/underwater/Pexels Videos 2558530.mp4-SHRINK-REV.mp4")
b_vid = Video("assets/animals/free/underwater/Video (1).mp4-SHRINK-REV.mp4")

effects = {}
effects["shaders/pixelate.glsl"] = {"img0", "mix"}
effects["shaders/explode.glsl"] = {"img0", "mix"}
effects["shaders/mix_fade.glsl"] = {"b", "a", "mix"}
effects["shaders/rainbow-band.glsl"] = {"img0", "time", "mix"}
effects["shaders/pass.glsl"] = {"img0"}
effects["shaders/mask.glsl"] = {"img0", "mix", "mask"}
effects["shaders/rgb_to_hsv.glsl"] = {"rgb"}
-- More investigation needed
 effects["shaders/fake-3d.glsl"] = {"img0", "scale", "depth"}
effects["shaders/filter-whites.glsl"] = {"img0", "thresh"}
effects["shaders/color_02.glsl"] = {"img0", "mix"}
effects["shaders/color_01.glsl"] = {"img0", "mix"}
effects["shaders/flowing_noise.glsl"] = {"time"}
effects["shaders/white-to-black.glsl"] = {"img0"}
effects["shaders/invert.glsl"] = {"mix", "img0"}
effects["shaders/video-wall.glsl"] = {"img0", "mix", "min_brightness", "boxes"}
effects["shaders/zoom.glsl"] = {"img0", "amount"}
effects["shaders/blur.glsl"] = {"img0", "mix"}
effects["shaders/text-surround.glsl"] = {"text0", "img0", "speed"}
effects["shaders/rotate.glsl"] = {"img0", "speed"}
-- due to inputs that expect > 1 values, may cause issues in certain combinations
  effects["shaders/band.glsl"] = {"img0", "target", "mix", "bands"}
-- Commented out due to blank screens it generates on occasion. Possibly due to sensitivity of "intensity"
 effects["shaders/brighter.glsl"] = {"img0", "intensity"}
effects["shaders/edges.glsl"] = {"img0", "noise", "thresh", "mix", "negate"}
effects["shaders/negate.glsl"] = {"img0"}
effects["shaders/displace_by_rgb.glsl"] = {"img0", "mix"}
effects["shaders/band_mix.glsl"] = {"reference", "b", "a", "time", "mix", "bands"}
effects["shaders/mix.glsl"] = {"b", "a", "mix_lumin_b", "mix_lumin_a", "mix_fade3", "mix_fade2", "mix_fade", "mix_diff", "mix_bars"}
effects["shaders/displace_by_lum.glsl"] = {"img0", "mix"}
effects["shaders/kscope.glsl"] = {"img0", "center", "tweak_1", "mix"}
effects["shaders/color-tweak.glsl"] = {"img0", "gamma_inc", "gamma_dec", "gamma", "contrast_inc", "contrast_dec", "contrast", "brightness", "split"}
effects["shaders/flip.glsl"] = {"img0", "mix"}
effects["shaders/rgb.glsl"] = {"red", "green", "blue"}
effects["shaders/delay.glsl"] = {"img0", "mix"}
effects["shaders/displace_rgb.glsl"] = {"img0", "mix"}
effects["shaders/hsv_to_rgb.glsl"] = {"hsv"}
effects["shaders/test.glsl"] = {"img0", "blue"}
effects["shaders/flip-vertical.glsl"] = {"img0", "mix"}
effects["shaders/lums.glsl"] = {"img0"}
effects["shaders/magnitude.glsl"] = {"img0"}
effects["shaders/rotate-corners.glsl"] = {"img0"}
effects["shaders/negative.glsl"] = {"img0", "mix"}
effects["shaders/boxin.glsl"] = {"img0", "shrink"}
effects["shaders/knoty.glsl"] = {"img0", "mix"}
effects["shaders/move.glsl"] = {"img0", "offset_y", "offset_x"}
effects["shaders/maskify.glsl"] = {"img0", "lumin_threshold", "negate"}
effects["shaders/daily/00002.glsl"] = {"img0", "mix", "contrast"}
effects["shaders/feedback/explode.glsl"] = {"last_out"}
effects["shaders/daily/00003.glsl"] = {"img0", "time", "mix"}
effects["shaders/feedback/blackbar-exploder.glsl"] = {"last_out", "img0", "vertical"}
effects["shaders/masks/stripes.glsl"] = {"width", "height"}
effects["shaders/daily/00005.glsl"] = {"img0", "time", "mix"}
effects["shaders/daily/00006.glsl"] = {"b", "a", "mix"}
effects["shaders/feedback/implode.glsl"] = {"last_out"}
effects["shaders/masks/spiral.glsl"] = {"speed", "balance"}

elevate = false
function onControl(controller, control, value)
    if value < 0.5 then
        return
    end

    if control == "s" then
        should_print_pipeline = true
    elseif control == "e" then
        elevate = true
    elseif control == "space" and not elevate then
        pipeline = Pipeline.new("monitor")
    elseif control == "n" then
        pipeline:next_dest()
    end
end

pipeline = Pipeline.new("present")

should_print_pipeline = false
transition = 0
function render()
    --params = getControlValues(midi)

    rend_call_stack(pipeline:rend_calls())

    if should_print_pipeline then
        pipeline:print_lua()
        should_print_pipeline = false
    end
end

-- https://stackoverflow.com/questions/9168058/how-to-dump-a-table-to-console
function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

