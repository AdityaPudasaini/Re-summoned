// =====================================================
// GOD ENDING CUTSCENE - DRAW GUI
// =====================================================

var gui_w =
    display_get_gui_width();

var gui_h =
    display_get_gui_height();


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
// FINAL BANG / FAKE ENDING
// =====================================================

if (ending_bang)
{
    // =================================================
    // WHITE FLASH
    // =================================================

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


    // =================================================
    // BLACK FADE
    // =================================================

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


    // =================================================
    // STORY TEXT
    // =================================================

    if (bang_timer >= 55)
    {
        draw_set_font(fntIntro);

        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);

        draw_set_color(c_white);


        // =================================================
        // PHASE 0 - THE END
        // =================================================

        if (fake_ending_phase == 0)
        {
            draw_set_alpha(1);

            draw_text_transformed(
                gui_w / 2,
                gui_h / 2,
                "THE END",
                2.0,
                2.0,
                0
            );
        }


        // =================================================
        // PHASE 1 - QUESTION
        // =================================================

        else if (fake_ending_phase == 1)
        {
            draw_set_alpha(fake_ending_alpha);

            draw_text_transformed(
                gui_w / 2,
                gui_h / 2,
                "But can a hero's journey end like this?",
                1.05,
                1.05,
                0
            );
        }


        // =================================================
        // PHASE 2 - HERO JOURNEY
        // =================================================

        else if (fake_ending_phase == 2)
        {
            draw_set_alpha(fake_ending_alpha);

            draw_text_transformed(
                gui_w / 2,
                gui_h / 2,
                "The hero must prevail... and continue his journey.",
                1.05,
                1.05,
                0
            );
        }
    }


    // =================================================
    // RESET
    // =================================================

    draw_set_alpha(1);

    draw_set_color(c_white);

    draw_set_halign(fa_left);

    draw_set_valign(fa_top);

    draw_set_font(-1);

    exit;
}


// =====================================================
// DIALOGUE BOX
// =====================================================

var box_x1 = 100;

var box_y1 =
    gui_h - 190;

var box_x2 =
    gui_w - 100;

var box_y2 =
    gui_h - 55;


// =====================================================
// DARK BOX
// =====================================================

draw_set_color(
    make_color_rgb(
        10,
        10,
        15
    )
);

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

draw_set_color(
    make_color_rgb(
        180,
        130,
        45
    )
);

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

draw_set_color(
    make_color_rgb(
        10,
        10,
        15
    )
);

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
    draw_set_color(
        make_color_rgb(
            220,
            180,
            80
        )
    );
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


var visible_text =
    string_copy(
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

if (
    text_progress >=
    string_length(current_text)
)
{
    draw_set_color(
        make_color_rgb(
            220,
            180,
            70
        )
    );


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

draw_set_font(-1);