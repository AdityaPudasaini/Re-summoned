// =====================================================
// DEMON KING ROOM ENTRANCE - STEP
// =====================================================

var _player = instance_find(oPlayer, 0);

if (_player == noone)
{
    prompt_active = false;
    exit;
}


// =====================================================
// CHECK DISTANCE
// =====================================================

var _distance =
    point_distance(
        x,
        y,
        _player.x,
        _player.y
    );


// =====================================================
// SHOW PROMPT
// =====================================================

prompt_active = (_distance <= prompt_distance);


// =====================================================
// ENTER DEMON KING ROOM
// =====================================================

if (prompt_active)
{
    if (keyboard_check_pressed(vk_enter))
    {
        room_goto(rDemonKingRoom);
    }
}