function PlayerCollision()
{
    if (collisionMap == noone)
    {
        x += hSpeed;
        y += vSpeed;
    }
    else
    {
        // =================================================
        // MOVE X
        // =================================================

        x += hSpeed;

        if (tilemap_get_at_pixel(collisionMap, x, y) != 0)
        {
            x -= hSpeed;
        }


        // =================================================
        // MOVE Y
        // =================================================

        y += vSpeed;

        if (tilemap_get_at_pixel(collisionMap, x, y) != 0)
        {
            y -= vSpeed;
        }
    }


    // =====================================================
    // DEMON LORD COLLISION
    // =====================================================

    var _demon = instance_find(oDemonLord, 0);

    if (_demon != noone && !_demon.dead)
    {
        var _distance =
            point_distance(
                x,
                y,
                _demon.x,
                _demon.y
            );


        // Distance the player must stay away
        var _minDistance = 90;


        if (_distance < _minDistance)
        {
            // Direction from Demon Lord toward player
            var _pushDirection =
                point_direction(
                    _demon.x,
                    _demon.y,
                    x,
                    y
                );


            // How far inside the Demon Lord the player is
            var _pushDistance =
                _minDistance - _distance;


            // Push player outside the Demon Lord
            x += lengthdir_x(
                _pushDistance,
                _pushDirection
            );

            y += lengthdir_y(
                _pushDistance,
                _pushDirection
            );
        }
    }
}