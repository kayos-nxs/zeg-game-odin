// MAIN FILE

package main;

import      "core:fmt"
import rl   "vendor:raylib"

// WINDOW DATA
SCREEN_WIDTH :: 600;
SCREEN_HEIGHT :: 550;
WINDOW_TITLE :: "Zeg Game (Odin/Raylib Port)";

STATES :: enum {
    MENU, GAME, WIN, LOOSE,
}

currentState: STATES = STATES.GAME;

main :: proc() {
    rl.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, WINDOW_TITLE);
    rl.SetTargetFPS(60);

    for !rl.WindowShouldClose() {
        if (currentState == STATES.MENU) {
            logicMenu();
        } else if (currentState == STATES.GAME) {
            logicGame();
        }
    
        rl.BeginDrawing();
            if (currentState == STATES.MENU) {
                drawMenu();
            } else if (currentState == STATES.GAME) {
                drawGame();
            }
        rl.EndDrawing();
    }
}