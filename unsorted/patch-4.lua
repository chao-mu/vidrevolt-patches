width=1280
height=720

vid_a = Video("assets/animals/cats/torties/Tortie Kitten Wakes Up For Dog Panting & Then Falls Asleep Again - So Tired & Cute-iqwATZTRPCk.mp4")
vid_b = Video("assets/animals/cats/roombas/Kittie Coaster! Cat riding a roomba roller coaster!-17zHN3HUoto.mp4")
vid_c = Video("assets/animals/ducks/ducklings/without-mom/Baby Mallard Ducks in my yard!-DRYog0J8dEY.mp4")


function render()
    rend("band", "shaders/band.glsl", {
        img0=vid_a,
        target=4,
        bands=6,
        mix=1,
    })

    rend("o", "shaders/mix.glsl", {
        a=vid_a,
        b=vid_b,
        mix_fade="band",
    })
end
