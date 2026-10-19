// FULL LOGIC OF MENU

package main;

import      "core:fmt"
import rl   "vendor:raylib"

clicks: int = 0;

textWidth: i32 = rl.MeasureText(WINDOW_TITLE, 20);

playButton: Button = Button{
        text   = "Play",
        textSize = 20,
        x      = 200,
        y      = 200,
        width  = 200,
        height = 50,
        color  = rl.DARKBLUE,
        textColor = rl.WHITE,
    };

exitButton: Button = Button{
        text   = "Exit",
        textSize = 20,
        x      = 200,
        y      = 300,
        width  = 200,
        height = 50,
        color  = rl.DARKBLUE,
        textColor = rl.WHITE,
    };

logicMenu :: proc() {
	mousePos: rl.Vector2 = rl.GetMousePosition();

    if isButtonPressed(&playButton, mousePos) {
        clicks += 1;
        playButton.color = rl.DARKGREEN;
        currentState = STATES.GAME;
    } else {
        playButton.color = rl.DARKBLUE;
    }

    if isButtonPressed(&exitButton, mousePos) {
    	exitButton.color = rl.DARKGREEN;
    	// break;
    	rl.CloseWindow();
    } else {
        exitButton.color = rl.DARKBLUE;
    }
}

drawMenu :: proc() {
    titleFontSize: i32 = 20;
    titleTextWidth := rl.MeasureText(WINDOW_TITLE, titleFontSize);

    posX := (SCREEN_WIDTH - titleTextWidth) / 2;
    posY := (SCREEN_HEIGHT - titleFontSize) / 2 - 150;
    
    rl.DrawText(WINDOW_TITLE, posX, posY, titleFontSize, rl.RAYWHITE);
    rl.DrawText(fmt.ctprintf("Clicks: %d", clicks), 0, 0, 20, rl.LIGHTGRAY);

    drawButton(&playButton);
    drawButton(&exitButton);    
}