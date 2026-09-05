// obj_cutscene - DRAW

draw_clear(c_black);

var _status = video_get_status();

if (_status != video_status_closed)
{
    var _data = video_draw();

    if (_data[0] == 0)
    {
        var _surface = _data[1];

        draw_surface_stretched(
            _surface,
            0,
            0,
            display_get_gui_width(),
            display_get_gui_height()
        );
    }
}