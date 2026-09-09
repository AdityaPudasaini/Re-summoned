// ==========================================
// oTrueEnding - STEP
// ==========================================

var _gw = display_get_gui_width();
var _gh = display_get_gui_height();


// ==========================================
// BUTTON POSITION
// ==========================================

skip_x = _gw - skip_w - 14;
skip_y = _gh - skip_h - 15;


// ==========================================
// MOUSE
// ==========================================

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);


// ==========================================
// SKIP BUTTON
// ONLY ACTIVE DURING VIDEO
// ==========================================

if (ending_phase == 0)
{
    skip_hover = point_in_rectangle(
        _mx,
        _my,
        skip_x - 5,
        skip_y - 5,
        skip_x + skip_w + 5,
        skip_y + skip_h + 5
    );
}
else
{
    // Make absolutely sure the button
    // is no longer active after video.

    skip_hover = false;
}


// ==========================================
// BUTTON ANIMATION
// ==========================================

if (ending_phase == 0)
{
    if (skip_hover)
    {
        skip_scale =
            lerp(
                skip_scale,
                1.035,
                0.15
            );
    }
    else
    {
        skip_scale =
            lerp(
                skip_scale,
                1,
                0.15
            );
    }

    button_pulse += 0.06;
}
else
{
    skip_scale = 1;
}


// ==========================================
// SKIP VIDEO
// ==========================================

if (ending_phase == 0)
{
    if (
        skip_hover &&
        mouse_check_button_pressed(mb_left)
    )
    {
        // Close video
        video_close();


        // Final BANG
        audio_play_sound(
            sndIntroBang,
            10,
            false
        );


        // White flash
        flash_alpha = 1;


        // Go to flash
        ending_phase = 1;

        ending_timer = 0;

        ending_alpha = 0;


        // IMPORTANT:
        // Disable skip immediately.

        skip_hover = false;
    }
}


// ==========================================
// WHITE FLASH
// ==========================================

if (ending_phase == 1)
{
    ending_timer++;


    flash_alpha -= 0.08;


    if (flash_alpha < 0)
    {
        flash_alpha = 0;
    }


    // After flash
    if (ending_timer >= 15)
    {
        ending_phase = 2;

        ending_timer = 0;

        ending_alpha = 0;


        // Make absolutely sure skip is gone.

        skip_hover = false;
    }
}


// ==========================================
// THE END SCREEN
// ==========================================

if (ending_phase == 2)
{
    ending_timer++;


    ending_alpha =
        min(
            1,
            ending_alpha + 0.025
        );


    // Make absolutely sure the
    // skip button cannot come back.

    skip_hover = false;

    skip_scale = 1;
}