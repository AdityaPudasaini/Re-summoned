// =====================================================
// oFireBossPrompt
// DRAW GUI EVENT
// =====================================================

if (!active)
{
    exit;
}


// =====================================================
// GUI SIZE
// =====================================================

var _gw = display_get_gui_width();
var _gh = display_get_gui_height();


// =====================================================
// BOX
// =====================================================

var _box_w = 800;
var _box_h = 125;

var _box_x = (_gw - _box_w) / 2;
var _box_y = _gh - 230;


// =====================================================
// BACKGROUND
// =====================================================

draw_set_alpha(0.90);

draw_set_color(
    make_color_rgb(10, 7, 18)
);

draw_rectangle(
    _box_x,
    _box_y,
    _box_x + _box_w,
    _box_y + _box_h,
    false
);


// =====================================================
// OUTER BORDER
// =====================================================

draw_set_alpha(1);

draw_set_color(
    make_color_rgb(130, 60, 180)
);

draw_rectangle(
    _box_x,
    _box_y,
    _box_x + _box_w,
    _box_y + _box_h,
    true
);


// =====================================================
// INNER BORDER
// =====================================================

draw_set_color(
    make_color_rgb(70, 35, 100)
);

draw_rectangle(
    _box_x + 6,
    _box_y + 6,
    _box_x + _box_w - 6,
    _box_y + _box_h - 6,
    true
);


// =====================================================
// QUESTION
// =====================================================

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(c_white);

draw_text(
    _gw / 2,
    _box_y + 30,
    "Enter the Fire Boss Room?"
);


// =====================================================
// ENTER
// =====================================================

if (selected == 0)
{
    draw_set_color(
        make_color_rgb(190, 100, 255)
    );

    draw_text(
        _gw / 2 - 120,
        _box_y + 90,
        "> ENTER <"
    );
}
else
{
    draw_set_color(c_white);

    draw_text(
        _gw / 2 - 120,
        _box_y + 90,
        "ENTER"
    );
}


// =====================================================
// EXIT
// =====================================================

if (selected == 1)
{
    draw_set_color(
        make_color_rgb(190, 100, 255)
    );

    draw_text(
        _gw / 2 + 120,
        _box_y + 90,
        "> EXIT <"
    );
}
else
{
    draw_set_color(c_white);

    draw_text(
        _gw / 2 + 120,
        _box_y + 90,
        "EXIT"
    );
}


// =====================================================
// RESET
// =====================================================

draw_set_alpha(1);

draw_set_color(c_white);

draw_set_halign(fa_left);
draw_set_valign(fa_top);