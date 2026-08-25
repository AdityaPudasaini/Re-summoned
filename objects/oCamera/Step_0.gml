/// @description Follow player

// Get this room's camera
cam = view_camera[0];

// Set the amount of world visible
camera_set_view_size(cam, 900, 600);


// Find player
if (instance_exists(oPlayer))
{
    var _player = instance_find(oPlayer, 0);

    if (_player != noone)
    {
        var _viewW = camera_get_view_width(cam);
        var _viewH = camera_get_view_height(cam);

        // Center camera on player
        var _camX = _player.x - (_viewW * 0.5);
        var _camY = _player.y - (_viewH * 0.5);

        // Keep camera inside room
        _camX = clamp(
            _camX,
            0,
            max(0, room_width - _viewW)
        );

        _camY = clamp(
            _camY,
            0,
            max(0, room_height - _viewH)
        );

        camera_set_view_pos(
            cam,
            _camX,
            _camY
        );
    }
}