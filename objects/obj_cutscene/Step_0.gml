// ==========================================
// obj_cutscene - STEP
// ==========================================

var _gw = display_get_gui_width();
var _gh = display_get_gui_height();


// ==========================================
// BUTTON POSITION
// ==========================================

skip_x = _gw - skip_w - 25;
skip_y = _gh - skip_h - 18;


// ==========================================
// MOUSE
// ==========================================

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

skip_hover = point_in_rectangle(
    _mx,
    _my,
    skip_x - 5,
    skip_y - 5,
    skip_x + skip_w + 5,
    skip_y + skip_h + 5
);


// ==========================================
// BUTTON ANIMATION
// ==========================================

if (skip_hover)
{
    skip_scale = lerp(skip_scale, 1.035, 0.15);
}
else
{
    skip_scale = lerp(skip_scale, 1, 0.15);
}

button_pulse += 0.06;


// ==========================================
// SKIP
// ==========================================

if (skip_hover && mouse_check_button_pressed(mb_left))
{
    video_close();

    audio_play_sound(sndIntroBang, 10, false);

    flash_alpha = 1;
    cutscene_finished = true;
    transition_timer = 0;
}


// ==========================================
// WHITE FLASH
// ==========================================

if (cutscene_finished)
{
    transition_timer++;

    flash_alpha -= 0.08;

    if (flash_alpha < 0)
    {
        flash_alpha = 0;
    }

    if (transition_timer >= 25)
    {
        room_goto(SpawnPoint);
    }
}