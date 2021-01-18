width=1920
height=1080

vid = Video("assets/pexels/cats/production ID_3869112.downsized.mp4")

ChaosMonkey = {}
function ChaosMonkey.new(output_count, initial_sources)
    self = {}
    self.initial_sources = initial_sources
    self.output_count = outputs

    self.destinations = {}
    for i=1,output_count do
        table.insert(self.destinations, "ChaosMonkey:dest-" ..  math.random() .. "-" .. i)
    end

    self.write_record = {}
    self.written_destinations = {}

    self.rand_stack = {}
    self.rand_index = 1

    function self:random()
        if self.rand_index > #self.rand_stack then
            table.insert(self.rand_stack, math.random())
        end

        local rand = self.rand_stack[self.rand_index]
        self.rand_index = self.rand_index + 1

        return rand
    end

    function self:random_element(arr)
        return arr[math.floor(#arr * self:random() + 1)]
    end

    function self:dest()
        local d = self:random_element(self.destinations)

        if self.write_record[d] == nil then
            table.insert(self.written_destinations, d)
            self.write_record[d] = d
        end

        print("destination: " .. d)

        return d
    end

    function self:src()
        local src = nil

        if #self.written_destinations > 0 and self:random() > 0.5 then
            src = self:random_element(self.written_destinations)
        else
            src = self:random_element(initial_sources)
        end

        print("source: " .. src)

        return src
    end

    function self:start()
        self.rand_index = 1
    end

    return self
end

cm = ChaosMonkey.new(2, {vid})
function render()
    cm:start()

	rend(cm:dest(), "shaders/pass.glsl", {
        img0=cm:src(),
	})

    rend(cm:dest(), "shaders/band.glsl", {
        img0=cm:src(),
        mix=1,
        bands=2,
        target=time_ms * 0.0005,
    })

    rend(cm:dest(), "shaders/flip-vertical.glsl", {
        img0=cm:src(),
        mix=cm:src(),
    })
end
