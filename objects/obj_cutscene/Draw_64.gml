// ==========================================
// oTrueEnding - DRAW GUI
// OPAQUE MINIMAX-STYLE SKIP BUTTON
// ==========================================

var _gw = display_get_gui_width();
var _gh = display_get_gui_height();


// ==========================================
// BUTTON SIZE
// ==========================================

var _cx = skip_x + skip_w * 0.5;
var _cy = skip_y + skip_h * 0.5;

var _w = skip_w * skip_scale;
var _h = skip_h * skip_scale;

var _l = _cx - _w * 0.5;
var _r = _cx + _w * 0.5;
var _t = _cy - _h * 0.5;
var _b = _cy + _h * 0.5;

var _point = 20;


// ==========================================
// OUTER GLOW
// ==========================================

for (var i = 4; i >= 1; i--)
{
    var _g = i * 3;

    draw_set_alpha(
        skip_hover
        ? 0.04 * (5 - i)
        : 0.018 * (5 - i)
    );

    draw_set_color(
        make_color_rgb(150, 70, 255)
    );

    draw_primitive_begin(pr_linestrip);

    draw_vertex(_l - _g + _point, _t - _g);
    draw_vertex(_r + _g - _point, _t - _g);
    draw_vertex(_r + _g, _cy);
    draw_vertex(_r + _g - _point, _b + _g);
    draw_vertex(_l - _g + _point, _b + _g);
    draw_vertex(_l - _g, _cy);
    draw_vertex(_l - _g + _point, _t - _g);

    draw_primitive_end();
}


// ==========================================
// SHADOW
// ==========================================

draw_set_alpha(1);
draw_set_color(c_black);

draw_primitive_begin(pr_trianglefan);

draw_vertex(_cx + 4, _cy + 5);

draw_vertex(_l + _point, _t + 5);
draw_vertex(_r - _point, _t + 5);
draw_vertex(_r, _cy + 5);
draw_vertex(_r - _point, _b + 5);
draw_vertex(_l + _point, _b + 5);
draw_vertex(_l, _cy + 5);
draw_vertex(_l + _point, _t + 5);

draw_primitive_end();


// ==========================================
// SOLID BUTTON BACKGROUND
// ==========================================

// IMPORTANT:
// FULLY OPAQUE — HIDES WATERMARK COMPLETELY

draw_set_alpha(1);

draw_set_color(
    make_color_rgb(18, 10, 29)
);

draw_primitive_begin(pr_trianglefan);

draw_vertex(_cx, _cy);

draw_vertex(_l + _point, _t);
draw_vertex(_r - _point, _t);
draw_vertex(_r, _cy);
draw_vertex(_r - _point, _b);
draw_vertex(_l + _point, _b);
draw_vertex(_l, _cy);
draw_vertex(_l + _point, _t);

draw_primitive_end();


// ==========================================
// SUBTLE INNER PURPLE
// ==========================================

draw_set_alpha(1);

draw_set_color(
    make_color_rgb(30, 15, 45)
);

draw_primitive_begin(pr_trianglefan);

draw_vertex(_cx, _cy);

draw_vertex(_l + _point + 5, _t + 5);
draw_vertex(_r - _point - 5, _t + 5);
draw_vertex(_r - 5, _cy);
draw_vertex(_r - _point - 5, _b - 5);
draw_vertex(_l + _point + 5, _b - 5);
draw_vertex(_l + 5, _cy);
draw_vertex(_l + _point + 5, _t + 5);

draw_primitive_end();


// ==========================================
// PURPLE OUTLINE
// ==========================================

draw_set_alpha(1);

draw_set_color(
    make_color_rgb(190, 110, 255)
);

draw_primitive_begin(pr_linestrip);

draw_vertex(_l + _point, _t);
draw_vertex(_r - _point, _t);
draw_vertex(_r, _cy);
draw_vertex(_r - _point, _b);
draw_vertex(_l + _point, _b);
draw_vertex(_l, _cy);
draw_vertex(_l + _point, _t);

draw_primitive_end();


// ==========================================
// INNER PURPLE LINE
// ==========================================

draw_set_alpha(0.8);

draw_set_color(
    make_color_rgb(105, 55, 160)
);

draw_primitive_begin(pr_linestrip);

draw_vertex(_l + _point + 5, _t + 5);
draw_vertex(_r - _point - 5, _t + 5);
draw_vertex(_r - 5, _cy);
draw_vertex(_r - _point - 5, _b - 5);
draw_vertex(_l + _point + 5, _b - 5);
draw_vertex(_l + 5, _cy);
draw_vertex(_l + _point + 5, _t + 5);

draw_primitive_end();


// ==========================================
// SIDE DIAMONDS
// ==========================================

draw_set_alpha(1);

draw_set_color(
    make_color_rgb(200, 125, 255)
);

var _dy = _cy;


// LEFT

var _dx = _l - 8;

draw_triangle(
    _dx,
    _dy - 4,
    _dx + 5,
    _dy,
    _dx,
    _dy + 4,
    false
);

draw_triangle(
    _dx,
    _dy - 4,
    _dx - 5,
    _dy,
    _dx,
    _dy + 4,
    false
);


// RIGHT

_dx = _r + 8;

draw_triangle(
    _dx,
    _dy - 4,
    _dx + 5,
    _dy,
    _dx,
    _dy + 4,
    false
);

draw_triangle(
    _dx,
    _dy - 4,
    _dx - 5,
    _dy,
    _dx,
    _dy + 4,
    false
);


// ==========================================
// SKIP ICON
// ==========================================

var _icon_x = _cx - 55;
var _icon_y = _cy;

draw_set_alpha(1);

draw_set_color(
    make_color_rgb(240, 220, 255)
);


// First triangle

draw_triangle(
    _icon_x - 13,
    _icon_y - 10,
    _icon_x - 13,
    _icon_y + 10,
    _icon_x - 1,
    _icon_y,
    false
);


// Second triangle

draw_triangle(
    _icon_x + 1,
    _icon_y - 10,
    _icon_x + 1,
    _icon_y + 10,
    _icon_x + 13,
    _icon_y,
    false
);


// ==========================================
// SKIP TEXT
// ==========================================

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(
    make_color_rgb(240, 220, 255)
);

draw_set_alpha(1);

draw_text_transformed(
    _cx + 28,
    _cy,
    "SKIP",
    1.15,
    1.15,
    0
);


// ==========================================
// HOVER EFFECT
// ==========================================

if (skip_hover)
{
    draw_set_alpha(0.15);

    draw_set_color(
        make_color_rgb(160, 75, 255)
    );

    draw_primitive_begin(pr_trianglefan);

    draw_vertex(_cx, _cy);

    draw_vertex(_l + _point, _t);
    draw_vertex(_r - _point, _t);
    draw_vertex(_r, _cy);
    draw_vertex(_r - _point, _b);
    draw_vertex(_l + _point, _b);
    draw_vertex(_l, _cy);
    draw_vertex(_l + _point, _t);

    draw_primitive_end();
}


// ==========================================
// RESET
// ==========================================

draw_set_alpha(1);
draw_set_color(c_white);

draw_set_halign(fa_left);
draw_set_valign(fa_top);