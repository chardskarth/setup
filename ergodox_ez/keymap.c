#include QMK_KEYBOARD_H
#include "version.h"

// KEYS
#define XXX KC_NO
#define ___ KC_TRNS

// LAYERS 
//
#define BASE 0
#define SYMB 1 
#define NAV 2 
#define GLOW 3

enum custom_keycodes {
  EPRM = SAFE_RANGE,
  VRSN,
  RGB_SLD
}; 

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

[BASE] = LAYOUT_ergodox(
  // left hand
  KC_ESC,          KC_1,        KC_2,          KC_3,    KC_4,         KC_5,      XXX,
  KC_TAB,          KC_Q,        KC_W,          KC_E,    KC_R,         KC_T,      XXX,
  KC_CAPS,         KC_A,        KC_S,          KC_D,    KC_F,         KC_G,
  OSM(KC_LSFT),    KC_Z,        KC_X,          KC_C,    KC_V,         KC_B,      XXX,
  KC_LCTL,         XXX,         KC_LALT,       KC_LGUI, MO(SYMB),
                                                                      XXX,       XXX,
                                                                                 XXX,
                                                        MO(NAV),      XXX,       XXX,
  // right hand
  MO(GLOW),        KC_6,        KC_7,          KC_8,    KC_9,         KC_0,      KC_BSLS,
  XXX,             KC_Y,        KC_U,          KC_I,    KC_O,         KC_P,      KC_BSPC,
                   KC_H,        KC_J,          KC_K,    KC_L,         KC_SCLN,   KC_ENT,
  XXX,             KC_N,        KC_M,          KC_COMM, KC_DOT,       KC_SLSH,   OSM(KC_RSFT),
  KC_SPC,          KC_RGUI,     KC_RALT,       XXX,     XXX, 
  XXX,             XXX,
  XXX,
  XXX,             XXX,     MO(NAV),
),

[SYMB] = LAYOUT_ergodox(
  // left hand
  KC_GRV,          ___,         ___,           ___,         ___,        ___,         ___,
  ___,             ___,         ___,           ___,         ___,        ___,         ___,
  ___,             ___,         ___,           ___,         ___,        ___,
  ___,             ___,         ___,           ___,         ___,        ___,         ___,
  ___,             ___,         ___,           ___,         ___,        ___,
                                                                        ___,         ___,
                                                                                     ___,
                                                            ___,        ___,         ___,
  // right hand
  ___,             KC_DEL,      ___,           KC_MIHS,     KC_EQL,     KC_BSLS,     ___,
  ___,             KC_7,        KC_8,          KC_9,        ___,        KC_LBRC,     KC_RBRC,
  ___,             KC_4,        KC_5,          KC_6,        ___,        KC_QUOT,     ___,
  ___,             KC_1,        KC_2,          KC_3,        ___,        ___,         ___,
  KC_0,            ___,         ___,           ___,
  ___,             ___,
  ___,
  __,              ___,         ___,
)

};


bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  if (record->event.pressed) {
    switch (keycode) {
      case EPRM:
        eeconfig_init();
        return false;
      case VRSN:
        SEND_STRING (QMK_KEYBOARD "/" QMK_KEYMAP " @ " QMK_VERSION);
        return false;
      #ifdef RGBLIGHT_ENABLE
      case RGB_SLD:
        rgblight_mode(1);
        return false;
      #endif
    }
  }
  return true;
}

// Runs just one time when the keyboard initializes.
void matrix_init_user(void) {
#ifdef RGBLIGHT_COLOR_LAYER_0
  rgblight_setrgb(RGBLIGHT_COLOR_LAYER_0);
#endif
};

// Runs whenever there is a layer state change.
uint32_t layer_state_set_user(uint32_t state) {
  ergodox_board_led_off();
  ergodox_right_led_1_off();
  ergodox_right_led_2_off();
  ergodox_right_led_3_off();

  uint8_t layer = biton32(state);
  switch (layer) {
      case 0:
        #ifdef RGBLIGHT_COLOR_LAYER_0
          rgblight_setrgb(RGBLIGHT_COLOR_LAYER_0);
        #else
        #ifdef RGBLIGHT_ENABLE
          rgblight_init();
        #endif
        #endif
        break;
      case 1:
        ergodox_right_led_1_on();
        #ifdef RGBLIGHT_COLOR_LAYER_1
          rgblight_setrgb(RGBLIGHT_COLOR_LAYER_1);
        #endif
        break;
      case 2:
        ergodox_right_led_2_on();
        #ifdef RGBLIGHT_COLOR_LAYER_2
          rgblight_setrgb(RGBLIGHT_COLOR_LAYER_2);
        #endif
        break;
      case 3:
        ergodox_right_led_3_on();
        #ifdef RGBLIGHT_COLOR_LAYER_3
          rgblight_setrgb(RGBLIGHT_COLOR_LAYER_3);
        #endif
        break;
      case 4:
        ergodox_right_led_1_on();
        ergodox_right_led_2_on();
        #ifdef RGBLIGHT_COLOR_LAYER_4
          rgblight_setrgb(RGBLIGHT_COLOR_LAYER_4);
        #endif
        break;
      case 5:
        ergodox_right_led_1_on();
        ergodox_right_led_3_on();
        #ifdef RGBLIGHT_COLOR_LAYER_5
          rgblight_setrgb(RGBLIGHT_COLOR_LAYER_5);
        #endif
        break;
      case 6:
        ergodox_right_led_2_on();
        ergodox_right_led_3_on();
        #ifdef RGBLIGHT_COLOR_LAYER_6
          rgblight_setrgb(RGBLIGHT_COLOR_LAYER_6);
        #endif
        break;
      case 7:
        ergodox_right_led_1_on();
        ergodox_right_led_2_on();
        ergodox_right_led_3_on();
        #ifdef RGBLIGHT_COLOR_LAYER_7
          rgblight_setrgb(RGBLIGHT_COLOR_LAYER_7);
        #endif
        break;
      default:
        break;
    }

  return state;
};
