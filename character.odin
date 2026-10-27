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

Character_Name :: enum {
    TEST,
}

Character_Icon_Path := [Character_Name]cstring {
    .TEST = "data/diabox/TEST.png"
}

Character :: struct {
    sprites: Sprite,
    pos: r.Vector2,

    hp: u8,
    speed: u8,

    isMoving: bool,
}