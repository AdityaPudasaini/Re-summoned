// =====================================================
// DEMON KING ROOM ENTRANCE - DRAW
// =====================================================

if (!prompt_active)
{
    exit;
}


var _gw = display_get_gui_width();
var _gh = display_get_gui_height();


// =====================================================
// PROMPT BOX
// =====================================================

var _box_width = 300;
var _box_height = 60;

var _box_x1 = (_gw - _box_width) / 2;
var _box_y1 = _gh - 110;

var _box_x2 = _box_x1 + _box_width;
var _box_y2 = _box_y1 + _box_height;


// =====================================================
// BACKGROUND
// =====================================================

draw_set_color(make_color_rgb(10, 10, 15));
draw_set_alpha(0.95);

draw_rectangle(
    _box_x1,
    _box_y1,
    _box_x2,
    _box_y2,
    false
);


// =====================================================
// BORDER
// =====================================================

draw_set_alpha(1);
draw_set_color(make_color_rgb(180, 130, 45));

draw_rectangle(
    _box_x1,
    _box_y1,
    _box_x2,
    _box_y2,
    true
);


// =====================================================
// TEXT
// =====================================================

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(
    (_box_x1 + _box_x2) / 2,
    (_box_y1 + _box_y2) / 2,
    "Press ENTER to enter"
);


// =====================================================
// RESET
// =====================================================

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);