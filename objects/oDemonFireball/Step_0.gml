// =====================================================
// MOVE
// =====================================================

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
        }
    }
}


// =====================================================
// LIFETIME
// =====================================================

life--;

if (life <= 0)
{
    instance_destroy();
}