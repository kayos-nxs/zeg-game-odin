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

Animation :: struct {
    start_frame: i32,
    end_frame:   i32,
    frame_rate:  f32,
}

Sprite :: struct {
    tex:           r.Texture2D,
    frame_size:    r.Vector2,
    frames_wide:   i32,
    origin:        r.Vector2,
    frame:         i32,
    current_anim:  Animation,
    _elapsed_time: f32, // private field
}

sprite_load :: proc(s: ^Sprite, path: cstring) {
    s.tex = r.LoadTexture(path)
}

sprite_play_animation :: proc(s: ^Sprite, anim: Animation) {
    if s.current_anim.start_frame == anim.start_frame && s.current_anim.end_frame == anim.end_frame {
        return
    }
    
    s.current_anim = anim
    s.frame = anim.start_frame
    s._elapsed_time = 0.0
}

sprite_draw :: proc(s: ^Sprite, x: f32, y: f32, ang: f32, scale: f32, c: r.Color) {
    ox: f32 = 0
    oy: f32 = 0

    ox = f32((s.frame % s.frames_wide)) * s.frame_size.x
    oy = f32(s.frame / s.frames_wide) * s.frame_size.y

    r.DrawTexturePro(s.tex, r.Rectangle{ox, oy, s.frame_size.x, s.frame_size.y},
                    r.Rectangle{x, y, s.frame_size.x * scale, s.frame_size.y * scale},
                    r.Vector2{s.origin.x * scale, s.origin.y * scale}, ang, c)
}

sprite_timer_go :: proc(s: ^Sprite) {
    s._elapsed_time += r.GetFrameTime()
    
    if s._elapsed_time >= s.current_anim.frame_rate {
        s.frame += 1
        
        if s.frame > s.current_anim.end_frame {
            s.frame = s.current_anim.start_frame
        }
        
        s._elapsed_time = 0.0
    }
}