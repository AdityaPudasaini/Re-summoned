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
    var _distance =
        point_distance(
            x,
            y,
            _boss.x,
            _boss.y
        );

    if (_distance <= _boss.collisionRadius + 16)
    {
        // Get the damage from Ifrit
        var _damage = _boss.fireballDamage;

        // Damage Ifrit ONLY
        with (_boss)
        {
            boss_hp -= _damage;

            if (boss_hp < 0)
            {
                boss_hp = 0;
            }
        }

        // Destroy fireball
        instance_destroy();
        exit;
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