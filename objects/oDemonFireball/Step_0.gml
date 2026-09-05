life--;

if (life <= 0)
{
    instance_destroy();
    exit;
}


// =====================================================
// DEMON LORD FIREBALL MOVEMENT
// =====================================================

// --- HOME TOWARD PLAYER ---
var _player = instance_find(oPlayer, 0);

if (_player != noone)
{
    // Get the angle from the fireball to the player
    var _target_direction = point_direction(x, y, _player.x, _player.y);

    // Turn toward the player
    var _turn_speed = 3;

    direction += clamp(
        angle_difference(_target_direction, direction),
        -_turn_speed,
        _turn_speed
    );
}

// --- MOVE ---
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);


// =====================================================
// DAMAGE PLAYER
// =====================================================

var _player = instance_find(oPlayer, 0);

if (_player != noone)
{
    if (point_distance(x, y, _player.x, _player.y) <= 32)
    {
        if (!_player.invincible && !_player.isHurt)
        {
            with (_player)
            {
                health -= other.damage;

                isHurt = true;

                image_index = 0;
                image_speed = 1;
            }

            instance_destroy();
            exit;
        }
    }
}


// =====================================================
// COLLISION WITH COL TILEMAP
// =====================================================

if (collisionMap != noone)
{
    if (tilemap_get_at_pixel(collisionMap, x, y) != 0)
    {
        instance_destroy();
        exit;
    }
}


// =====================================================
// DESTROY WHEN LEAVING ROOM
// =====================================================

if (
    x < 0 ||
    x > room_width ||
    y < 0 ||
    y > room_height
)
{
    instance_destroy();
    exit;
}
