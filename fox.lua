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
