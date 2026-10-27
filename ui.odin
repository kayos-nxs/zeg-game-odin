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
import str "core:strings"

hpText: cstring = ""

ui_load :: proc(p: ^Character) {
	concatHp := str.concatenate({"HP: ", f.tprint(p.hp)})
	hpText = str.clone_to_cstring(concatHp)
	defer delete(hpText)
	defer delete(concatHp)
}

ui_draw :: proc() {
    r.DrawText(hpText, 0, 0, 20, r.BLACK)
}