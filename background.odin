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

Background_List :: enum {
	TEST,
}

Background_List_Path := [Background_List]cstring {
    .TEST = "data/bg/TEST.png"
}

Background :: struct {
	pos: r.Vector2,
	background_name: Background_List,
	_image: r.Texture2D,
}

background_load :: proc(bg: ^Background) {
	bg._image = r.LoadTexture(Background_List_Path[bg.background_name]) 
}

background_draw :: proc(bg: ^Background) {
    r.DrawTexture(bg._image, i32(bg.pos.x) , i32(bg.pos.y), r.WHITE)
}
