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

currentState: STATES = STATES.MENU;

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
            rl.ClearBackground(rl.BLACK);

            if (currentState == STATES.MENU) {
                drawMenu();
            } else if (currentState == STATES.GAME) {
                drawGame();
            }
        rl.EndDrawing();
    }
}