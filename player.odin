package main;

import      "core:fmt"
import rl   "vendor:raylib"

Player :: struct {
	pos: rl.Vector2,
	width: f32,
	height: f32,
	speed: f32,
	color: rl.Color,
}

drawPlayer :: proc(p: ^Player) {
	rl.DrawRectangleRec(rl.Rectangle{
        x      = p.pos.x,
        y      = p.pos.y,
        width  = p.width,
        height = p.height,
    }, p.color);
}

