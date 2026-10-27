package main

/*
PROGRAMMER REMEMBER!!!
Local/Global vars - snake_case
Procedures - snake_case
Structs/Enums - Ada_Case
Enum values/variants - Ada_Case
Const - SCREAMING_SNAKE_CASE
Imports - snake_case

public - snake_case
private - _snake_case (_ on beginning)
*/

import r "vendor:raylib"
import f "core:fmt"

_elapsed_time: f32 = 0.0
_frame_rate:   f32 = 0.1 

box := Dialogue_Box { 
    lines = []string {
            "Eine test linen!",
            "Du will dich shooten in ze mouthen!!",
            "Das gamen ist fakin testen! Get a load at this!",
        },
    char = Character_Name.TEST
}

bg := Background {
    background_name = Background_List.TEST,
    pos = r.Vector2{0, 0},
}

init_and_load :: proc() {
    sprite_load(&player.sprites, "data/testChar.png")
    background_load(&bg)
    ui_load(&player)
    dialogue_box_load(&box)
}

section_logic :: proc() {

    sprite_timer_go(&player.sprites)
    camera.target = r.Vector2{ player.pos.x + 20, player.pos.y + 20}
}

section_draw :: proc() {
    screen_w := f32(SCREEN_WIDTH)
    screen_h := f32(SCREEN_HEIGHT)
    
    pos_x := screen_w / 2
    pos_y := screen_h / 2


    r.BeginMode2D(camera)
        background_draw(&bg)
        player_move_and_draw()
    r.EndMode2D()

    dialogue_box_draw(&box)
    ui_draw()


}