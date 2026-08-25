var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);


for (var i = 0; i < array_length(menu_items); i++)
{
    var active = (i == menu_selected);

    var x1 = 560;
    var x2 = 835;

    var y1 = button_y[i];
    var y2 = button_y[i] + button_h;

    if (active)
    {
        var glow_color = make_color_rgb(255, 190, 40);

        // HUGE OUTER GLOW
        draw_set_color(glow_color);
        draw_set_alpha(0.08);

        draw_roundrect(
            x1 - 12,
            y1 - 12,
            x2 + 12,
            y2 + 12,
            true
        );

        // LARGE GLOW
        draw_set_alpha(0.12);

        draw_roundrect(
            x1 - 9,
            y1 - 9,
            x2 + 9,
            y2 + 9,
            true
        );

        // MEDIUM GLOW
        draw_set_alpha(0.18);

        draw_roundrect(
            x1 - 6,
            y1 - 6,
            x2 + 6,
            y2 + 6,
            true
        );

        // STRONG GLOW
        draw_set_alpha(0.25);

        draw_roundrect(
            x1 - 3,
            y1 - 3,
            x2 + 3,
            y2 + 3,
            true
        );

        // STRONG GOLDEN TINT
        draw_set_alpha(0.30);

        draw_roundrect(
            x1,
            y1,
            x2,
            y2,
            true
        );

        // BRIGHT INNER GLOW
        draw_set_alpha(0.18);

        draw_roundrect(
            x1 + 5,
            y1 + 5,
            x2 - 5,
            y2 - 5,
            true
        );
    }
}

// Reset
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);