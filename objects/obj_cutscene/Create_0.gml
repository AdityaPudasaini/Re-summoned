// ==========================================
// obj_cutscene - CREATE
// ==========================================

// Open video
video_open("void_god_intro.mp4");

// Don't loop
video_enable_loop(false);


// ==========================================
// CUTSCENE
// ==========================================

cutscene_finished = false;
transition_timer = 0;
flash_alpha = 0;

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


// ==========================================
// ANIMATION
// ==========================================

button_pulse = 0;