width=1280
height=720

loaded = false
function render()
    copy_into("o", 1)
    copy_into("aux", 1)

    if not loaded then
        loaded = true
        print("loaded!")
    end
end

function copy_into(dest, source)
    rend(dest, "shaders/pass.glsl", { img0=source })
end
