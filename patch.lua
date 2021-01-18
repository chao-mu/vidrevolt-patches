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
        pipeline_monitor = Pipeline.new("monitor")
    elseif control == "n" then
        pipeline_monitor:next_dest()
    end
end

function tween_pipeline(a_calls, b_calls, v)
    assert(#a_calls <= #b_calls)

    local last_b, last;
    for i=1,#a_calls do
        a = a_calls[i]
        b = b_calls[i]

        rend(b.dest, b.shader, b.inputs)
        rend(a.dest, a.shader, a.inputs)
        last = rend(a.dest, "shaders/mix_fade.glsl", {
            a=a.dest,
            b=b.dest,
            mix=v,
        })

        last_b = b.dest
    end

    return {tweened=last, b=last_b}
end

Pipeline = {}
function Pipeline.new(prefix, shaders, rand_stack)
    local self = {}

    self.dest_idx = 1

    if shaders == nil then
        shaders = {}
        for key, params in pairs(effects) do
            table.insert(shaders, key)
        end

        shuffle(shaders)
    end

    self.shaders = shaders

    local cm = ChaosMonkey.new(rand_stack)
    cm:start()

    cm:add_copy_into(cm:dest(prefix .. "_a"), a_vid)
    cm:add_copy_into(cm:dest(prefix .. "_b"), b_vid)
    cm:add_copy_into(cm:dest(prefix .. "_c"), 0)
    cm:add_copy_into(cm:dest(prefix .. "_d"), 0)

    for i, shader in pairs(shaders) do
        cm:add_rend(cm:dest(), shader, effects[shader])
    end

    self.cm = cm

    function self:clone(prefix)
        local p = Pipeline.new(prefix, self.shaders, self.cm.rand_stack)

        p.dest_idx = self.dest_idx

        return p
    end

    function self:rend_calls()
        local calls = {}
        for i, call in ipairs(self.cm.pipeline) do
            calls[i] = call
        end

        local dest = cm.destinations[self.dest_idx]
        table.insert(calls, {shader="shaders/pass.glsl", dest=dest, inputs={img0=dest}})

        return calls
    end

    function self:print_lua()
        for i, call in ipairs(self:rend_calls()) do
            print_rend_call(call)
        end
    end

    function self:print_for_bulk()
        print("pipelines[#pipelines + 1] = {")
        for i, call in ipairs(self:rend_calls()) do
            local inputs = ""
            for name, value in pairs(call.inputs) do
                inputs = inputs .. name .. '="' .. value .. '", '
            end

            print('    { dest="' .. call.dest .. '", shader="' .. call.shader ..
                '", inputs={ ' .. inputs .. '}},')
        end

        print ("}\n")
    end

    function self:next_dest()
        self.dest_idx = next_index(self.dest_idx, 1, self.cm.destinations)
    end

    return self
end

pipeline_monitor = Pipeline.new("monitor")
pipeline_present = Pipeline.new("present")

should_print_pipeline = false
transition = 0
function render()
    --params = getControlValues(midi)

    if elevate then
        transition = transition + time_delta * 0.3
    end

    if transition > 1 then
        elevate = false
        transition = 0
        pipeline_present = pipeline_monitor:clone("present")
        pipeline_monitor = Pipeline.new("monitor")
    end

    outs = tween_pipeline(
        pipeline_present:rend_calls(),
        pipeline_monitor:rend_calls(),
        transition
    )

    copy_into("aux", outs.b)
    copy_into("o", outs.tweened)

    if should_print_pipeline then
        pipeline_present:print_lua()
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

