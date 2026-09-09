if (intro_phase == 0)
{
    var text_timer_after_delay =
        text_timer - music_delay;


    if (text_timer_after_delay > 0)
    {
        draw_set_alpha(text_alpha);

        draw_set_color(c_white);

        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);


        draw_text_transformed(
            display_get_gui_width() / 2,
            display_get_gui_height() / 2,
            "2 YEARS LATER...",
            2.0,
            2.0,
            0
        );


        draw_set_alpha(1);
        draw_set_color(c_white);

        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }
}


if (intro_phase == 2)
{
    draw_clear(c_black);


    var video_data = video_draw();


    if (video_data[0] == 0)
    {
        var video_surface = video_data[1];


        draw_surface_stretched(
            video_surface,
            0,
            0,
            display_get_gui_width(),
            display_get_gui_height()
        );
    }
}