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


    // =================================================
    // LEFT
    // =================================================

    if (_attackDirection == 2)
    {
        _hit =
            x < _player.x &&
            x > _player.x - _attackRange &&
            abs(y - _player.y) <= _attackHeight;
    }


    // =================================================
    // RIGHT
    // =================================================

    if (_attackDirection == 3)
    {
        _hit =
            x > _player.x &&
            x < _player.x + _attackRange &&
            abs(y - _player.y) <= _attackHeight;
    }


    // =================================================
    // UP
    // =================================================

    if (_attackDirection == 1)
    {
        _hit =
            y < _player.y &&
            y > _player.y - _attackRange &&
            abs(x - _player.x) <= _attackHeight;
    }


    // =================================================
    // DOWN
    // =================================================

    if (_attackDirection == 0)
    {
        _hit =
            y > _player.y &&
            y < _player.y + _attackRange &&
            abs(x - _player.x) <= _attackHeight;
    }


    // =================================================
    // APPLY DAMAGE TO BOSS ONLY
    // =================================================

    if (_hit)
    {
        boss_hp -= swordDamage;
    }
}

playerWasAttacking = _playerAttacking;


// =====================================================
// BOSS DEATH
// =====================================================

if (boss_hp <= 0)
{
    boss_hp = 0;

    dead = true;
    active = false;

    boss_defeated = true;

    // Stop future taunts
    tauntTimer = -1;


    // =================================================
    // IFRIT DEFEAT VOICE
    // =================================================

    audio_play_sound(
        sndIfritDefeat,
        2,
        false
    );


    // =================================================
    // HIDE IFRIT
    // =================================================

    visible = false;

    exit;
}


// =====================================================
// IFRIT RANDOM TAUNTS - NO REPEATS
// =====================================================

if (tauntTimer > 0)
{
    tauntTimer--;
}
else
{
    var _tauntChoice = -1;


    // =================================================
    // PICK A TAUNT THAT HAS NOT PLAYED YET
    // =================================================

    var _available = [];


    if (!tauntPlayed1)
    {
        array_push(_available, 1);
    }


    if (!tauntPlayed2)
    {
        array_push(_available, 2);
    }


    if (!tauntPlayed3)
    {
        array_push(_available, 3);
    }


    // =================================================
    // IF ALL 3 HAVE PLAYED, RESET THE CYCLE
    // =================================================

    if (array_length(_available) == 0)
    {
        tauntPlayed1 = false;
        tauntPlayed2 = false;
        tauntPlayed3 = false;

        array_push(_available, 1);
        array_push(_available, 2);
        array_push(_available, 3);
    }


    // =================================================
    // PICK ONE FROM AVAILABLE TAUNTS
    // =================================================

    _tauntChoice =
        _available[
            irandom(array_length(_available) - 1)
        ];


    // =================================================
    // MARK TAUNT AS PLAYED
    // =================================================

    switch (_tauntChoice)
    {
        case 1:

            audio_play_sound(
                sndIfritTaunt1,
                2,
                false
            );

            tauntPlayed1 = true;

            break;


        case 2:

            audio_play_sound(
                sndIfritTaunt2,
                2,
                false
            );

            tauntPlayed2 = true;

            break;


        case 3:

            audio_play_sound(
                sndIfritTaunt3,
                2,
                false
            );

            tauntPlayed3 = true;

            break;
    }


    // =================================================
    // WAIT 6-12 SECONDS
    // =================================================

    tauntTimer = irandom_range(360, 720);
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
                var _side = choose(-1, 1);

                var _angle;

                if (_side == -1)
                {
                    _angle = irandom_range(150, 210);
                }
                else
                {
                    _angle = irandom_range(-30, 30);
                }


                // =====================================
                // TELEPORT DISTANCE
                // =====================================

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
                // CHECK COLLISION
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
            x = teleportX;
            y = teleportY;

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