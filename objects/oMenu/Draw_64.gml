var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);


// =====================================================
// OPTIONS SCREEN
// =====================================================

if (options_open)
{
    // -------------------------------------------------
    // DARK BACKGROUND
    // -------------------------------------------------

    draw_set_color(make_color_rgb(10, 10, 15));
    draw_set_alpha(0.92);

    draw_rectangle(
        0,
        0,
        gui_w,
        gui_h,
        false
    );


    // -------------------------------------------------
    // OPTIONS PANEL
    // -------------------------------------------------

    var panel_x1 = 420;
    var panel_y1 = 100;

    var panel_x2 = 970;
    var panel_y2 = 500;


    // Panel background

    draw_set_color(make_color_rgb(35, 28, 25));
    draw_set_alpha(0.98);

    draw_roundrect(
        panel_x1,
        panel_y1,
        panel_x2,
        panel_y2,
        true
    );


    // Golden border

    draw_set_color(make_color_rgb(180, 130, 45));
    draw_set_alpha(1);

    draw_roundrect(
        panel_x1,
        panel_y1,
        panel_x2,
        panel_y2,
        false
    );


    // -------------------------------------------------
    // TITLE
    // -------------------------------------------------

    draw_set_color(make_color_rgb(220, 180, 80));

    draw_set_halign(fa_center);

    draw_text(
        (panel_x1 + panel_x2) / 2,
        panel_y1 + 45,
        "OPTIONS"
    );


    // -------------------------------------------------
    // OPTION POSITIONS
    // -------------------------------------------------

    var option_x = 520;

    var option_start_y = 190;

    var option_spacing = 55;


    // =================================================
    // MUSIC
    // =================================================

    draw_set_halign(fa_left);

    if (options_selected == 0)
        draw_set_color(make_color_rgb(255, 200, 70));
    else
        draw_set_color(c_white);


    draw_text(
        option_x,
        option_start_y,
        "MUSIC"
    );


    // Music slider

    var slider_x1 = 700;
    var slider_x2 = 880;

    var slider_y = option_start_y + 8;


    // Empty slider

    draw_set_color(make_color_rgb(60, 60, 65));

    draw_rectangle(
        slider_x1,
        slider_y - 4,
        slider_x2,
        slider_y + 4,
        false
    );


    // Filled slider

    draw_set_color(make_color_rgb(220, 180, 70));

    draw_rectangle(
        slider_x1,
        slider_y - 4,
        slider_x1 + ((slider_x2 - slider_x1) * music_volume),
        slider_y + 4,
        false
    );


    // Slider knob

    draw_circle(
        slider_x1 + ((slider_x2 - slider_x1) * music_volume),
        slider_y,
        8,
        false
    );


    // =================================================
    // SFX
    // =================================================

    if (options_selected == 1)
        draw_set_color(make_color_rgb(255, 200, 70));
    else
        draw_set_color(c_white);


    draw_text(
        option_x,
        option_start_y + option_spacing,
        "SFX"
    );


    slider_y = option_start_y + option_spacing + 8;


    // Empty slider

    draw_set_color(make_color_rgb(60, 60, 65));

    draw_rectangle(
        slider_x1,
        slider_y - 4,
        slider_x2,
        slider_y + 4,
        false
    );


    // Filled slider

    draw_set_color(make_color_rgb(220, 180, 70));

    draw_rectangle(
        slider_x1,
        slider_y - 4,
        slider_x1 + ((slider_x2 - slider_x1) * sfx_volume),
        slider_y + 4,
        false
    );


    // Slider knob

    draw_circle(
        slider_x1 + ((slider_x2 - slider_x1) * sfx_volume),
        slider_y,
        8,
        false
    );


    // =================================================
    // MASTER
    // =================================================

    if (options_selected == 2)
        draw_set_color(make_color_rgb(255, 200, 70));
    else
        draw_set_color(c_white);


    draw_text(
        option_x,
        option_start_y + option_spacing * 2,
        "MASTER"
    );


    slider_y = option_start_y + option_spacing * 2 + 8;


    // Empty slider

    draw_set_color(make_color_rgb(60, 60, 65));

    draw_rectangle(
        slider_x1,
        slider_y - 4,
        slider_x2,
        slider_y + 4,
        false
    );


    // Filled slider

    draw_set_color(make_color_rgb(220, 180, 70));

    draw_rectangle(
        slider_x1,
        slider_y - 4,
        slider_x1 + ((slider_x2 - slider_x1) * master_volume),
        slider_y + 4,
        false
    );


    // Slider knob

    draw_circle(
        slider_x1 + ((slider_x2 - slider_x1) * master_volume),
        slider_y,
        8,
        false
    );


    // =================================================
    // FULLSCREEN
    // =================================================

    if (options_selected == 3)
        draw_set_color(make_color_rgb(255, 200, 70));
    else
        draw_set_color(c_white);


    draw_set_halign(fa_left);

    draw_text(
        option_x,
        option_start_y + option_spacing * 3,
        "FULLSCREEN"
    );


    // Fullscreen ON / OFF

    draw_set_halign(fa_right);

    if (window_get_fullscreen())
    {
        draw_text(
            slider_x2,
            option_start_y + option_spacing * 3,
            "ON"
        );
    }
    else
    {
        draw_text(
            slider_x2,
            option_start_y + option_spacing * 3,
            "OFF"
        );
    }


    // =================================================
    // BACK
    // =================================================

    draw_set_halign(fa_center);

    if (options_selected == 4)
        draw_set_color(make_color_rgb(255, 200, 70));
    else
        draw_set_color(c_white);


    draw_text(
        (panel_x1 + panel_x2) / 2,
        panel_y2 - 45,
        "BACK"
    );


    // =================================================
    // RESET
    // =================================================

    draw_set_alpha(1);
    draw_set_color(c_white);

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);


    // =================================================
    // IMPORTANT
    // =================================================
    // Do NOT draw the original menu underneath.

    exit;
}


// =====================================================
// NORMAL MAIN MENU
// =====================================================

for (var i = 0; i < array_length(menu_items); i++)
{
    var active = (i == menu_selected);

    var x1 = 560;
    var x2 = 835;

    var y1 = button_y[i];
    var y2 = button_y[i] + button_h;


    if (active)
    {
        var glow_color = make_color_rgb(255, 190, 40);


        // HUGE OUTER GLOW

        draw_set_color(glow_color);
        draw_set_alpha(0.08);

        draw_roundrect(
            x1 - 12,
            y1 - 12,
            x2 + 12,
            y2 + 12,
            true
        );


        // LARGE GLOW

        draw_set_alpha(0.12);

        draw_roundrect(
            x1 - 9,
            y1 - 9,
            x2 + 9,
            y2 + 9,
            true
        );


        // MEDIUM GLOW

        draw_set_alpha(0.18);

        draw_roundrect(
            x1 - 6,
            y1 - 6,
            x2 + 6,
            y2 + 6,
            true
        );


        // STRONG GLOW

        draw_set_alpha(0.25);

        draw_roundrect(
            x1 - 3,
            y1 - 3,
            x2 + 3,
            y2 + 3,
            true
        );


        // GOLDEN TINT

        draw_set_alpha(0.30);

        draw_roundrect(
            x1,
            y1,
            x2,
            y2,
            true
        );


        // INNER GLOW

        draw_set_alpha(0.18);

        draw_roundrect(
            x1 + 5,
            y1 + 5,
            x2 - 5,
            y2 - 5,
            true
        );
    }
}


// =====================================================
// RESET
// =====================================================

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);