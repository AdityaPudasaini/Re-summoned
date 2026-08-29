// Dialogue box dimensions
var box_w = 800;
var box_h = 125;

var box_x = (display_get_gui_width() - box_w) / 2;
var box_y = 555;

// =====================================================
// DARK TRANSPARENT BACKGROUND
// =====================================================

draw_set_alpha(dialogue_alpha * 0.82);
draw_set_color(make_color_rgb(10, 7, 18));

draw_rectangle(
    box_x,
    box_y,
    box_x + box_w,
    box_y + box_h,
    false
);


// =====================================================
// OUTER PURPLE BORDER
// =====================================================

draw_set_alpha(dialogue_alpha);
draw_set_color(make_color_rgb(130, 60, 180));

draw_rectangle(
    box_x,
    box_y,
    box_x + box_w,
    box_y + box_h,
    true
);


// =====================================================
// INNER BORDER
// =====================================================

draw_set_color(make_color_rgb(70, 35, 100));

draw_rectangle(
    box_x + 6,
    box_y + 6,
    box_x + box_w - 6,
    box_y + box_h - 6,
    true
);


// =====================================================
// DIALOGUE TEXT
// =====================================================

draw_set_font(-1);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(c_white);
draw_set_alpha(dialogue_alpha);


// Get currently typed text
var visible_text = string_copy(
    text,
    1,
    floor(text_position)
);


// =====================================================
// TEXT GLOW / SHADOW
// =====================================================

draw_set_alpha(dialogue_alpha * 0.35);
draw_set_color(make_color_rgb(150, 100, 200));

draw_text(
    box_x + box_w / 2 + 2,
    box_y + box_h / 2 + 2,
    visible_text
);


// =====================================================
// MAIN TEXT
// =====================================================

draw_set_alpha(dialogue_alpha);
draw_set_color(c_white);

draw_text(
    box_x + box_w / 2,
    box_y + box_h / 2,
    visible_text
);


// =====================================================
// RESET DRAWING
// =====================================================

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);