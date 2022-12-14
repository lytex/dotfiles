#pragma once

#define TAPPING_TOGGLE 2
#define ONESHOT_TAP_TOGGLE 2 /* Tapping this number of times holds the key until tapped once again. */
#define ONESHOT_TIMEOUT 500  /* Time (in ms) before the one shot key is released */
#define FORCE_NKRO
#define COMBO_COUNT 1
#define COMBO_TERM 50

#undef RGBLED_NUM
#define RGBLED_NUM 51
