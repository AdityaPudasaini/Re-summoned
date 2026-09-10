// =====================================================
// FIREBALL MOVEMENT
// =====================================================

x += lengthdir_x(
    speed,
    direction
);

y += lengthdir_y(
    speed,
    direction
);


// =====================================================
// HIT FIRE BOSS
// =====================================================

var _boss =
    instance_find(
        oFireBoss,
        0
    );


if (_boss != noone)
{
    var _distance =
        point_distance(
            x,
            y,
            _boss.x,
            _boss.y
        );


    if (
        _distance <=
        _boss.collisionRadius + 16
    )
    {
        // Get damage from Ifrit

        var _damage =
            _boss.fireballDamage;


        // Damage Ifrit ONLY

        with (_boss)
        {
            boss_hp -= _damage;


            if (boss_hp < 0)
            {
                boss_hp = 0;
            }
        }


        instance_destroy();

        exit;
    }
}


// =====================================================
// HIT DEMON LORD
// =====================================================

var _demon =
    instance_find(
        oDemonLord,
        0
    );


if (
    _demon != noone &&
    !_demon.dead
)
{
    var _distance =
        point_distance(
            x,
            y,
            _demon.x,
            _demon.y
        );


    if (
        _distance <=
        _demon.collisionRadius + 16
    )
    {
        // Get damage from Demon Lord

        var _damage =
            _demon.fireballDamage;


        // Damage Demon Lord ONLY

        with (_demon)
        {
            boss_hp -= _damage;


            if (boss_hp < 0)
            {
                boss_hp = 0;
            }


            // DO NOT set dead here.
            //
            // oDemonLord Step Event handles
            // the entire death sequence.
        }


        instance_destroy();

        exit;
    }
}


// =====================================================
// HIT GOD
// =====================================================
var _god = instance_find(oGod, 0);

if (_god != noone
&& variable_instance_exists(_god, "boss_hp")
&& variable_instance_exists(_god, "boss_active")
&& _god.boss_active)
{
    var _godDistance = point_distance(x, y, _god.x, _god.y);

    if (_godDistance <= _god.collisionRadius + 16)
    {
        var _damage = 20;

        if (variable_instance_exists(_god, "fireballDamage"))
        {
            _damage = _god.fireballDamage;
        }

        with (_god)
        {
            boss_hp = max(0, boss_hp - _damage);
            hurt_flash = 6;
        }

        instance_destroy();
        exit;
    }
}

// =====================================================
// COLLISION WITH COL TILEMAP
// =====================================================

if (collisionMap != noone)
{
    if (
        tilemap_get_at_pixel(
            collisionMap,
            x,
            y
        ) != 0
    )
    {
        instance_destroy();

        exit;
    }
}


// =====================================================
// DESTROY WHEN LEAVING ROOM
// =====================================================

if (
    x < 0 ||
    x > room_width ||
    y < 0 ||
    y > room_height
)
{
    instance_destroy();

    exit;
}