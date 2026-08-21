var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

draw_set_font(-1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for (var i = 0; i < array_length(menu_items); i++)
{
    var active = (i == menu_selected);

    draw_set_color(c_black);
    draw_set_alpha(active ? 0.9 : 0.7);

    draw_roundrect(
        button_x1,
        button_y[i],
        button_x2,
        button_y[i] + button_h,
        false
    );

    draw_set_alpha(1);

    if (active)
    {
        draw_set_color(c_yellow);
    }
    else
    {
        draw_set_color(c_white);
    }

    draw_roundrect(
        button_x1,
        button_y[i],
        button_x2,
        button_y[i] + button_h,
        true
    );

    draw_set_color(c_black);

    draw_text(
        (button_x1 + button_x2) / 2,
        button_y[i] + button_h / 2,
        menu_items[i]
    );
}

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);