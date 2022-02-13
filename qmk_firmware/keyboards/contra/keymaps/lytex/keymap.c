#include QMK_KEYBOARD_H

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
  /* Qwerty
   * ,------------------------------------------------------------------------------------.
   * | Tab  |   Q  |   W  |   E  |   R  |   T  |   Y  |   U  |   I  |   O  |   P  |  BS   |
   * |------+------+------+------+------+-------------+------+------+------+------+-------|
   * | Ctrl |   A  |   S  |   D  |   F  |   G  |   H  |   J  |   K  |   L  |   ;  | "/RET |
   * |------+------+------+------+------+------|------+------+------+------+------+-------|
   * | Shift|   Z  |   X  |   C  |   V  |   B  |   N  |   M  |   ,  |   .  |   /  | Shift |
   * |------+------+------+------+------+------+------+------+------+------+------+-------|
   * | Esc  |      | GUI  | Alt  | OSL1 |  SPC | SPC  | OSL2 |AltGr |      |      | TO(0) |
   * `------------------------------------------------------------------------------------' 
   */
	[0] = LAYOUT_ortho_4x12(
    KC_TAB, KC_Q, KC_W, KC_E, KC_R, KC_T, KC_Y, KC_U, KC_I, KC_O, KC_P, KC_BSPC,
    MT(MOD_LCTL, KC_ESC), KC_A, KC_S, KC_D, KC_F, KC_G, KC_H, KC_J, KC_K, KC_L, KC_SCLN, KC_QUOT,
    OSM(MOD_LSFT), KC_Z, KC_X, KC_C, KC_V, KC_B, KC_N, KC_M, KC_COMM, KC_DOT, KC_SLSH, OSM(MOD_RSFT),
    KC_ESC, KC_NO, OSM(MOD_LGUI), OSM(MOD_LALT), OSL(2), KC_SPC, KC_SPC, OSL(1), OSM(MOD_RALT), KC_NO, TO(3), TO(0)),
	[1] = LAYOUT_ortho_4x12(
    KC_GRV, KC_NO, KC_NO, KC_MINS, KC_EQL, KC_NO, KC_NO, KC_NO, KC_NO, KC_LBRC, KC_RBRC, KC_BSPC,
    MT(MOD_LCTL, KC_ESC), KC_1, KC_2, KC_3, KC_4, KC_5, KC_6, KC_7, KC_8, KC_9, KC_0, KC_BSLS,
    OSM(MOD_LSFT), KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_COMM, KC_DOT, KC_NO, OSM(MOD_RSFT),
    KC_ESC, KC_NO, OSM(MOD_LGUI), OSM(MOD_LALT), OSL(2), KC_SPC, KC_SPC, KC_TRNS, OSM(MOD_RALT), KC_NO, KC_NO, TO(0)),
	[2] = LAYOUT_ortho_4x12(KC_F1, KC_F2, KC_F3, KC_F4, KC_F5, KC_F6, KC_F7, KC_F8, KC_F9, KC_F10, KC_F11, KC_F12,
    MT(MOD_LCTL, KC_ESC), KC_HOME, KC_PGUP, KC_PGDN, KC_END, KC_PSCR, KC_LEFT, KC_DOWN, KC_UP, KC_RGHT, KC_DEL, KC_ENT,
    OSM(MOD_LSFT), KC_BRID, KC_BRIU, KC_NO, KC_NO, KC_MUTE, KC_VOLD, KC_VOLU, KC_MRWD, KC_MPLY, KC_MFFD, OSM(MOD_RSFT),
    KC_ESC, KC_NO, OSM(MOD_LGUI), OSM(MOD_LALT), KC_TRNS, KC_NO, KC_NO, OSL(1), OSM(MOD_RALT), KC_NO, KC_NO, TO(0)),
	[3] = LAYOUT_ortho_4x12(
    KC_NO, KC_1, KC_2, KC_3, KC_4, KC_5, KC_6, KC_7, KC_8, KC_9, KC_0, KC_BSPC,
    KC_NO, KC_Q, KC_W, KC_E, KC_R, KC_T, KC_Y, KC_U, KC_I, KC_O, KC_P, KC_LBRC,
    KC_NO, KC_A, KC_S, KC_D, KC_F, KC_G, KC_H, KC_J, KC_K, KC_L, KC_SCLN, KC_QUOT, 
    KC_NO, KC_NO, KC_NO, KC_NO, KC_C, KC_V, KC_N, KC_M, KC_NO, KC_NO, KC_NO, TO(0))
};



