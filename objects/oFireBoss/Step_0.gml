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
// DASH ATTACK
// =====================================================

if (!isDashing)
{
    dashCooldown--;

    var _distanceToPlayer = point_distance(
        x,
        y,
        _player.x,
        _player.y
    );

    // Player is close enough to dash
    if (_distanceToPlayer <= dashRadius && dashCooldown <= 0)
    {
        // ONLY LEFT OR RIGHT
        if (_player.x < x)
        {
            dashDirection = -1;
            sprite_index = sDashAttackLeft;
        }
        else
        {
            dashDirection = 1;
            sprite_index = sDashAttackRight;
        }

        image_index = 0;
        image_speed = 10;

        isDashing = true;
        dashTimer = 30;

        dashCooldown = dashCooldownMax;
    }
}


// =====================================================
// DASH MOVEMENT
// =====================================================

if (isDashing)
{
    // Move ONLY horizontally
    x += dashDirection * dashSpeed;

    dashTimer--;


    // =================================================
    // CHECK PLAYER COLLISION
    // =================================================

    if (place_meeting(x, y, oPlayer))
    {
        var _hitPlayer = instance_place(x, y, oPlayer);

        if (_hitPlayer != noone)
        {
            if (!_hitPlayer.invincible && !_hitPlayer.isHurt)
            {
                with (_hitPlayer)
                {
                    health -= other.dashDamage;

                    isHurt = true;

                    image_index = 0;
                    image_speed = 1;
                }
            }
        }
    }


    // =================================================
    // END DASH
    // =================================================

    if (dashTimer <= 0)
    {
        isDashing = false;

        image_index = 0;
        image_speed = 1;

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
}


// =====================================================
// FIREBALL ATTACK
// =====================================================

fireballCooldown--;

if (fireballCooldown <= 0)
{
    // Don't shoot while teleporting
    if (teleportState == 0)
    {
        var _directionToPlayer =
            point_direction(
                x,
                y,
                _player.x,
                _player.y
            );

        var _fireball =
            instance_create_layer(
                x,
                y,
                "Instances",
                oFireBossFireball
            );

        _fireball.direction = _directionToPlayer;


        if (
            _directionToPlayer > 90 &&
            _directionToPlayer < 270
        )
        {
            _fireball.sprite_index =
                sFireballLeftFireBoss;
        }
        else
        {
            _fireball.sprite_index =
                sFireballRightFireBoss;
        }

        fireballCooldown = fireballCooldownMax;
    }
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


    // =================================================
    // STOP ALL FUTURE TAUNTS
    // =================================================

    tauntTimer = -1;

    tauntPlayed1 = true;
    tauntPlayed2 = true;
    tauntPlayed3 = true;


    // =================================================
    // STOP CURRENT IFRIT TAUNT
    // =================================================

    audio_stop_sound(sndIfritTaunt1);
    audio_stop_sound(sndIfritTaunt2);
    audio_stop_sound(sndIfritTaunt3);


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
// IFRIT RANDOM TAUNTS - PLAY EACH ONLY ONCE
// =====================================================

if (!dead && active)
{
    if (tauntTimer > 0)
    {
        tauntTimer--;
    }
    else
    {
        var _available = [];


        // =================================================
        // FIND TAUNTS THAT HAVE NOT PLAYED
        // =================================================

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
        // PLAY A RANDOM UNUSED TAUNT
        // =================================================

        if (array_length(_available) > 0)
        {
            var _tauntChoice =
                _available[
                    irandom(array_length(_available) - 1)
                ];


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
            // WAIT BEFORE NEXT TAUNT
            // =================================================

            tauntTimer = irandom_range(360, 720);
        }
        else
        {
            // =================================================
            // ALL 3 TAUNTS HAVE PLAYED
            // NO MORE TAUNTS THIS FIGHT
            // =================================================

            tauntTimer = -1;
        }
    }
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

if (teleportState == 0 && !isDashing)
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