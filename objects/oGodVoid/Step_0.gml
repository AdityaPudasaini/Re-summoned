/// @description God void projectile movement and collision

// Move straight like the player's fireball.
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// =====================================================
// HIT PLAYER
// =====================================================

var _player = instance_find(oPlayer, 0);

if (_player != noone)
{
    if (point_distance(x, y, _player.x, _player.y) <= 32)
    {
        // Protect against a partially-created/recreated player instance.
        // Normal oPlayer instances always have these variables from Create.
        if (variable_instance_exists(_player, "health")
        && variable_instance_exists(_player, "invincible")
        && variable_instance_exists(_player, "isHurt"))
        {
            if (!_player.invincible && !_player.isHurt)
            {
                _player.health = max(0, _player.health - damage);
                _player.isHurt = true;
                _player.image_index = 0;
                _player.image_speed = 1;
            }
        }

        // Void disappears on contact, just like the player's fireball.
        instance_destroy();
        exit;
    }
}

// =====================================================
// COLLISION WITH THE ROOM TILEMAP
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
// COLLISION WITH OBJECT COLLISION BOXES
// =====================================================
// If the projectile touches another instance's collision
// mask, make it disappear. Ignore God and this projectile.

var _hitObject = instance_place(x, y, all);

if (_hitObject != noone && _hitObject != id)
{
    if (_hitObject != instance_find(oGod, 0) && _hitObject != _player)
    {
        instance_destroy();
        exit;
    }
}

// =====================================================
// END OF VOID ANIMATION
// =====================================================

if (image_index >= image_number - 1)
{
    instance_destroy();
    exit;
}

// =====================================================
// LEAVE ROOM
// =====================================================

if (x < -32 || x > room_width + 32 || y < -32 || y > room_height + 32)
{
    instance_destroy();
}
