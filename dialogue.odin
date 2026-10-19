// FULL LOGIC OF DIALOGUE

package main

import 		"core:fmt"
import rl 	"vendor:raylib"

Dialogue :: struct {
    text: cstring,
    textSize: i32,

    x: f32,
    y: f32,
    width: f32, 
    height: f32,
}

getDialogueTextWidth :: proc(d: ^Dialogue) -> f32 {
    return f32(rl.MeasureText(d.text, d.textSize))
}

getDialogueCenteredTextX :: proc(d: ^Dialogue) -> f32 {
    textWidth := getDialogueTextWidth(d)
    return f32(d.x) + (f32(d.width) - textWidth) / 2
}

getDialogueCenteredTextY :: proc(d: ^Dialogue) -> f32 {
    return f32(d.y) + (f32(d.height) - f32(d.textSize)) / 2
}

drawDialogue :: proc(d: ^Dialogue) {
    rl.DrawRectangleRec(rl.Rectangle{
        x      = d.x,
        y      = d.y,
        width  = d.width,
        height = d.height,
    }, rl.DARKBLUE)

    rl.DrawRectangleLines(i32(d.x), i32(d.y), i32(d.width), i32(d.height), rl.WHITE)

    rl.DrawText(
        d.text, 
        i32(d.x + 20), 
        i32(d.y + 20), 
        d.textSize, 
        rl.RAYWHITE,
    )
}