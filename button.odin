// FULL LOGIC OF BUTTON

package main;

import      "core:fmt"
import rl   "vendor:raylib"

Button :: struct {
    text: cstring,
    textColor: rl.Color,
    textSize: i32,
    
    x: f32,
    y: f32,
    width: f32,
    height: f32,
    color: rl.Color,
}


isButtonPressed :: proc(b: ^Button, mousePos: rl.Vector2) -> bool {
    return rl.CheckCollisionPointRec(mousePos, rl.Rectangle{
        x      = b.x,
        y      = b.y,
        width  = b.width,
        height = b.height,
    }) && rl.IsMouseButtonPressed(.LEFT);
}

getButtonTextWidth :: proc(b: ^Button) -> i32 {
    return rl.MeasureText(b.text, b.textSize);
}

getButtonCenteredTextX :: proc(b: ^Button) -> i32 {
    textWidth := getButtonTextWidth(b);
    return i32(b.x) + (i32(b.width) - textWidth) / 2;
}

getButtonCenteredTextY :: proc(b: ^Button) -> i32 {
    return i32(b.y) + (i32(b.height) - b.textSize) / 2;
}

drawButton :: proc(b: ^Button) {
    rl.DrawRectangleRec(rl.Rectangle{
        x      = b.x,
        y      = b.y,
        width  = b.width,
        height = b.height,
    }, b.color);

    rl.DrawText(b.text, getButtonCenteredTextX(b), getButtonCenteredTextY(b), b.textSize, b.textColor);
}