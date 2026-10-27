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

camera: r.Camera2D = r.Camera2D {
	target = r.Vector2{player.pos.x + 20.0, player.pos.y + 20.0},
	offset = r.Vector2{ f32(SCREEN_WIDTH / 2.0), f32(SCREEN_HEIGHT / 2.0)},
	rotation = 0.0,
	zoom = 1.0,
}

