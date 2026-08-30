// =====================================================
// GOD ENDING CUTSCENE - DRAW
// =====================================================

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();


// =====================================================
// INTRO BACKGROUND
// =====================================================

draw_set_alpha(1);
draw_set_color(c_white);

draw_sprite_stretched(
    sprIntroBackground,
    0,
    0,
    0,
    gui_w,
    gui_h
);


// =====================================================
// FINAL BANG
// =====================================================

if (ending_bang)
{
    if (bang_timer < 8)
    {
        draw_set_color(c_white);
        draw_set_alpha(1);

        draw_rectangle(
            0,
            0,
            gui_w,
            gui_h,
            false
        );
    }

    if (bang_timer >= 8)
    {
        draw_set_color(c_black);
        draw_set_alpha(fade_alpha);

        draw_rectangle(
            0,
            0,
            gui_w,
            gui_h,
            false
        );
    }

    if (bang_timer >= 55)
    {
        draw_set_color(c_white);
        draw_set_alpha(1);

        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);

        draw_text(
            gui_w / 2,
            gui_h / 2,
            "THE END"
        );
    }

    draw_set_alpha(1);
    draw_set_color(c_white);

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    exit;
}


// =====================================================
// DIALOGUE BOX
// =====================================================

var box_x1 = 100;
var box_y1 = gui_h - 190;

var box_x2 = gui_w - 100;
var box_y2 = gui_h - 55;


// =====================================================
// DARK BOX
// =====================================================

draw_set_color(make_color_rgb(10, 10, 15));
draw_set_alpha(0.90);

draw_rectangle(
    box_x1,
    box_y1,
    box_x2,
    box_y2,
    false
);


// =====================================================
// GOLD BORDER
// =====================================================

draw_set_color(make_color_rgb(180, 130, 45));
draw_set_alpha(1);

draw_rectangle(
    box_x1,
    box_y1,
    box_x2,
    box_y2,
    true
);


// =====================================================
// INNER BOX
// =====================================================

draw_set_color(make_color_rgb(10, 10, 15));
draw_set_alpha(0.96);

draw_rectangle(
    box_x1 + 3,
    box_y1 + 3,
    box_x2 - 3,
    box_y2 - 3,
    false
);


// =====================================================
// SPEAKER
// =====================================================

draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (current_speaker == "GOD")
{
    draw_set_color(make_color_rgb(220, 180, 80));
}
else
{
    draw_set_color(c_white);
}

draw_text(
    box_x1 + 25,
    box_y1 + 15,
    current_speaker
);


// =====================================================
// DIALOGUE TEXT
// =====================================================

draw_set_color(c_white);

var visible_text = string_copy(
    current_text,
    1,
    floor(text_progress)
);

draw_text(
    box_x1 + 25,
    box_y1 + 55,
    visible_text
);


// =====================================================
// CONTINUE ARROW
// =====================================================

if (text_progress >= string_length(current_text))
{
    draw_set_color(make_color_rgb(220, 180, 70));

    draw_text(
        box_x2 - 35,
        box_y2 - 30,
        ">"
    );
}


// =====================================================
// RESET
// =====================================================

draw_set_alpha(1);
draw_set_color(c_white);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
