#include QMK_KEYBOARD_H
#include "quantum.h"
#include "keymap_us_international_linux.h"
#include "keymap_spanish.h"
#include "print.h"

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
    CU_IQUE,
    CU_GRV,
    CU_CIRC,
    CUS_EACU,
    CUS_UDIA,
    CUS_UACU,
    CUS_IACU,
    CUS_OACU,
    CUS_AACU,
    CUS_NTIL,
};


enum contra_layers {
  _QWERTY,
  _INVERSE_QWERTY,
  _SHIFTED_INVERSE_QWERTY,
  _ALTGR_INVERSE_QWERTY,
  _ALTGR_SHIFTED_INVERSE_QWERTY,
  _NUMBER_INVERSE_QWERTY,
  _NUMBER_SHIFTED_INVERSE_QWERTY,
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
#define ASIQWE OSL(_ALTGR_SHIFTED_INVERSE_QWERTY)
#define NIQWER OSL(_NUMBER_INVERSE_QWERTY)
#define NISQWE OSL(_NUMBER_SHIFTED_INVERSE_QWERTY)


const uint16_t PROGMEM test_combo1[] = {KC_J, KC_K, COMBO_END};
combo_t key_combos[COMBO_COUNT] = {
    COMBO(test_combo1, KC_ESC),
};

uint8_t custom_shift_num = 0;

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  uprintf("timer_read32: %d\n",  timer_read32());
  switch (keycode) {
    /* case CU_EACU:
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
    case CU_GRV:
      if (record->event.pressed) {
        // Do something when pressed
          register_code((uint8_t) ES_GRV);
          unregister_code((uint8_t) ES_GRV);
          register_code((uint8_t) ES_GRV);
          unregister_code((uint8_t) ES_GRV);
      }
      return false; // Skip all further processing of this key
    case CU_CIRC:
      if (record->event.pressed) {
        // Do something when pressed
          register_code(KC_LSFT);
          register_code((uint8_t) ES_GRV);
          unregister_code((uint8_t) ES_GRV);
          unregister_code(KC_LSFT);
          register_code(KC_LSFT);
          register_code((uint8_t) ES_GRV);
          unregister_code((uint8_t) ES_GRV);
          unregister_code(KC_LSFT);
      }
      return false; // Skip all further processing of this key
    case CUS_EACU:
      if (record->event.pressed) {
        // Do something when pressed
          register_code((uint8_t) KC_QUOT);
          unregister_code((uint8_t) KC_QUOT);
          register_code(KC_LSFT);
          register_code((uint8_t) KC_E);
          unregister_code((uint8_t) KC_E);
          unregister_code(KC_LSFT);
      }
      return false; // Skip all further processing of this key
    case CUS_UDIA:
      if (record->event.pressed) {
        // Do something when pressed
          register_code(KC_LSFT);
          register_code((uint8_t) KC_QUOT);
          unregister_code((uint8_t) KC_QUOT);
          unregister_code(KC_LSFT);
          register_code(KC_LSFT);
          register_code((uint8_t) KC_U);
          unregister_code((uint8_t) KC_U);
          unregister_code(KC_LSFT);
      }
      return false; // Skip all further processing of this key
    case CUS_UACU:
      if (record->event.pressed) {
        // Do something when pressed
          register_code((uint8_t) KC_QUOT);
          unregister_code((uint8_t) KC_QUOT);
          register_code(KC_LSFT);
          register_code((uint8_t) KC_U);
          unregister_code((uint8_t) KC_U);
          unregister_code(KC_LSFT);
      }
      return false; // Skip all further processing of this key
    case CUS_IACU:
      if (record->event.pressed) {
        // Do something when pressed
          register_code((uint8_t) KC_QUOT);
          unregister_code((uint8_t) KC_QUOT);
          register_code(KC_LSFT);
          register_code((uint8_t) KC_I);
          unregister_code((uint8_t) KC_I);
          unregister_code(KC_LSFT);
      }
      return false; // Skip all further processing of this key
    case CUS_OACU:
      if (record->event.pressed) {
        // Do something when pressed
          register_code((uint8_t) KC_QUOT);
          unregister_code((uint8_t) KC_QUOT);
          register_code(KC_LSFT);
          register_code((uint8_t) KC_O);
          unregister_code((uint8_t) KC_O);
          unregister_code(KC_LSFT);
      }
      return false; // Skip all further processing of this key
    case CUS_AACU:
      if (record->event.pressed) {
        // Do something when pressed
          register_code((uint8_t) KC_QUOT);
          unregister_code((uint8_t) KC_QUOT);
          register_code(KC_LSFT);
          register_code((uint8_t) KC_A);
          unregister_code((uint8_t) KC_A);
          unregister_code(KC_LSFT);
      }
      return false; // Skip all further processing of this key
    case CUS_NTIL:
      if (record->event.pressed) {
        // Do something when pressed
          register_code(KC_LSFT);
          register_code((uint8_t) KC_SCLN);
          unregister_code((uint8_t) KC_SCLN);
          unregister_code(KC_LSFT);
      }
      return false; // Skip all further processing of this key */
    case OSM(MOD_LSFT):
    case OSM(MOD_RSFT):
      if (record->event.pressed) {
        // Do something when pressed
            if (get_oneshot_layer() == _NUMBER) {
                set_oneshot_layer(_NUMBER, ONESHOT_START);

                uprintf("254 custom_shift_num: %d\n",  custom_shift_num);
                custom_shift_num = 1;
                uprintf("256 custom_shift_num: %d\n", custom_shift_num);
            }
        }
    default:

#define CUTOFF 4
      if (record->event.pressed) {
/* char* str = "0";
          custom_shift_num++;
          sprintf(str, "%i", custom_shift_num);
          send_string(str); */
    if ((get_oneshot_mods() & (MOD_BIT(KC_LSFT)|MOD_BIT(KC_RSFT))) &&
            (custom_shift_num == 1)) {
              uprintf("269 custom_shift_num: %d\n", custom_shift_num);
              custom_shift_num = 2;
              uprintf("271 custom_shift_num: %d\n", custom_shift_num);
            }


          /* if (get_oneshot_layer() == _NUMBER) {
              SEND_STRING("asdfnumber");
          }
          if (get_oneshot_mods() & (MOD_BIT(KC_LSFT)|MOD_BIT(KC_RSFT))) {
              SEND_STRING("Shift");
          } */
            /* if ((custom_shift_num >= CUTOFF) && ((get_oneshot_layer() == _NUMBER) &&
                (get_oneshot_mods() & (MOD_BIT(KC_LSFT)|MOD_BIT(KC_RSFT))))) {
              clear_oneshot_layer_state(ONESHOT_PRESSED);
              custom_shift_num = 0;
          } */
      }
      return true; // Process all other keycodes normally
  }
}


void post_process_record_user(uint16_t keycode, keyrecord_t *record) {

        if (record->event.pressed) {
          if (custom_shift_num == 2) {
              clear_oneshot_layer_state(ONESHOT_PRESSED);
              uprintf("297 custom_shift_num: %d\n", custom_shift_num);
              custom_shift_num = 0;
              uprintf("299 custom_shift_num: %d\n", custom_shift_num);
          }
          // if (get_oneshot_mods() & (MOD_BIT(KC_LSFT)|MOD_BIT(KC_RSFT))) {
          // }
        }

}

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

   /* Qwerty
    * ,-----------------------------------------------------------------------------------.
    * | Tab  |   Q  |   W  |   E  |   R  |   T  |   Y  |   U  |   I  |   O  |   P  |  BS  |
    * |------+------+------+------+------+-------------+------+------+------+------+------|
    * | Ctrl |   A  |   S  |   D  |   F  |   G  |   H  |   J  |   K  |   L  |   ;  | "/RET|
    * |------+------+------+------+------+------|------+------+------+------+------+------|
    * | Shift|   Z  |   X  |   C  |   V  |   B  |   N  |   M  |   ,  |   .  |   /  | Shift|
    * |------+------+------+------+------+------+------+------+------+------+------+------|
    * | Esc  |IQWERT|      | GUI  | Alt  | NAV  | SPC  | NUM  |AltGr |      |STENO |QWERTY|
    * `------------------------------------------------------------------------------------'
    */
	[_QWERTY] = LAYOUT_ortho_4x12(
    KC_TAB, KC_Q, KC_W, KC_E, KC_R, KC_T, KC_Y, KC_U, KC_I, KC_O, KC_P, KC_BSPC,
    OSM(MOD_LCTL), KC_A, KC_S, KC_D, KC_F, KC_G, KC_H, KC_J, KC_K, KC_L, KC_SCLN, KC_QUOT,
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
    KC_GRV, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_BSLS, KC_LBRC, KC_RBRC, KC_BSPC,
    KC_1, KC_2, KC_3, KC_4, KC_5, KC_6, KC_7, KC_8, KC_9, KC_0, KC_MINS, KC_EQL,
    OSM(MOD_LSFT), KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, OSM(MOD_LCTL), KC_COMM, KC_DOT, KC_SLSH, OSM(MOD_RSFT),
    KC_ESC, KC_NO, KC_NO, OSM(MOD_LGUI), OSM(MOD_LALT), NUM, KC_SPC, KC_TRNS, OSM(MOD_RALT), KC_NO, KC_NO, QWERTY),
   /******************************************************************************************************************/

   /* Navigation
    * ,-----------------------------------------------------------------------------------.
    * |  F1  |  F2  |  F3  |  F4  |  F5  |  F6  |  F7  |  F8  |  F9  | F10  | F11  | F12  |
    * |------+------+------+------+------+-------------+------+------+------+------+------|
    * | Ctrl | HOME | PGUP | PGDN | END  | PSCR |  ←   |   ↓  |   ↑  |   →  | DEL  | RET  |
    * |------+------+------+------+------+------|------+------+------+------+------+------|
    * | Shift| BRID | BRIU |      |      | MUTE | VOLD | VOLU | MRWD | MPLY | MFFD | Shift|
    * |------+------+------+------+------+------+------+------+------+------+------+------|
    * | Esc  |      |      | GUI  | Alt  | TRNS |      | NUM  |AltGr |      |      |QWERTY|
    * `------------------------------------------------------------------------------------'
    */
	[_NAVIGATION] = LAYOUT_ortho_4x12(KC_F1, KC_F2, KC_F3, KC_F4, KC_F5, KC_F6, KC_F7, KC_F8, KC_F9, KC_F10, KC_F11, KC_F12,
    OSM(MOD_LCTL), KC_HOME, KC_PGUP, KC_PGDN, KC_END, KC_PSCR, KC_LEFT, KC_DOWN, KC_UP, KC_RGHT, KC_DEL, KC_ENT,
    OSM(MOD_LSFT), KC_BRID, KC_BRIU, KC_NO, KC_NO, KC_MUTE, KC_VOLD, KC_VOLU, KC_MRWD, KC_MPLY, KC_MFFD, OSM(MOD_RSFT),
    KC_ESC, KC_NO, KC_NO, OSM(MOD_LGUI), OSM(MOD_LALT), KC_TRNS, OSM(MOD_LCTL), NUM, OSM(MOD_RALT), KC_NO, KC_NO, QWERTY),
   /******************************************************************************************************************/

   /* Steno
    * ,-----------------------------------------------------------------------------------.
    * |      |   1  |   2  |   3  |   4  |   5  |   6  |   7  |   8  |   9  |   0  |  BS  |
    * |------+------+------+------+------+-------------+------+------+------+------+------|
    * |      |   Q  |   W  |   E  |   R  |   T  |   Y  |   U  |   I  |   O  |   P  |  [   |
    * |------+------+------+------+------+------|------+------+------+------+------+------|
    * |      |   A  |   S  |   D  |   F  |   G  |   H  |   J  |   K  |   L  |   ;  |  '   |
    * |------+------+------+------+------+------+------+------+------+------+------+------|
    * |REBOOT|      |      |      |   C  |   V  |   N  |   M  |      |      |      |QWERTY|
    * `------------------------------------------------------------------------------------'

       With Plover applied:
    * ,-----------------------------------------------------------------------------------.
    * |      |   #  |   #  |   #  |   #  |   #  |   #  |   #  |   #  |   #  |   #  |  BS  |
    * |------+------+------+------+------+-------------+------+------+------+------+------|
    * |      |   S  |   T  |   P  |   H  |   *  |   *  |   F  |   P  |   L  |   T  |  D   |
    * |------+------+------+------+------+------|------+------+------+------+------+------|
    * |      |   S  |   K  |   W  |   R  |   *  |   *  |   R  |   B  |   G  |   S  |  Z   |
    * |------+------+------+------+------+------+------+------+------+------+------+------|
    * |REBOOT|      |      |      |   A  |   O  |   E  |   U  |      |      |      |QWERTY|
    * `------------------------------------------------------------------------------------'
    */
	[_STENO] = LAYOUT_ortho_4x12(
    KC_NO, KC_1, KC_2, KC_3, KC_4, KC_5, KC_6, KC_7, KC_8, KC_9, KC_0, KC_BSPC,
    KC_NO, KC_Q, KC_W, KC_E, KC_R, KC_T, KC_Y, KC_U, KC_I, KC_O, KC_P, KC_LBRC,
    KC_NO, KC_A, KC_S, KC_D, KC_F, KC_G, KC_H, KC_J, KC_K, KC_L, KC_SCLN, KC_QUOT,
    QK_BOOT, DB_TOGG, KC_NO, KC_NO, KC_C, KC_V, KC_N, KC_M, KC_NO, KC_NO, KC_NO, QWERTY),
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
    OSM(MOD_LCTL), KC_A, KC_S, KC_D, KC_F, KC_G, KC_H, KC_J, KC_K, KC_L, ES_SCLN, ES_QUOT,
    SIQWER, KC_Z, KC_X, KC_C, KC_V, KC_B, KC_N, KC_M, KC_COMM, KC_DOT, ES_SLSH, SIQWER,
    KC_ESC, KC_NO, KC_NO, OSM(MOD_LGUI), OSM(MOD_LALT), NAV, KC_SPC, NIQWER, AIQWER, KC_NO, KC_NO, QWERTY),

	[_SHIFTED_INVERSE_QWERTY] = LAYOUT_ortho_4x12(
    KC_TAB, S(KC_Q), S(KC_W), S(KC_E), S(KC_R), S(KC_T), S(KC_Y), S(KC_U), S(KC_I), S(KC_O), S(KC_P), KC_BSPC,
    OSM(MOD_LCTL), S(KC_A), S(KC_S), S(KC_D), S(KC_F), S(KC_G), S(KC_H), S(KC_J), S(KC_K), S(KC_L), ES_COLN, ES_DQUO,
    KC_TRNS, S(KC_Z), S(KC_X), S(KC_C), S(KC_V), S(KC_B), S(KC_N), S(KC_M), ES_LABK, ES_RABK, ES_QUES, KC_TRNS,
    KC_ESC, KC_NO, KC_NO, OSM(MOD_LGUI), OSM(MOD_LALT), NAV, KC_SPC, NIQWER, ASIQWE, KC_NO, KC_NO, QWERTY),

	// [_ALTGR_INVERSE_QWERTY] = LAYOUT_ortho_4x12(
 //    KC_TAB, ALTGR(KC_Q), ALTGR(KC_W), ALTGR(KC_E), ALTGR(KC_R), ALTGR(KC_T), ALTGR(KC_Y), ALTGR(KC_U), ALTGR(KC_I), ALTGR(KC_O), ALTGR(KC_P), KC_BSPC,
 //    OSM(MOD_LCTL), ALTGR(KC_A), ALTGR(KC_S), ALTGR(KC_D), ALTGR(KC_F), ALTGR(KC_G), ALTGR(KC_H), ALTGR(KC_J), ALTGR(KC_K), ALTGR(KC_L), KC_GT, KC_AT,
 //    KC_TRNS, ALTGR(KC_Z), ALTGR(KC_X), ALTGR(KC_C), ALTGR(KC_V), ALTGR(KC_B), ALTGR(KC_N), ALTGR(KC_M), KC_NUBS, KC_NUBS, KC_UNDS, KC_TRNS,
 //    KC_ESC, KC_NO, KC_NO, OSM(MOD_LGUI), OSM(MOD_LALT), NAV, KC_SPC, NUM, KC_TRNS, KC_NO, KC_NO, QWERTY),

	[_ALTGR_INVERSE_QWERTY] = LAYOUT_ortho_4x12(
    KC_TAB, KC_NO, KC_NO, CU_EACU, KC_NO, KC_NO, CU_UDIA, CU_UACU, CU_IACU, CU_OACU, KC_NO, KC_BSPC,
    OSM(MOD_LCTL), CU_AACU, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,
    ASIQWE, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, CU_NTIL, KC_NO, KC_NO, KC_NO, CU_IQUE, ASIQWE,
    KC_ESC, IQWERT, KC_NO, OSM(MOD_LGUI), OSM(MOD_LALT), NAV, KC_SPC, NIQWER, KC_TRNS, KC_NO, KC_NO, QWERTY),

	[_ALTGR_SHIFTED_INVERSE_QWERTY] = LAYOUT_ortho_4x12(
    KC_TAB, KC_NO, KC_NO, CUS_EACU, KC_NO, KC_NO, CUS_UDIA, CUS_UACU, CUS_IACU, CUS_OACU, KC_NO, KC_BSPC,
    OSM(MOD_LCTL), CUS_AACU, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,
    KC_TRNS, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, CUS_NTIL, KC_NO, KC_NO, KC_NO, KC_NO, KC_TRNS,
    KC_ESC, IQWERT, KC_NO, OSM(MOD_LGUI), OSM(MOD_LALT), NAV, KC_SPC, NIQWER, KC_TRNS, KC_NO, KC_NO, QWERTY),

	[_NUMBER_INVERSE_QWERTY] = LAYOUT_ortho_4x12(
    CU_GRV, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, ES_BSLS, ES_LBRC, ES_RBRC, KC_BSPC,
    KC_1, KC_2, KC_3, KC_4, KC_5, KC_6, KC_7, KC_8, KC_9, KC_0, ES_MINS, ES_EQL,
    NISQWE, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, OSM(MOD_LCTL), KC_COMM, KC_DOT, ES_SLSH, NISQWE,
    KC_ESC, KC_NO, KC_NO, OSM(MOD_LGUI), OSM(MOD_LALT), KC_TRNS, KC_SPC, NAV, OSM(MOD_RALT), KC_NO, KC_NO, QWERTY),

	[_NUMBER_SHIFTED_INVERSE_QWERTY] = LAYOUT_ortho_4x12(
    ES_TILD, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, ES_PIPE, ES_LCBR, ES_RCBR, KC_BSPC,
    ES_EXLM, ES_AT, ES_HASH, ES_DLR, ES_PERC, CU_CIRC, ES_AMPR, ES_ASTR, ES_LPRN, ES_RPRN, ES_UNDS, ES_PLUS,
    KC_TRNS, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, OSM(MOD_LCTL), KC_COMM, KC_DOT, ES_SLSH, OSM(MOD_RSFT),
    KC_ESC, KC_NO, KC_NO, OSM(MOD_LGUI), OSM(MOD_LALT), KC_TRNS, KC_SPC, NAV, OSM(MOD_RALT), KC_NO, KC_NO, QWERTY),
};


void keyboard_post_init_user(void) {
  // Customise these values to desired behaviour
  debug_enable=true;
  // debug_matrix=true;
  // debug_keyboard=true;
  //debug_mouse=true;
}
