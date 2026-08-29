// =====================================================
// FIRE BOSS FIREBALL - STEP
// =====================================================

// Move
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);


// =====================================================
// HIT PLAYER
// =====================================================

var _player = instance_find(oPlayer, 0);

if (_player != noone)
{
    var _distance =
        point_distance(
            x,
            y,
            _player.x,
            _player.y
        );

    if (_distance <= 24)
    {
        // Only damage if player can currently be hurt
        if (!_player.invincible && !_player.isHurt)
        {
            with (_player)
            {
                health -= other.damage;

                isHurt = true;

                image_index = 0;
                image_speed = 1;
            }
        }

        instance_destroy();
        exit;
    }
}


// =====================================================
// LIFETIME
// =====================================================

life_timer--;

if (life_timer <= 0)
{
    instance_destroy();
    exit;
}


// =====================================================
// ROOM BOUNDS
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