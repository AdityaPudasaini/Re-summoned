// ==========================================
// oTrueEnding - CREATE
// ==========================================

// Open TRUE ENDING video
video_open("trueending.mp4");

// Don't loop
video_enable_loop(false);


// ==========================================
// ENDING STATES
// ==========================================

// 0 = Video
// 1 = White flash
// 2 = THE END

ending_phase = 0;

flash_alpha = 0;
ending_timer = 0;
ending_alpha = 0;


// ==========================================
// SKIP BUTTON
// ==========================================

skip_w = 360;
skip_h = 70;

skip_x = 0;
skip_y = 0;

skip_hover = false;
skip_scale = 1;

button_pulse = 0;