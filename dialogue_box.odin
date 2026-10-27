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
import "core:strings"
import "core:time"

Dialogue_Box :: struct {
	char: Character_Name,
    lines: []string,
    _line_idx: int,
    _count: f32,
    _character_icon: r.Texture2D,
}

dialogue_box_load :: proc(d: ^Dialogue_Box) {
	char := Character_Name.TEST
	d._character_icon = r.LoadTexture(Character_Icon_Path[char]) 
}

dialogue_box_draw :: proc(d: ^Dialogue_Box) {
    if d._line_idx >= len(d.lines) do return

    current_line := d.lines[d._line_idx]

    if d._count < f32(len(current_line)) {
        d._count += 30.0 * r.GetFrameTime()
    }

    if r.IsKeyPressed(.SPACE) {
        if d._count < f32(len(current_line)) {
            d._count = f32(len(current_line))
        } else {
            d._line_idx += 1                 
            d._count = 0                   
        }
    }

    r.DrawRectangle(50, 300, 700, 100, {20, 20, 30, 230})

    r.DrawTexture(d._character_icon, 80 , 300, r.WHITE)

    visible_len := clamp(int(d._count), 0, len(current_line))
    c_str := strings.clone_to_cstring(current_line[:visible_len], context.temp_allocator)
    
    r.DrawText(c_str, 200, 320, 20, r.WHITE)
}