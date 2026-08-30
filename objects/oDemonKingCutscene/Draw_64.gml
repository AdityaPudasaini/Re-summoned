// =====================================================
// DEMON KING CUTSCENE - DRAW
// =====================================================

// Don't draw anything after the cutscene is finished
if (dialogue_done)
{
    exit;
}


// Safety check
if (cutscene_part < 0 ||
    cutscene_part >= array_length(dialogue))
{
    exit;
}


// Safety check for text line
if (text_line < 0 ||
    text_line >= array_length(dialogue[cutscene_part]))
{
    exit;
}


// =====================================================
// GUI
// =====================================================

var gw = display_get_gui_width();
var gh = display_get_gui_height();


// =====================================================
// DIALOGUE BOX
// =====================================================

var bx1 = 100;
var by1 = gh - 190;

var bx2 = gw - 100;
var by2 = gh - 50;


// Background
draw_set_alpha(0.92);

draw_set_color(
    make_color_rgb(10, 10, 15)
);

draw_rectangle(
    bx1,
    by1,
    bx2,
    by2,
    false
);


// Border
draw_set_alpha(1);

draw_set_color(
    make_color_rgb(180, 130, 45)
);

draw_rectangle(
    bx1,
    by1,
    bx2,
    by2,
    true
);


// =====================================================
// SPEAKER
// =====================================================

draw_set_halign(fa_left);
draw_set_valign(fa_top);


if (cutscene_part == 1)
{
    // MC

    draw_set_color(c_white);

    draw_text(
        bx1 + 25,
        by1 + 15,
        "MC"
    );
}
else
{
    // DEMON KING

    draw_set_color(
        make_color_rgb(220, 180, 80)
    );

    draw_text(
        bx1 + 25,
        by1 + 15,
        "DEMON KING"
    );
}


// =====================================================
// TEXT
// =====================================================

draw_set_color(c_white);

draw_text(
    bx1 + 25,
    by1 + 55,
    dialogue[cutscene_part][text_line]
);


// =====================================================
// CONTINUE
// =====================================================

draw_set_halign(fa_right);

draw_set_color(
    make_color_rgb(220, 180, 70)
);

draw_text(
    bx2 - 25,
    by2 - 30,
    ">"
);


// =====================================================
// RESET
// =====================================================

draw_set_alpha(1);

draw_set_color(c_white);

draw_set_halign(fa_left);
draw_set_valign(fa_top);