function PlayerCollision()
{
    if (collisionMap == noone)
    {
        x += hSpeed;
        y += vSpeed;
    }
    else
    {
        x += hSpeed;
        if (tilemap_get_at_pixel(collisionMap, x, y) != 0) x -= hSpeed;

        y += vSpeed;
        if (tilemap_get_at_pixel(collisionMap, x, y) != 0) y -= vSpeed;
    }

    // =====================================================
    // DEMON LORD COLLISION (existing behavior)
    // =====================================================
    var _demon = instance_find(oDemonLord, 0);

    if (_demon != noone && !_demon.dead)
    {
        var _distance = point_distance(x, y, _demon.x, _demon.y);
        var _minDistance = 90;

        if (_distance < _minDistance)
        {
            var _pushDirection = point_direction(_demon.x, _demon.y, x, y);
            var _pushDistance = _minDistance - _distance;
            x += lengthdir_x(_pushDistance, _pushDirection);
            y += lengthdir_y(_pushDistance, _pushDirection);
        }
    }

    // =====================================================
    // GOD COLLISION
    // =====================================================
    // Uses God’s small custom radius instead of the full sprite/mask.
    var _god = instance_find(oGod, 0);

    if (_god != noone && _god.boss_active)
    {
        var _god_distance = point_distance(x, y, _god.x, _god.y);
        var _god_min_distance = _god.god_collision_radius;

        if (_god_distance < _god_min_distance)
        {
            if (_god_distance <= 0.001)
            {
                x += _god_min_distance;
            }
            else
            {
                var _god_push_direction = point_direction(_god.x, _god.y, x, y);
                var _god_push_distance = _god_min_distance - _god_distance;
                x += lengthdir_x(_god_push_distance, _god_push_direction);
                y += lengthdir_y(_god_push_distance, _god_push_direction);
            }
        }
    }
}
