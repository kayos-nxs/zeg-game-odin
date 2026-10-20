package main;

import      "core:fmt"
import rl   "vendor:raylib"
import math "core:math"

Enemy :: struct {
	pos: rl.Vector2,
	width: f32,
	height: f32,
	speed: f32,
	color: rl.Color,
}

drawEnemy :: proc(e: ^Enemy) {
	rl.DrawRectangleRec(rl.Rectangle{
        x      = e.pos.x,
        y      = e.pos.y,
        width  = e.width,
        height = e.height,
    }, e.color);
}

enemyTargetPlayer :: proc(e: ^Enemy, p: ^Player) {
	newX: f32 = e.pos.x;
	newY: f32 = e.pos.y;
	distanceX: f32 = p.pos.x - e.pos.x;
	distanceY: f32 = p.pos.y - e.pos.y;
	distance: f32 = math.hypot(distanceX, distanceY);

	step: f32 = math.min(e.speed, distance);
	newX += distanceX / distance * step;
	newY += distanceY / distance * step;

	e.pos.x = newX;
	e.pos.y = newY;



}