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

player := Character {
	sprites = Sprite {
		frame_size = r.Vector2{ 100, 100 },
	    frames_wide = 9,
	    origin = r.Vector2{ 32, 32 },
	},
	pos = r.Vector2{SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2},
	hp = 5,
	speed = 5,
	isMoving = false,
}

PLAYER_IDLE      :: Animation{start_frame = 0,  end_frame = 8,  frame_rate = 0.15}
PLAYER_RUN_RIGHT  :: Animation{start_frame = 9,  end_frame = 10,  frame_rate = 0.15}
PLAYER_RUN_LEFT   :: Animation{start_frame = 11,  end_frame = 12, frame_rate = 0.15}
PLAYER_RUN_UP     :: Animation{start_frame = 18, end_frame = 19, frame_rate = 0.15}
PLAYER_RUN_DOWN   :: Animation{start_frame = 20, end_frame = 21, frame_rate = 0.15}


player_move_and_draw :: proc() {
    // sprite_play_animation(&player.sprites, PLAYER_IDLE)	

    if r.IsKeyDown(.D) || r.IsKeyDown(.S) || r.IsKeyDown(.A) || r.IsKeyDown(.W) {
    	player.isMoving = true
    } else {
    	player.isMoving = false
    }

	if r.IsKeyDown(.D) {
		player.pos.x += f32(player.speed)
	    sprite_play_animation(&player.sprites, PLAYER_RUN_RIGHT)
	} else if r.IsKeyDown(.A) {
		player.pos.x -= f32(player.speed)
	    sprite_play_animation(&player.sprites, PLAYER_RUN_LEFT)
	}

	if r.IsKeyDown(.W) {
		player.pos.y -= f32(player.speed)
	    sprite_play_animation(&player.sprites, PLAYER_RUN_UP)
	} else if r.IsKeyDown(.S) {
		player.pos.y += f32(player.speed)
	    sprite_play_animation(&player.sprites, PLAYER_RUN_DOWN)
	}

	if !player.isMoving {
	    sprite_play_animation(&player.sprites, PLAYER_IDLE)
	}

	sprite_draw(&player.sprites, player.pos.x, player.pos.y, 0, 2, r.YELLOW)
}

