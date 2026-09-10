/// @description God boss attack AI

if (!boss_active)
{
    exit;
}

health = clamp(health, 0, maxHealth);

if (hurt_flash > 0)
{
    hurt_flash--;
}

if (closeAttackCooldown > 0) closeAttackCooldown--;
if (midAttackCooldown > 0) midAttackCooldown--;
if (spreadCooldown > 0) spreadCooldown--;
if (attackRecovery > 0) attackRecovery--;
if (contactDamageCooldown > 0) contactDamageCooldown--;

if (health <= 0)
{
    health = 0;
    boss_active = false;
    solid = false;
    visible = false;
    exit;
}

var _player = instance_find(oPlayer, 0);

if (!instance_exists(_player))
{
    exit;
}

// God also hurts the player if they touch his body.
// This is separate from the attack hitboxes and has a short cooldown.
if (contactDamageCooldown <= 0 && point_distance(x, y, _player.x, _player.y) <= god_collision_radius + 20)
{
    if (variable_instance_exists(_player, "health")
    && variable_instance_exists(_player, "invincible")
    && variable_instance_exists(_player, "isHurt")
    && !_player.invincible && !_player.isHurt)
    {
        _player.health = max(0, _player.health - contactDamage);
        _player.isHurt = true;
        _player.image_index = 0;
        _player.image_speed = 1;
        contactDamageCooldown = contactDamageCooldownTime;
    }
}

var _distance = point_distance(x, y, _player.x, _player.y);

// =====================================================
// HELPER: DAMAGE PLAYER
// =====================================================
// Every God attack respects the player's existing
// invincibility/hurt system so one attack cannot drain
// all of the player's HP at once.

// =====================================================
// CLOSE-RANGE ATTACK IN PROGRESS
// =====================================================

if (closeAttacking)
{
    hspeed = 0;
    vspeed = 0;
    image_speed = closeAttackImageSpeed;

    if (!closeAttackHit && image_index >= closeAttackHitFrame)
    {
        // Use a generous distance-based hit check instead of relying on
        // collision masks. This makes the attack reliably hit the player
        // even when the boss/player sprites have different mask sizes.
        var _hit = point_distance(x, y, _player.x, _player.y) <= closeAttackHitDistance;

        if (_hit
        && variable_instance_exists(_player, "health")
        && variable_instance_exists(_player, "invincible")
        && variable_instance_exists(_player, "isHurt")
        && !_player.invincible && !_player.isHurt)
        {
            _player.health = max(0, _player.health - closeAttackDamage);
            _player.isHurt = true;
            _player.image_index = 0;
            _player.image_speed = 1;
        }

        closeAttackHit = true;
    }

    if (image_index >= image_number - 1)
    {
        closeAttacking = false;
        closeAttackHit = false;
        closeAttackCooldown = closeAttackCooldownTime;
        attackRecovery = 30;
        image_index = 0;
    }

    exit;
}

// =====================================================
// MID-RANGE ATTACK IN PROGRESS
// =====================================================

if (midAttacking)
{
    hspeed = 0;
    vspeed = 0;
    image_speed = midAttackImageSpeed;

    if (!midAttackHit && image_index >= midAttackHitFrame)
    {
        // Same reliable distance check for the mid-range attack.
        var _hit = point_distance(x, y, _player.x, _player.y) <= midAttackHitDistance;

        if (_hit
        && variable_instance_exists(_player, "health")
        && variable_instance_exists(_player, "invincible")
        && variable_instance_exists(_player, "isHurt")
        && !_player.invincible && !_player.isHurt)
        {
            _player.health = max(0, _player.health - midAttackDamage);
            _player.isHurt = true;
            _player.image_index = 0;
            _player.image_speed = 1;
        }

        midAttackHit = true;
    }

    if (image_index >= image_number - 1)
    {
        midAttacking = false;
        midAttackHit = false;
        midAttackCooldown = midAttackCooldownTime;
        attackRecovery = 45;
        image_index = 0;
    }

    exit;
}

// =====================================================
// SPREAD ATTACK IN PROGRESS
// =====================================================

if (spreadAttacking)
{
    hspeed = 0;
    vspeed = 0;
    image_speed = spreadImageSpeed;

    // First part finishes -> begin the 3-wave Void barrage.
    if (spreadPhase == 0 && image_index >= image_number - 1)
    {
        spreadPhase = 1;
        spreadWave = 0;
        spreadWaveTimer = 0;
        image_index = 0;
        image_speed = 0;

        sprite_index = sGodSpreadAttackMid;
        image_index = 0;
        image_speed = 0;
    }

    // Fire one full 8-direction wave every spreadWaveDelay frames.
    if (spreadPhase == 1)
    {
        if (spreadWaveTimer > 0)
        {
            spreadWaveTimer--;
        }
        else if (spreadWave < spreadWaveCount)
        {
            var _baseDirection = point_direction(x, y, _player.x, _player.y);
            var _rotation = (spreadWave - 1) * spreadWaveRotation;

            for (var i = 0; i < spreadProjectileCount; i++)
            {
                // 8 projectiles around the boss, rotated slightly on each wave.
                var _direction = _baseDirection + _rotation + (i * (360 / spreadProjectileCount));

                var _void = instance_create_layer(
                    x + lengthdir_x(55, _direction),
                    y + lengthdir_y(55, _direction),
                    layer,
                    oGodVoid
                );

                _void.direction = _direction;
                _void.speed = spreadProjectileSpeed;
                _void.damage = spreadDamage;
            }

            spreadWave++;

            if (spreadWave < spreadWaveCount)
            {
                spreadWaveTimer = spreadWaveDelay;
            }
            else
            {
                spreadPhase = 2;
                sprite_index = sGodSpreadAttackLast;
                image_index = 0;
                image_speed = spreadImageSpeed;
            }
        }
    }
    else if (spreadPhase == 2 && image_index >= image_number - 1)
    {
        spreadAttacking = false;
        spreadFired = false;
        spreadPhase = 0;
        spreadWave = 0;
        spreadWaveTimer = 0;
        spreadCooldown = spreadCooldownTime;
        attackRecovery = 60;
        image_index = 0;
    }

    exit;
}

// =====================================================
// FACE THE PLAYER
// =====================================================

var _dx = _player.x - x;
var _dy = _player.y - y;

if (abs(_dx) > abs(_dy))
{
    facingDirection = (_dx < 0) ? 2 : 3;
}
else
{
    facingDirection = (_dy < 0) ? 1 : 0;
}

// =====================================================
// ATTACK SELECTION BY DISTANCE THRESHOLD
// =====================================================

// CLOSE: 0-110 px
if (_distance <= closeRangeMax && closeAttackCooldown <= 0 && attackRecovery <= 0)
{
    closeAttacking = true;
    attackRecovery = 45;
    closeAttackHit = false;
    image_index = 0;
    image_speed = closeAttackImageSpeed;

    switch (facingDirection)
    {
        case 0: sprite_index = sGodCloseAttackDown; break;
        case 1: sprite_index = sGodCloseAttackUp; break;
        case 2: sprite_index = sGodCloseAttackLeft; break;
        case 3: sprite_index = sGodCloseAttackRight; break;
    }

    exit;
}

// MID: 111-300 px
if (_distance >= midRangeMin && _distance <= midRangeMax && midAttackCooldown <= 0 && attackRecovery <= 0)
{
    midAttacking = true;
    attackRecovery = 45;
    midAttackHit = false;
    image_index = 0;
    image_speed = midAttackImageSpeed;

    // There is no Up mid-attack sprite, so use the closest
    // available horizontal/down animation rather than inventing one.
    switch (facingDirection)
    {
        case 0: sprite_index = sGodMidAttackDown; break;
        case 1:
            sprite_index = sGodIdleUp;
            midAttacking = false;
            break;
        case 2: sprite_index = sGodMidAttackLeft; break;
        case 3: sprite_index = sGodMidAttackRight; break;
    }

    if (midAttacking)
    {
        exit;
    }
}

// SPREAD: 301+ px
if (_distance >= spreadRangeMin && spreadCooldown <= 0 && attackRecovery <= 0)
{
    spreadAttacking = true;
    attackRecovery = 45;
    spreadFired = false;
    spreadPhase = 0;
    image_index = 0;
    image_speed = spreadImageSpeed;
    sprite_index = sGodSpreadAttackFirstPart;
    exit;
}

// =====================================================
// IDLE
// =====================================================

switch (facingDirection)
{
    case 0: sprite_index = sGodIdleDown; break;
    case 1: sprite_index = sGodIdleUp; break;
    case 2: sprite_index = sGodIdleLeft; break;
    case 3: sprite_index = sGodIdleRight; break;
}

image_speed = 1;
