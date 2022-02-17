#include QMK_KEYBOARD_H
#include "quantum.h"
#include "keymap_us_international_linux.h"

/*
// TAP_DANCE_ENABLE = yes  # Enables it in rules.mk
// Tap Dance declarations
enum {
    TD_SPC_3,
};

// Tap Dance definitions
qk_tap_dance_action_t tap_dance_actions[] = {
    // Tap once for SPC, twice for moving to layer 3
    [TD_SPC_3] = ACTION_TAP_DANCE_LAYER_MOVE(KC_SPC, 3),
}; */

enum userspace_custom_keycodes {
    CU_GAME = SAFE_RANGE,
    CU_EACU,
    CU_UDIA,
    CU_UACU,
    CU_IACU,
    CU_OACU,
    CU_AACU,
    CU_NTIL,
    CU_IQUE
};

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  switch (keycode) {
    case CU_EACU:
      if (record->event.pressed) {
        // Do something when pressed
          register_code((uint8_t) KC_QUOT);
          unregister_code((uint8_t) KC_QUOT);
          register_code((uint8_t) KC_E);
          unregister_code((uint8_t) KC_E);
      }
      return false; // Skip all further processing of this key
    case CU_UDIA:
      if (record->event.pressed) {
        // Do something when pressed
          register_code(KC_LSFT);
          register_code((uint8_t) KC_QUOT);
          unregister_code((uint8_t) KC_QUOT);
          unregister_code(KC_LSFT);
          register_code((uint8_t) KC_U);
          unregister_code((uint8_t) KC_U);
      }
      return false; // Skip all further processing of this key
    case CU_UACU:
      if (record->event.pressed) {
        // Do something when pressed
          register_code((uint8_t) KC_QUOT);
          unregister_code((uint8_t) KC_QUOT);
          register_code((uint8_t) KC_U);
          unregister_code((uint8_t) KC_U);
      }
      return false; // Skip all further processing of this key
    case CU_IACU:
      if (record->event.pressed) {
        // Do something when pressed
          register_code((uint8_t) KC_QUOT);
          unregister_code((uint8_t) KC_QUOT);
          register_code((uint8_t) KC_I);
          unregister_code((uint8_t) KC_I);
      }
      return false; // Skip all further processing of this key
    case CU_OACU:
      if (record->event.pressed) {
        // Do something when pressed
          register_code((uint8_t) KC_QUOT);
          unregister_code((uint8_t) KC_QUOT);
          register_code((uint8_t) KC_O);
          unregister_code((uint8_t) KC_O);
      }
      return false; // Skip all further processing of this key
    case CU_AACU:
      if (record->event.pressed) {
        // Do something when pressed
          register_code((uint8_t) KC_QUOT);
          unregister_code((uint8_t) KC_QUOT);
          register_code((uint8_t) KC_A);
          unregister_code((uint8_t) KC_A);
      }
      return false; // Skip all further processing of this key
    case CU_NTIL:
      if (record->event.pressed) {
        // Do something when pressed
          register_code((uint8_t) KC_SCLN);
          unregister_code((uint8_t) KC_SCLN);
      }
      return false; // Skip all further processing of this key
    case CU_IQUE:
      if (record->event.pressed) {
        // Do something when pressed
          register_code(KC_LSFT);
          register_code((uint8_t) KC_EQL);
          unregister_code((uint8_t) KC_EQL);
          unregister_code(KC_LSFT);
      }
      return false; // Skip all further processing of this key
    default:
      return true; // Process all other keycodes normally
  }
}

enum contra_layers {
  _QWERTY,
  _INVERSE_QWERTY,
  _SHIFTED_INVERSE_QWERTY,
  _ALTGR_INVERSE_QWERTY,
  _NUMBER,
  _NAVIGATION,
  _STENO
};

#define QWERTY TO(_QWERTY)
#define NUM OSL(_NUMBER)
#define NAV OSL(_NAVIGATION)
#define STENO TO(_STENO)
#define IQWERT TO(_INVERSE_QWERTY)
#define SIQWER OSL(_SHIFTED_INVERSE_QWERTY)
#define AIQWER OSL(_ALTGR_INVERSE_QWERTY)


const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

   /* Qwerty
    * ,-----------------------------------------------------------------------------------.
    * | Tab  |   Q  |   W  |   E  |   R  |   T  |   Y  |   U  |   I  |   O  |   P  |  BS  |
    * |------+------+------+------+------+-------------+------+------+------+------+------|
    * | C/Esc|   A  |   S  |   D  |   F  |   G  |   H  |   J  |   K  |   L  |   ;  | "/RET|
    * |------+------+------+------+------+------|------+------+------+------+------+------|
    * | Shift|   Z  |   X  |   C  |   V  |   B  |   N  |   M  |   ,  |   .  |   /  | Shift|
    * |------+------+------+------+------+------+------+------+------+------+------+------|
    * | Esc  |IQWERT|      | GUI  | Alt  | NAV  | SPC  | NUM  |AltGr |      |STENO |QWERTY|
    * `------------------------------------------------------------------------------------' 
    */
	[_QWERTY] = LAYOUT_ortho_4x12(
    KC_TAB, KC_Q, KC_W, KC_E, KC_R, KC_T, KC_Y, KC_U, KC_I, KC_O, KC_P, KC_BSPC,
    MT(MOD_LCTL, KC_ESC), KC_A, KC_S, KC_D, KC_F, KC_G, KC_H, KC_J, KC_K, KC_L, KC_SCLN, KC_QUOT,
    OSM(MOD_LSFT), KC_Z, KC_X, KC_C, KC_V, KC_B, KC_N, KC_M, KC_COMM, KC_DOT, KC_SLSH, OSM(MOD_RSFT),
    KC_ESC, IQWERT, KC_NO, OSM(MOD_LGUI), OSM(MOD_LALT), NAV, KC_SPC, NUM, OSM(MOD_RALT), KC_NO, STENO, QWERTY),
   /******************************************************************************************************************/

   /* Number
    * ,-----------------------------------------------------------------------------------.
    * |   `  |      |      |      |      |      |      |      |   \  |   [  |   ]  |  BS  |
    * |------+------+------+------+------+-------------+------+------+------+------+------|
    * |   1  |   2  |   3  |   4  |   5  |   6  |   7  |   8  |   9  |   0  |   -  |   =  |
    * |------+------+------+------+------+------|------+------+------+------+------+------|
    * | Shift|      |      |      |      |      |      | C/Esc|   ,  |   .  |   /  | Shift|
    * |------+------+------+------+------+------+------+------+------+------+------+------|
    * | Esc  |      | GUI  | Alt  |      | NAV  | SPC  | TRNS |AltGr |      |      |QWERTY|
    * `------------------------------------------------------------------------------------' 
    */
	[_NUMBER] = LAYOUT_ortho_4x12(
    KC_GRV, KC_NO, KC_NO, KC_MINS, KC_EQL, KC_NO, KC_NO, KC_NO, KC_BSLS, KC_LBRC, KC_RBRC, KC_BSPC,
    KC_1, KC_2, KC_3, KC_4, KC_5, KC_6, KC_7, KC_8, KC_9, KC_0, KC_MINS, KC_EQL,
    OSM(MOD_LSFT), KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, MT(MOD_LCTL, KC_ESC), KC_COMM, KC_DOT, KC_SLSH, OSM(MOD_RSFT),
    KC_ESC, KC_NO, KC_NO, OSM(MOD_LGUI), OSM(MOD_LALT), NUM, KC_SPC, KC_TRNS, OSM(MOD_RALT), KC_NO, KC_NO, QWERTY),
   /******************************************************************************************************************/

   /* Navigation
    * ,-----------------------------------------------------------------------------------.
    * |  F1  |  F2  |  F3  |  F4  |  F5  |  F6  |  F7  |  F8  |  F9  | F10  | F11  | F12  |
    * |------+------+------+------+------+-------------+------+------+------+------+------|
    * | C/Esc| HOME | PGUP | PGDN | END  | PSCR |  ←   |   ↓  |   ↑  |   →  | DEL  | RET  |
    * |------+------+------+------+------+------|------+------+------+------+------+------|
    * | Shift| BRID | BRIU |      |      | MUTE | VOLD | VOLU | MRWD | MPLY | MFFD | Shift|
    * |------+------+------+------+------+------+------+------+------+------+------+------|
    * | Esc  |      |      | GUI  | Alt  | TRNS |      | NUM  |AltGr |      |      |QWERTY|
    * `------------------------------------------------------------------------------------' 
    */
	[_NAVIGATION] = LAYOUT_ortho_4x12(KC_F1, KC_F2, KC_F3, KC_F4, KC_F5, KC_F6, KC_F7, KC_F8, KC_F9, KC_F10, KC_F11, KC_F12,
    MT(MOD_LCTL, KC_ESC), KC_HOME, KC_PGUP, KC_PGDN, KC_END, KC_PSCR, KC_LEFT, KC_DOWN, KC_UP, KC_RGHT, KC_DEL, KC_ENT,
    OSM(MOD_LSFT), KC_BRID, KC_BRIU, KC_NO, KC_NO, KC_MUTE, KC_VOLD, KC_VOLU, KC_MRWD, KC_MPLY, KC_MFFD, OSM(MOD_RSFT),
    KC_ESC, KC_NO, KC_NO, OSM(MOD_LGUI), OSM(MOD_LALT), KC_TRNS, KC_NO, NUM, OSM(MOD_RALT), KC_NO, KC_NO, QWERTY),
   /******************************************************************************************************************/

   /* Steno
    * ,-----------------------------------------------------------------------------------.
    * |      |   1  |   2  |   3  |   4  |   5  |   6  |   7  |   8  |   9  |   0  |  BS  |
    * |------+------+------+------+------+-------------+------+------+------+------+------|
    * |      |   Q  |   W  |   E  |   R  |   T  |   Y  |   U  |   I  |   O  |   P  |  [   |
    * |------+------+------+------+------+------|------+------+------+------+------+------|
    * |      |   A  |   S  |   D  |   F  |   G  |   H  |   J  |   K  |   L  |   ;  |  '   |
    * |------+------+------+------+------+------+------+------+------+------+------+------|
    * | RESET|      |      |      |   C  |   V  |   N  |   M  |      |      |      |QWERTY|
    * `------------------------------------------------------------------------------------' 

       With Plover applied:
    * ,-----------------------------------------------------------------------------------.
    * |      |   #  |   #  |   #  |   #  |   #  |   #  |   #  |   #  |   #  |   #  |  BS  |
    * |------+------+------+------+------+-------------+------+------+------+------+------|
    * |      |   S  |   T  |   P  |   H  |   *  |   *  |   F  |   P  |   L  |   T  |  D   |
    * |------+------+------+------+------+------|------+------+------+------+------+------|
    * |      |   S  |   K  |   W  |   R  |   *  |   *  |   R  |   B  |   G  |   S  |  Z   |
    * |------+------+------+------+------+------+------+------+------+------+------+------|
    * | RESET|      |      |      |   A  |   O  |   E  |   U  |      |      |      |QWERTY|
    * `------------------------------------------------------------------------------------' 
    */
	[_STENO] = LAYOUT_ortho_4x12(
    KC_NO, KC_1, KC_2, KC_3, KC_4, KC_5, KC_6, KC_7, KC_8, KC_9, KC_0, KC_BSPC,
    KC_NO, KC_Q, KC_W, KC_E, KC_R, KC_T, KC_Y, KC_U, KC_I, KC_O, KC_P, KC_LBRC,
    KC_NO, KC_A, KC_S, KC_D, KC_F, KC_G, KC_H, KC_J, KC_K, KC_L, KC_SCLN, KC_QUOT, 
    RESET, KC_NO, KC_NO, KC_NO, KC_C, KC_V, KC_N, KC_M, KC_NO, KC_NO, KC_NO, QWERTY),
   /******************************************************************************************************************/

   /* Inverse Qwerty
    * ,-----------------------------------------------------------------------------------.
    * | Tab  |   Q  |   W  |   E  |   R  |   T  |   Y  |   U  |   I  |   O  |   P  |  BS  |
    * |------+------+------+------+------+-------------+------+------+------+------+------|
    * | C/Esc|   A  |   S  |   D  |   F  |   G  |   H  |   J  |   K  |   L  |   <  | -/RET|
    * |------+------+------+------+------+------|------+------+------+------+------+------|
    * | Shift|   Z  |   X  |   C  |   V  |   B  |   N  |   M  |   ,  |   .  |   &  | Shift|
    * |------+------+------+------+------+------+------+------+------+------+------+------|
    * | Esc  |      |      | GUI  | Alt  | NAV  | SPC  | NUM  |AltGr |      |      |QWERTY|
    * `------------------------------------------------------------------------------------' 
    */
	[_INVERSE_QWERTY] = LAYOUT_ortho_4x12(
    KC_TAB, KC_Q, KC_W, KC_E, KC_R, KC_T, KC_Y, KC_U, KC_I, KC_O, KC_P, KC_BSPC,
    MT(MOD_LCTL, KC_ESC), KC_A, KC_S, KC_D, KC_F, KC_G, KC_H, KC_J, KC_K, KC_L, KC_LT, KC_MINS,
    SIQWER, KC_Z, KC_X, KC_C, KC_V, KC_B, KC_N, KC_M, KC_COMM, KC_DOT, KC_AMPR, SIQWER,
        KC_ESC, KC_NO, KC_NO, OSM(MOD_LGUI), OSM(MOD_LALT), NAV, KC_SPC, NUM, AIQWER, KC_NO, KC_NO, QWERTY),

	[_SHIFTED_INVERSE_QWERTY] = LAYOUT_ortho_4x12(
    KC_TAB, S(KC_Q), S(KC_W), S(KC_E), S(KC_R), S(KC_T), S(KC_Y), S(KC_U), S(KC_I), S(KC_O), S(KC_P), KC_BSPC,
    MT(MOD_LCTL, KC_ESC), S(KC_A), S(KC_S), S(KC_D), S(KC_F), S(KC_G), S(KC_H), S(KC_J), S(KC_K), S(KC_L), KC_GT, KC_AT,
    KC_TRNS, S(KC_Z), S(KC_X), S(KC_C), S(KC_V), S(KC_B), S(KC_N), S(KC_M), KC_NUBS, S(KC_NUBS), KC_UNDS, KC_TRNS,
    KC_ESC, KC_NO, KC_NO, OSM(MOD_LGUI), OSM(MOD_LALT), NAV, KC_SPC, NUM, AIQWER, KC_NO, KC_NO, QWERTY),

	// [_ALTGR_INVERSE_QWERTY] = LAYOUT_ortho_4x12(
 //    KC_TAB, ALTGR(KC_Q), ALTGR(KC_W), ALTGR(KC_E), ALTGR(KC_R), ALTGR(KC_T), ALTGR(KC_Y), ALTGR(KC_U), ALTGR(KC_I), ALTGR(KC_O), ALTGR(KC_P), KC_BSPC,
 //    MT(MOD_LCTL, KC_ESC), ALTGR(KC_A), ALTGR(KC_S), ALTGR(KC_D), ALTGR(KC_F), ALTGR(KC_G), ALTGR(KC_H), ALTGR(KC_J), ALTGR(KC_K), ALTGR(KC_L), KC_GT, KC_AT,
 //    KC_TRNS, ALTGR(KC_Z), ALTGR(KC_X), ALTGR(KC_C), ALTGR(KC_V), ALTGR(KC_B), ALTGR(KC_N), ALTGR(KC_M), KC_NUBS, KC_NUBS, KC_UNDS, KC_TRNS,
 //    KC_ESC, KC_NO, KC_NO, OSM(MOD_LGUI), OSM(MOD_LALT), NAV, KC_SPC, NUM, KC_TRNS, KC_NO, KC_NO, QWERTY),

	[_ALTGR_INVERSE_QWERTY] = LAYOUT_ortho_4x12(
    KC_TAB, KC_NO, KC_NO, CU_EACU, KC_NO, KC_NO, CU_UDIA, CU_UACU, CU_IACU, CU_OACU, KC_NO, KC_BSPC,
    MT(MOD_LCTL, KC_ESC), CU_AACU, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,
    OSM(MOD_LSFT), KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, CU_IQUE, OSM(MOD_RSFT),
    KC_ESC, IQWERT, KC_NO, OSM(MOD_LGUI), OSM(MOD_LALT), NAV, KC_SPC, NUM, OSM(MOD_RALT), KC_NO, KC_NO, QWERTY),
};



