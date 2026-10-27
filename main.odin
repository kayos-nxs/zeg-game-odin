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

SCREEN_WIDTH :: 800
SCREEN_HEIGHT :: 450
WINDOW_TITLE :: "Zeg-Game Odin Port"

main :: proc() {
    r.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, WINDOW_TITLE)
    r.SetTargetFPS(60)

    init_and_load()

    for !r.WindowShouldClose() {

        section_logic()

        r.BeginDrawing()
            r.ClearBackground(r.RAYWHITE)

                section_draw()


        r.EndDrawing()
    }

    r.CloseWindow()

    r.UnloadTexture( player.sprites.tex )
    r.UnloadTexture( box._character_icon )
    r.UnloadTexture( bg._image )
}