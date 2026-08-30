// =====================================================
// IFRIT BOSS UI
// =====================================================

if (dead)
{
    exit;
}


// =====================================================
// DEBUG INFO
// =====================================================

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);



// =====================================================
// SETTINGS
// =====================================================

var _bar_width  = 500;
var _bar_height = 24;

var _bar_x =
    (display_get_gui_width() - _bar_width) / 2;

var _bar_y = 45;

var _name_y = _bar_y - 22;


// =====================================================
// HEALTH PERCENTAGE
// =====================================================

var _current_health =
    clamp(
        boss_hp,
        0,
        boss_max_hp
    );

var _health_percent =
    _current_health / boss_max_hp;


// =====================================================
// BOSS NAME
// =====================================================

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(c_white);

draw_text_transformed(
    display_get_gui_width() / 2,
    _name_y,
    "IFRIT: The Flame of Destruction",
    1.5,
    1.5,
    0
);


// =====================================================
// HEALTH BAR BACKGROUND
// =====================================================

draw_set_color(c_black);

draw_rectangle(
    _bar_x - 4,
    _bar_y - 4,
    _bar_x + _bar_width + 4,
    _bar_y + _bar_height + 4,
    false
);


// =====================================================
// HEALTH BAR
// =====================================================

draw_set_color(c_red);

draw_rectangle(
    _bar_x,
    _bar_y,
    _bar_x + (_bar_width * _health_percent),
    _bar_y + _bar_height,
    false
);


// =====================================================
// BAR BORDER
// =====================================================

draw_set_color(c_white);

draw_rectangle(
    _bar_x,
    _bar_y,
    _bar_x + _bar_width,
    _bar_y + _bar_height,
    true
);


// =====================================================
// RESET DRAW SETTINGS
// =====================================================

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);