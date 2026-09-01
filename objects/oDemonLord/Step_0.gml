// =====================================================
// DEMON LORD - STEP
// =====================================================


// =====================================================
// BOSS FIGHT FLAG
// =====================================================

if (!variable_global_exists("demon_king_fight_started"))
{
    global.demon_king_fight_started = false;
}


// =====================================================
// WAIT FOR INTRO CUTSCENE
// =====================================================

if (!global.demon_king_fight_started)
{
    exit;
}


// =====================================================
// DEATH CHECK
// =====================================================

if (boss_hp <= 0)
{
    // ---------------------------------------------
    // LOCK HP
    // ---------------------------------------------

    boss_hp = 0;


    // ---------------------------------------------
    // ENTER DEATH STATE ONCE
    // ---------------------------------------------

    if (!dead)
    {
        dead = true;
        active = false;

        attacking = false;

        hspeed = 0;
        vspeed = 0;

        image_speed = 0;
        image_index = 0;

        // Stop future taunts
        taunt1_played = true;
        taunt2_played = true;
    }


    // ---------------------------------------------
    // DEATH VOICE
    // ---------------------------------------------

    if (!defeat_voice_played)
    {
        defeat_voice_played = true;

        defeat_voice_id = audio_play_sound(
            sndDemonKingDefeat,
            2,
            false
        );
    }


    // =================================================
    // WAIT FOR DEATH VOICE
    // =================================================

    if (!death_bang_played)
    {
        var _voice_finished = false;


        if (defeat_voice_id != -1)
        {
            _voice_finished =
                !audio_is_playing(defeat_voice_id);
        }
        else
        {
            _voice_finished = true;
        }


        // ---------------------------------------------
        // DEATH VOICE FINISHED
        // ---------------------------------------------

        if (_voice_finished)
        {
            death_bang_played = true;


            // -----------------------------------------
            // BANG
            // -----------------------------------------

            audio_play_sound(
                sndIntroBang,
                3,
                false
            );


            // -----------------------------------------
            // START WHITE FLASH
            // -----------------------------------------

            death_flash = 1;
        }
    }


    // =================================================
    // WHITE FLASH
    // =================================================

    if (death_bang_played)
    {
        death_flash -= death_flash_speed;


        if (death_flash <= 0)
        {
            death_flash = 0;

            room_goto(rEndingRoom);
        }
    }


    exit;
}


// =====================================================
// FIND PLAYER
// =====================================================

var _player = instance_find(oPlayer, 0);

if (_player == noone)
{
    exit;
}


// =====================================================
// ATTACK COOLDOWN
// =====================================================

if (attackCooldown > 0)
{
    attackCooldown--;
}

if (aoeCooldown > 0)
{
    aoeCooldown--;
}


// =====================================================
// MAGIC TIMER - COUNTS DOWN REGARDLESS OF PLAYER DISTANCE
// =====================================================

if (!magicAttacking && magicTimer > 0)
{
    magicTimer--;
}


// =====================================================
// DISTANCE
// =====================================================

var _distance =
    point_distance(
        x,
        y,
        _player.x,
        _player.y
    );


// =====================================================
// CLOSE RANGE TIMER FOR AOE
// The player has to stay close continuously.
// Moving away resets the timer.
// =====================================================

if (!aoeAttacking && !attacking && !magicAttacking)
{
    if (_distance <= aoeCloseDistance)
    {
        if (aoeCloseTimer < aoeCloseTime)
        {
            aoeCloseTimer++;
        }
    }
    else
    {
        aoeCloseTimer = 0;
    }
}


// =====================================================
// START AOE ATTACK
// Only triggers after the player has stayed close too long.
// This takes priority over sword/magic.
// =====================================================

if (
    aoeCloseTimer >= aoeCloseTime &&
    aoeCooldown <= 0 &&
    !attacking &&
    !magicAttacking &&
    !aoeAttacking
)
{
    aoeAttacking = true;
    aoeHit = false;

    hspeed = 0;
    vspeed = 0;

    image_index = 0;
    image_speed = aoeImageSpeed;

    // The AOE animation is available in left/right.
    if (_player.x < x)
    {
        facingDirection = 2;
        sprite_index = sDemonAOEAttackLeft;
    }
    else
    {
        facingDirection = 3;
        sprite_index = sDemonAOEAttackRight;
    }
}


// =====================================================
// AOE ATTACKING
// Fast wind-up and one hit only.
// =====================================================

if (aoeAttacking)
{
    hspeed = 0;
    vspeed = 0;

    image_speed = aoeImageSpeed;

    // Hit once at the active frame.
    if (!aoeHit && image_index >= aoeHitFrame)
    {
        aoeHit = true;

        if (point_distance(x, y, _player.x, _player.y) <= aoeHitRadius)
        {
            if (!_player.invincible && !_player.isHurt)
            {
                with (_player)
                {
                    health -= other.aoeDamage;

                    isHurt = true;

                    image_index = 0;
                    image_speed = 1;
                }
            }
        }
    }

    // Finish the fast AOE and give the player a fresh escape period.
    if (image_index >= image_number - 1)
    {
        aoeAttacking = false;
        aoeHit = false;

        aoeCloseTimer = 0;
        aoeCooldown = aoeCooldownTime;

        image_index = 0;

        switch (facingDirection)
        {
            case 0: sprite_index = sDemonWalkDown;  break;
            case 1: sprite_index = sDemonWalkUp;    break;
            case 2: sprite_index = sDemonWalkLeft;  break;
            case 3: sprite_index = sDemonWalkRight; break;
        }
    }

    exit;
}


// =====================================================
// START MAGIC ATTACK
// Fires on a timer, no distance check
// =====================================================

if (magicTimer <= 0 && !attacking && !magicAttacking)
{
    magicAttacking = true;
    magicFired = false;

    hspeed = 0;
    vspeed = 0;

    image_index = 0;
    image_speed = 1;

    // Demon magic only has LEFT / RIGHT cast sprites,
    // so aim at whichever horizontal side the player is on.
    if (_player.x < x)
    {
        facingDirection = 2;
        sprite_index = sDemonMagicAttackLeft;
    }
    else
    {
        facingDirection = 3;
        sprite_index = sDemonMagicAttackRight;
    }
}


// =====================================================
// MAGIC ATTACKING
// =====================================================

if (magicAttacking)
{
    hspeed = 0;
    vspeed = 0;

    image_speed = 1;

    // Same idea as the player's magic: fire once around frame 4.
    if (!magicFired && image_index >= 4)
    {
        magicFired = true;

        audio_play_sound(sndFireball, 0, false);

        var _fireball = instance_create_layer(x, y, layer, oDemonFireball);

        if (facingDirection == 2)
        {
            _fireball.sprite_index = sDemonMagicBallLeft;
            _fireball.direction = 180;
        }
        else
        {
            _fireball.sprite_index = sDemonMagicBallRight;
            _fireball.direction = 0;
        }

        _fireball.damage = fireballDamage;

        // Match the player's fireball spawn positioning.
        _fireball.y -= 35;
        _fireball.x += lengthdir_x(45, _fireball.direction);
        _fireball.y += lengthdir_y(45, _fireball.direction);
    }

    // Finish the cast, then restart the timer.
    if (image_index >= image_number - 1)
    {
        magicAttacking = false;
        magicFired = false;
        magicTimer = magicInterval;

        image_index = 0;

        if (facingDirection == 2)
        {
            sprite_index = sDemonWalkLeft;
        }
        else
        {
            sprite_index = sDemonWalkRight;
        }
    }

    exit;
}


// =====================================================
// ATTACKING
// =====================================================

if (attacking)
{
    hspeed = 0;
    vspeed = 0;

    attackTimer++;

    image_speed = 1;


    // =================================================
    // DAMAGE PLAYER
    // =================================================

    if (image_index >= 5 && !attackHit)
    {
        var _hit = false;


        switch (facingDirection)
        {
            // -----------------------------------------
            // DOWN
            // -----------------------------------------

            case 0:

                _hit =
                    _player.y > y &&
                    (_player.y - y) <= 100 &&
                    abs(_player.x - x) <= 65;

                break;


            // -----------------------------------------
            // UP
            // -----------------------------------------

            case 1:

                _hit =
                    _player.y < y &&
                    (y - _player.y) <= 100 &&
                    abs(_player.x - x) <= 65;

                break;


            // -----------------------------------------
            // LEFT
            // -----------------------------------------

            case 2:

                _hit =
                    _player.x < x &&
                    (x - _player.x) <= 100 &&
                    abs(_player.y - y) <= 65;

                break;


            // -----------------------------------------
            // RIGHT
            // -----------------------------------------

            case 3:

                _hit =
                    _player.x > x &&
                    (_player.x - x) <= 100 &&
                    abs(_player.y - y) <= 65;

                break;
        }


        // =================================================
        // HIT PLAYER
        // =================================================

        if (_hit)
        {
            if (!_player.invincible && !_player.isHurt)
            {
                with (_player)
                {
                    health -= other.attackDamage;

                    isHurt = true;

                    image_index = 0;
                    image_speed = 1;
                }

                attackHit = true;
            }
        }
    }


    // =================================================
    // ATTACK FINISHED
    // =================================================

    if (image_index >= image_number - 1)
    {
        attacking = false;

        attackTimer = 0;

        attackHit = false;

        attackCooldown = attackCooldownTime;

        image_index = 0;

        attack_count++;


        // =================================================
        // TAUNT 1
        // =================================================

        if (attack_count >= 3 && !taunt1_played)
        {
            audio_play_sound(
                sndDemonKingTaunt1,
                2,
                false
            );

            taunt1_played = true;
        }


        // =================================================
        // TAUNT 2
        // =================================================

        if (attack_count >= 7 && !taunt2_played)
        {
            audio_play_sound(
                sndDemonKingTaunt2,
                2,
                false
            );

            taunt2_played = true;
        }
    }


    exit;
}


// =====================================================
// FACE PLAYER
// =====================================================

var _dx =
    _player.x - x;

var _dy =
    _player.y - y;


if (abs(_dx) > abs(_dy))
{
    if (_dx > 0)
    {
        facingDirection = 3;
    }
    else
    {
        facingDirection = 2;
    }
}
else
{
    if (_dy > 0)
    {
        facingDirection = 0;
    }
    else
    {
        facingDirection = 1;
    }
}


// =====================================================
// MOVE TOWARD PLAYER
// =====================================================

if (_distance > stopDistance)
{
    var _moveDirection =
        point_direction(
            x,
            y,
            _player.x,
            _player.y
        );


    var _moveX =
        lengthdir_x(
            moveSpeed,
            _moveDirection
        );


    var _moveY =
        lengthdir_y(
            moveSpeed,
            _moveDirection
        );


    x += _moveX;
    y += _moveY;


    // =================================================
    // WALK ANIMATION
    // =================================================

    switch (facingDirection)
    {
        case 0:
            sprite_index = sDemonWalkDown;
            break;

        case 1:
            sprite_index = sDemonWalkUp;
            break;

        case 2:
            sprite_index = sDemonWalkLeft;
            break;

        case 3:
            sprite_index = sDemonWalkRight;
            break;
    }


    image_speed = 0.7;
}


// =====================================================
// STOP WHEN CLOSE
// =====================================================

else
{
    hspeed = 0;
    vspeed = 0;

    image_speed = 0;
    image_index = 0;
}


// =====================================================
// START SWORD ATTACK
// =====================================================

if (
    _distance <= stopDistance &&
    attackCooldown <= 0
)
{
    attacking = true;

    attackTimer = 0;

    attackHit = false;

    image_index = 0;
    image_speed = 1;


    switch (facingDirection)
    {
        case 0:
            sprite_index = sDemonSwordAttackDown;
            break;

        case 1:
            sprite_index = sDemonSwordAttackUp;
            break;

        case 2:
            sprite_index = sDemonSwordAttackLeft;
            break;

        case 3:
            sprite_index = sDemonSwordAttackRight;
            break;
    }
}