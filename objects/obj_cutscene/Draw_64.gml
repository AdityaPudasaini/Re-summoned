// ==========================================
// obj_cutscene - DRAW GUI
// ==========================================

var _gw = display_get_gui_width();
var _gh = display_get_gui_height();


// ==========================================
// BUTTON SIZE / SCALE
// ==========================================

var _cx = skip_x + skip_w * 0.5;
var _cy = skip_y + skip_h * 0.5;

var _w = skip_w * skip_scale;
var _h = skip_h * skip_scale;

var _l = _cx - _w * 0.5;
var _r = _cx + _w * 0.5;
var _t = _cy - _h * 0.5;
var _b = _cy + _h * 0.5;


// Pointed/beveled ends
var _cut = 25;


// ==========================================
// PURPLE OUTER GLOW
// ==========================================

for (var i = 5; i >= 1; i--)
{
    var _g = i * 5;

    draw_set_alpha(
        skip_hover
        ? 0.025 * (6 - i)
        : 0.012 * (6 - i)
    );

    draw_set_color(
        make_color_rgb(145, 65, 255)
    );

    draw_primitive_begin(pr_trianglefan);

    draw_vertex(_cx, _cy);

    draw_vertex(_l - _g + _cut, _t - _g);
    draw_vertex(_r + _g - _cut, _t - _g);
    draw_vertex(_r + _g, _cy);
    draw_vertex(_r + _g - _cut, _b + _g);
    draw_vertex(_l - _g + _cut, _b + _g);
    draw_vertex(_l - _g, _cy);
    draw_vertex(_l - _g + _cut, _t - _g);

    draw_primitive_end();
}


// ==========================================
// OUTER DARK SHADOW
// ==========================================

draw_set_alpha(0.75);
draw_set_color(c_black);

draw_primitive_begin(pr_trianglefan);

draw_vertex(_cx + 5, _cy + 7);

draw_vertex(_l - 3 + _cut, _t + 5);
draw_vertex(_r + 3 - _cut, _t + 5);
draw_vertex(_r + 3, _cy + 7);
draw_vertex(_r + 3 - _cut, _b + 5);
draw_vertex(_l - 3 + _cut, _b + 5);
draw_vertex(_l - 3, _cy + 7);
draw_vertex(_l - 3 + _cut, _t + 5);

draw_primitive_end();


// ==========================================
// MAIN FANTASY PANEL
// ==========================================

draw_set_alpha(0.97);

draw_set_color(
    make_color_rgb(27, 15, 38)
);

draw_primitive_begin(pr_trianglefan);

draw_vertex(_cx, _cy);

draw_vertex(_l + _cut, _t);
draw_vertex(_r - _cut, _t);
draw_vertex(_r, _cy);
draw_vertex(_r - _cut, _b);
draw_vertex(_l + _cut, _b);
draw_vertex(_l, _cy);
draw_vertex(_l + _cut, _t);

draw_primitive_end();


// ==========================================
// INNER PURPLE PANEL
// ==========================================

draw_set_color(
    make_color_rgb(43, 22, 58)
);

draw_primitive_begin(pr_trianglefan);

draw_vertex(_cx, _cy);

draw_vertex(_l + _cut + 5, _t + 5);
draw_vertex(_r - _cut - 5, _t + 5);
draw_vertex(_r - 5, _cy);
draw_vertex(_r - _cut - 5, _b - 5);
draw_vertex(_l + _cut + 5, _b - 5);
draw_vertex(_l + 5, _cy);
draw_vertex(_l + _cut + 5, _t + 5);

draw_primitive_end();


// ==========================================
// GOLD OUTER BORDER
// ==========================================

draw_set_alpha(1);

draw_set_color(
    make_color_rgb(232, 193, 104)
);

draw_primitive_begin(pr_linestrip);

draw_vertex(_l + _cut, _t);
draw_vertex(_r - _cut, _t);
draw_vertex(_r, _cy);
draw_vertex(_r - _cut, _b);
draw_vertex(_l + _cut, _b);
draw_vertex(_l, _cy);
draw_vertex(_l + _cut, _t);

draw_primitive_end();


// ==========================================
// DARK GOLD INNER BORDER
// ==========================================

draw_set_color(
    make_color_rgb(105, 70, 39)
);

draw_primitive_begin(pr_linestrip);

draw_vertex(_l + _cut + 5, _t + 5);
draw_vertex(_r - _cut - 5, _t + 5);
draw_vertex(_r - 5, _cy);
draw_vertex(_r - _cut - 5, _b - 5);
draw_vertex(_l + _cut + 5, _b - 5);
draw_vertex(_l + 5, _cy);
draw_vertex(_l + _cut + 5, _t + 5);

draw_primitive_end();


// ==========================================
// BRIGHT INNER GOLD LINE
// ==========================================

draw_set_color(
    make_color_rgb(248, 216, 137)
);

draw_line(
    _l + _cut + 12,
    _t + 8,
    _r - _cut - 12,
    _t + 8
);

draw_line(
    _l + _cut + 12,
    _b - 8,
    _r - _cut - 12,
    _b - 8
);


// ==========================================
// CORNER ORNAMENTS
// ==========================================

var _orn = 13;


// TOP LEFT
draw_set_color(
    make_color_rgb(242, 205, 120)
);

draw_triangle(
    _l + 5,
    _t + _orn,
    _l + 5 + _orn,
    _t + 5,
    _l + 18,
    _t + 18,
    false
);


// TOP RIGHT
draw_triangle(
    _r - 5,
    _t + _orn,
    _r - 5 - _orn,
    _t + 5,
    _r - 18,
    _t + 18,
    false
);


// BOTTOM LEFT
draw_triangle(
    _l + 5,
    _b - _orn,
    _l + 5 + _orn,
    _b - 5,
    _l + 18,
    _b - 18,
    false
);


// BOTTOM RIGHT
draw_triangle(
    _r - 5,
    _b - _orn,
    _r - 5 - _orn,
    _b - 5,
    _r - 18,
    _b - 18,
    false
);


// ==========================================
// CENTER DIAMOND GEM
// ==========================================

var _gem_x = _l + 52;
var _gem_y = _cy;

var _gem_size = 14;


// Purple glow
draw_set_alpha(0.18);

draw_set_color(
    make_color_rgb(150, 65, 255)
);

draw_circle(
    _gem_x,
    _gem_y,
    27 + sin(button_pulse) * 3,
    false
);


// Outer gold diamond
draw_set_alpha(1);

draw_set_color(
    make_color_rgb(235, 197, 105)
);

draw_triangle(
    _gem_x,
    _gem_y - _gem_size - 5,
    _gem_x + _gem_size + 5,
    _gem_y,
    _gem_x,
    _gem_y + _gem_size + 5,
    false
);

draw_triangle(
    _gem_x,
    _gem_y - _gem_size - 5,
    _gem_x - _gem_size - 5,
    _gem_y,
    _gem_x,
    _gem_y + _gem_size + 5,
    false
);


// Purple crystal
draw_set_color(
    make_color_rgb(135, 65, 230)
);

draw_triangle(
    _gem_x,
    _gem_y - _gem_size,
    _gem_x + _gem_size,
    _gem_y,
    _gem_x,
    _gem_y + _gem_size,
    false
);

draw_triangle(
    _gem_x,
    _gem_y - _gem_size,
    _gem_x - _gem_size,
    _gem_y,
    _gem_x,
    _gem_y + _gem_size,
    false
);


// Crystal highlight
draw_set_color(c_white);
draw_set_alpha(0.85);

draw_circle(
    _gem_x - 4,
    _gem_y - 5,
    2,
    false
);

// ==========================================
// SKIP TEXT - BIGGER
// ==========================================

draw_set_alpha(1);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);


// Text glow when hovering
if (skip_hover)
{
    draw_set_alpha(0.35);

    draw_set_color(
        make_color_rgb(170, 80, 255)
    );

    draw_text_transformed(
        _cx + 35,
        _cy + 1,
        "SKIP  >>",
        1.35,
        1.35,
        0
    );
}


// Main large gold text
draw_set_alpha(1);

draw_set_color(
    make_color_rgb(249, 224, 165)
);

draw_text_transformed(
    _cx + 35,
    _cy,
    "SKIP  >>",
    1.35,
    1.35,
    0
);


// ==========================================
// WHITE FLASH
// ==========================================

if (flash_alpha > 0)
{
    draw_set_alpha(flash_alpha);
    draw_set_color(c_white);

    draw_rectangle(
        0,
        0,
        _gw,
        _gh,
        false
    );

    draw_set_alpha(1);
}


// Reset
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);