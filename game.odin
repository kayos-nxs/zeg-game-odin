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

gameTimer: f32 = 0.0;


logicGame :: proc() {
    gameTimer += rl.GetFrameTime();

    prologue.width = 560.0;
    prologue.height = 300.0; 

    prologue.x = (f32(SCREEN_WIDTH) - prologue.width) / 2;
    prologue.y = (f32(SCREEN_HEIGHT) - prologue.height) / 2;
}

drawGame :: proc() {
	// time.sleep(2 * time.Second);
	if gameTimer >= 1.0 {
        drawDialogue(&prologue);
    }
	// drawDialogue(&prologue);

}