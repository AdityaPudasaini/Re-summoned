// =====================================================
// VOID GOD BACKGROUND
// =====================================================

draw_set_alpha(1);
draw_set_color(c_white);

draw_sprite_stretched(
    sprIntroBackground,
    0,
    0,
    0,
    room_width,
    room_height
);


// =====================================================
// DIALOGUE SETTINGS
// =====================================================

draw_set_font(fntIntro);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _textX = room_width / 2;
var _textY = room_height * 0.68;


// =====================================================
// MAIN DIALOGUE
// =====================================================

// Slight soft shadow behind the text
draw_set_alpha(0.35);
draw_set_color(c_black);

draw_text(
    _textX + 2,
    _textY + 2,
    displayText
);


// Main white text
draw_set_alpha(1);
draw_set_color(c_white);

draw_text(
    _textX,
    _textY,
    displayText
);


// =====================================================
// DECORATIVE LINE
// =====================================================

draw_set_alpha(0.7);
draw_set_color(c_white);

var _lineY = room_height * 0.78;
var _lineWidth = 180;


// Left line
draw_line(
    _textX - _lineWidth,
    _lineY,
    _textX - 25,
    _lineY
);


// Right line
draw_line(
    _textX + 25,
    _lineY,
    _textX + _lineWidth,
    _lineY
);


// =====================================================
// CENTER DIAMOND ORNAMENT
// =====================================================

draw_set_alpha(1);
draw_set_color(c_white);

// Diamond size
var _diamondSize = 8;

// Diamond points
draw_primitive_begin(pr_trianglefan);

draw_vertex(
    _textX,
    _lineY - _diamondSize
);

draw_vertex(
    _textX + _diamondSize,
    _lineY
);

draw_vertex(
    _textX,
    _lineY + _diamondSize
);

draw_vertex(
    _textX - _diamondSize,
    _lineY
);

draw_vertex(
    _textX,
    _lineY - _diamondSize
);

draw_primitive_end();

// =====================================================
// PRESS SPACE MESSAGE
// =====================================================

if (waitingForNext)
{
    draw_set_font(fntIntro);

    draw_set_alpha(0.7);
    draw_set_color(c_white);

    draw_text(
        _textX,
        room_height * 0.88,
        "Press SPACE to continue"
    );

    draw_set_alpha(1);
}

// =====================================================
// SKIP BUTTON
// =====================================================

draw_set_font(fntIntro);

draw_set_halign(fa_right);
draw_set_valign(fa_middle);

draw_set_alpha(0.7);
draw_set_color(c_white);

draw_text(
    room_width - 80,
    room_height * 0.88,
    "Skip  ▶"
);

draw_set_alpha(1);

// =====================================================
// FADE OVERLAY
// =====================================================

if (fadeAlpha > 0)
{
    draw_set_alpha(fadeAlpha);
    draw_set_color(c_black);

    draw_rectangle(
        0,
        0,
        room_width,
        room_height,
        false
    );

    draw_set_alpha(1);
}

// =====================================================
// WHITE FLASH
// =====================================================

if (flashAlpha > 0)
{
    draw_set_alpha(flashAlpha);
    draw_set_color(c_white);

    draw_rectangle(
        0,
        0,
        room_width,
        room_height,
        false
    );

    draw_set_alpha(1);
}
// =====================================================
// RESET DRAW SETTINGS
// =====================================================

draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);