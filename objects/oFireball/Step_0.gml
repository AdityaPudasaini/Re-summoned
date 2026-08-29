// =====================================================
// FIREBALL MOVEMENT
// =====================================================

x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);


// =====================================================
// HIT FIRE BOSS
// =====================================================

var _boss = instance_find(oFireBoss, 0);

if (_boss != noone)
{
    if (_boss.active)
    {
        var _distance = point_distance(x, y, _boss.x, _boss.y);

        if (_distance <= _boss.collisionRadius)
        {
            // Make sure health exists
            if (!variable_instance_exists(_boss, "health"))
            {
                _boss.health = 500;
            }

            _boss.health -= 30;
            _boss.health = max(0, _boss.health);

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

if (x < 0 || x > room_width || y < 0 || y > room_height)
{
    instance_destroy();
    exit;
}