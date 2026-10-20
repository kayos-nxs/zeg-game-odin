// MAIN GAME LOGIC

package main;

import      "core:fmt"
import rl   "vendor:raylib"
import time	"core:time"

prologue: Dialogue = Dialogue{
	text = "You're Yurii Petrenko. You've been a soviet agent, \nsecret killer. \nYou were so popular, that most of people were \nbuying your services simultaneously.\n\nBut some day.. You we're walking down the street.\nAnd then, you hear explosion and you see.. Nothing.\nAfter a few moments, you appear to be in a \nlabyrinth.\n\nYou're trying to search the exit.",
	textSize = 20,
	x    = 0,
	y    = 0, 
}

player: Player = Player{
    pos = rl.Vector2 {100, 200},
    width = 50,
    height = 50,
    speed = 7,
    color = rl.YELLOW,
}

enemy: Enemy = Enemy{
    pos = rl.Vector2 {300, 200},
    width = 50,
    height = 50,
    speed = 7,
    color = rl.DARKBLUE,
}

gameTimer: f32 = 0.0;
alpha: f32 = 1.0;
fadeSpeed: f32 = 0.01;

showPrologue :: proc() {
    drawDialogue(&prologue);
	rl.DrawRectangle(0, 0, 1000, 1000, rl.Fade(rl.BLACK, alpha));
}

logicGame :: proc() {
    gameTimer += rl.GetFrameTime();

    prologue.width = 560.0;
    prologue.height = 300.0; 

    prologue.x = (f32(SCREEN_WIDTH) - prologue.width) / 2;
    prologue.y = (f32(SCREEN_HEIGHT) - prologue.height) / 2;


    // alpha = 0.0;


    // fade in and fade out
    if gameTimer >= 1.0 && gameTimer < 6.0 {
        alpha -= fadeSpeed;
        if alpha < 0.0 {
            alpha = 0.0;
        }
    } else if gameTimer >= 6.0 {
        alpha += fadeSpeed;
        if alpha >= 1.0 {
            alpha = 1.0; 
        }

    }

    if rl.IsKeyDown(.RIGHT) { player.pos.x += player.speed; }
    if rl.IsKeyDown(.LEFT) { player.pos.x -= player.speed; }
    if rl.IsKeyDown(.UP) { player.pos.y -= player.speed; }
    if rl.IsKeyDown(.DOWN) { player.pos.y += player.speed; }

    enemyTargetPlayer(&enemy, &player);
}

drawGame :: proc() {
    rl.ClearBackground(rl.RAYWHITE);
    rl.DrawText("TEST!!!", 0, 0, 30, rl.BLACK);

    drawPlayer(&player);
    drawEnemy(&enemy);
    // showPrologue();


}