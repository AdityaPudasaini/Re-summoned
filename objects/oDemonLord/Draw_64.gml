// =====================================================
// DEMON LORD BOSS UI
// =====================================================


// =====================================================
// BOSS HP BAR
// =====================================================

if (!dead)
{
    var _bar_width = 500;
    var _bar_height = 24;

    var _bar_x =
        (display_get_gui_width() - _bar_width) / 2;

    var _bar_y = 45;

    var _name_y = _bar_y - 22;


    // -------------------------------------------------
    // HEALTH
    // -------------------------------------------------

    var _current_health =
        clamp(
            boss_hp,
            0,
            boss_max_hp
        );

    var _health_percent =
        _current_health / boss_max_hp;


    // -------------------------------------------------
    // BOSS NAME
    // -------------------------------------------------

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_set_color(c_white);

    draw_text_transformed(
        display_get_gui_width() / 2,
        _name_y,
        "DEMON LORD",
        1.5,
        1.5,
        0
    );


    // -------------------------------------------------
    // HEALTH BAR BACKGROUND
    // -------------------------------------------------

    draw_set_color(c_black);

    draw_rectangle(
        _bar_x - 4,
        _bar_y - 4,
        _bar_x + _bar_width + 4,
        _bar_y + _bar_height + 4,
        false
    );


    // -------------------------------------------------
    // HEALTH BAR
    // -------------------------------------------------

    draw_set_color(c_red);

    draw_rectangle(
        _bar_x,
        _bar_y,
        _bar_x + (_bar_width * _health_percent),
        _bar_y + _bar_height,
        false
    );


    // -------------------------------------------------
    // BAR BORDER
    // -------------------------------------------------

    draw_set_color(c_white);

    draw_rectangle(
        _bar_x,
        _bar_y,
        _bar_x + _bar_width,
        _bar_y + _bar_height,
        true
    );
}


// =====================================================
// DEATH DIALOGUE
// =====================================================

if (dead)
{
    var _gw = display_get_gui_width();
    var _gh = display_get_gui_height();


    // -------------------------------------------------
    // DIALOGUE BOX POSITION
    // -------------------------------------------------

    var _box_x1 = 55;
    var _box_x2 = _gw - 55;

    var _box_y1 = _gh - 210;
    var _box_y2 = _gh - 25;


    // -------------------------------------------------
    // BOX
    // -------------------------------------------------

    draw_set_color(make_color_rgb(10, 10, 15));
    draw_set_alpha(0.95);

    draw_rectangle(
        _box_x1,
        _box_y1,
        _box_x2,
        _box_y2,
        false
    );


    // -------------------------------------------------
    // BORDER
    // -------------------------------------------------

    draw_set_alpha(1);
    draw_set_color(make_color_rgb(180, 130, 45));

    draw_rectangle(
        _box_x1,
        _box_y1,
        _box_x2,
        _box_y2,
        true
    );


    // -------------------------------------------------
    // DEMON KING NAME
    // -------------------------------------------------

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    draw_set_color(make_color_rgb(220, 180, 80));

    draw_text(
        _box_x1 + 25,
        _box_y1 + 15,
        "DEMON KING"
    );


    // =================================================
    // DEATH DIALOGUE
    // ONE BOX / MULTIPLE SPACED LINES
    // =================================================

    draw_set_color(c_white);

    var _death_text =
        "I am the Demon King... I cannot lose.\n\n"
        + "After everything... after all I have done...\n\n"
        + "I was so close... freedom.\n\n"
        + "I only wanted freedom...\n\n"
        + "How... how did I lose to you?";


    draw_text_ext(
        _box_x1 + 25,
        _box_y1 + 55,
        _death_text,
        8,
        _box_x2 - _box_x1 - 50
    );


    // -------------------------------------------------
    // RESET
    // -------------------------------------------------

    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}


// =====================================================
// WHITE FLASH
// =====================================================

if (death_flash > 0)
{
    var _flash_w = display_get_gui_width();
    var _flash_h = display_get_gui_height();


    draw_set_color(c_white);

    draw_set_alpha(
        clamp(death_flash, 0, 1)
    );


    draw_rectangle(
        0,
        0,
        _flash_w,
        _flash_h,
        false
    );


    draw_set_alpha(1);
}


// =====================================================
// RESET DRAW SETTINGS
// =====================================================

draw_set_alpha(1);

draw_set_color(c_white);

draw_set_halign(fa_left);
draw_set_valign(fa_top);