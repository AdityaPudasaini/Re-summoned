// =====================================================
// FIRE BOSS - STEP
// =====================================================

if (dead)
{
    exit;
}


// =====================================================
// BOSS NOT ACTIVE
// =====================================================

if (!active)
{
    exit;
}


// =====================================================
// FIND PLAYER
// =====================================================

var _player = instance_find(oPlayer, 0);

if (!instance_exists(_player))
{
    exit;
}


// =====================================================
// SWORD DAMAGE
// =====================================================

var _playerAttacking = _player.attacking;

if (_playerAttacking && !playerWasAttacking)
{
    var _attackDirection = _player.attackDirection;

    var _attackRange = 115;
    var _attackHeight = 75;

    var _hit = false;


    // LEFT
    if (_attackDirection == 2)
    {
        _hit =
            x < _player.x &&
            x > _player.x - _attackRange &&
            abs(y - _player.y) <= _attackHeight;
    }


    // RIGHT
    if (_attackDirection == 3)
    {
        _hit =
            x > _player.x &&
            x < _player.x + _attackRange &&
            abs(y - _player.y) <= _attackHeight;
    }


    // UP
    if (_attackDirection == 1)
    {
        _hit =
            y < _player.y &&
            y > _player.y - _attackRange &&
            abs(x - _player.x) <= _attackHeight;
    }


    // DOWN
    if (_attackDirection == 0)
    {
        _hit =
            y > _player.y &&
            y < _player.y + _attackRange &&
            abs(x - _player.x) <= _attackHeight;
    }


    if (_hit)
    {
        health -= swordDamage;
    }
}

playerWasAttacking = _playerAttacking;

// =====================================================
// BOSS DEATH
// =====================================================

if (health <= 0)
{
    health = 0;

    dead = true;
    active = false;

    instance_destroy();

    exit;
}


// =====================================================
// TELEPORT SYSTEM
// =====================================================

switch (teleportState)
{
    // =================================================
    // NORMAL
    // =================================================

    case 0:

        teleportCooldown--;

        if (teleportCooldown <= 0)
        {
            var _foundPosition = false;

            var _newX = x;
            var _newY = y;


            // =========================================
            // FIND SAFE TELEPORT LOCATION
            // =========================================

            for (var _attempt = 0; _attempt < 30; _attempt++)
            {
                // -1 = player's left side
                //  1 = player's right side

                var _side = choose(-1, 1);


                // Strongly favor left/right positions.
                var _angle;

                if (_side == -1)
                {
                    _angle = irandom_range(150, 210);
                }
                else
                {
                    _angle = irandom_range(-30, 30);
                }


                // Much farther teleport distance.
                var _distance =
                    irandom_range(450, 650);


                _newX =
                    _player.x +
                    lengthdir_x(
                        _distance,
                        _angle
                    );


                _newY =
                    _player.y +
                    lengthdir_y(
                        _distance,
                        _angle
                    );


                // =====================================
                // KEEP INSIDE ROOM
                // =====================================

                _newX = clamp(
                    _newX,
                    64,
                    room_width - 64
                );

                _newY = clamp(
                    _newY,
                    64,
                    room_height - 64
                );


                // =====================================
                // CHECK COL
                // =====================================

                if (collisionMap == noone)
                {
                    _foundPosition = true;
                    break;
                }


                if (
                    tilemap_get_at_pixel(
                        collisionMap,
                        _newX,
                        _newY
                    ) == 0
                )
                {
                    _foundPosition = true;
                    break;
                }
            }


            // =========================================
            // START TELEPORT
            // =========================================

            if (_foundPosition)
            {
                teleportX = _newX;
                teleportY = _newY;

                teleportState = 1;

                sprite_index = sTeleportEscape;

                image_index = 0;
                image_speed = 1;
            }
        }

        break;


    // =================================================
    // TELEPORTING AWAY
    // =================================================

    case 1:

        sprite_index = sTeleportEscape;

        image_speed = 1;


        if (image_index >= image_number - 1)
        {
            // Move to the new location
            // while the escape animation is finished.

            x = teleportX;
            y = teleportY;


            // Start appearing.
            teleportState = 2;

            sprite_index = sTeleportReturn;

            image_index = 0;
            image_speed = 1;
        }

        break;


    // =================================================
    // TELEPORTING BACK
    // =================================================

    case 2:

        sprite_index = sTeleportReturn;

        image_speed = 1;


        if (image_index >= image_number - 1)
        {
            teleportState = 0;

            teleportCooldown = 180;

            image_index = 0;
            image_speed = 0;
        }

        break;
}


// =====================================================
// FACE PLAYER
// =====================================================

if (teleportState == 0)
{
    var _dx = _player.x - x;
    var _dy = _player.y - y;


    if (abs(_dx) > abs(_dy))
    {
        if (_dx < 0)
        {
            facingDirection = 2;
        }
        else
        {
            facingDirection = 3;
        }
    }
    else
    {
        if (_dy < 0)
        {
            facingDirection = 1;
        }
        else
        {
            facingDirection = 0;
        }
    }


    // =================================================
    // BOSS SPRITE
    // =================================================

    switch (facingDirection)
    {
        case 0:
            sprite_index = sFireBossDown;
            break;

        case 1:
            sprite_index = sFireBossUp;
            break;

        case 2:
            sprite_index = sFireBossLeft;
            break;

        case 3:
            sprite_index = sFireBossRight;
            break;
    }
}