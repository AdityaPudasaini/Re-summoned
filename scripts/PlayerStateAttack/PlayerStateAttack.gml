function PlayerStateAttack()
{
    // Stop movement while attacking
    hSpeed = 0;
    vSpeed = 0;

    // Animate whichever directional attack sprite was selected
    localFrame += animSpeed;
	
	// =====================================================
    // SWORD DAMAGE - DEMON LORD
    // =====================================================

    if (!attackHit)
    {
        var _boss = instance_nearest(x, y, oDemonLord);

        if (_boss != noone && !_boss.dead)
        {
            var _distance =
                point_distance(
                    x,
                    y,
                    _boss.x,
                    _boss.y
                );


            // Sword must be close enough to reach the boss
            if (_distance <= 125)
            {
                var _canHit = false;


                // Sword only attacks LEFT / RIGHT
                switch (attackDirection)
                {
                    case 2:
                        // LEFT
                        _canHit =
                            _boss.x < x &&
                            abs(_boss.x - x) <= 125 &&
                            abs(_boss.y - y) <= 70;
                        break;


                    case 3:
                        // RIGHT
                        _canHit =
                            _boss.x > x &&
                            abs(_boss.x - x) <= 125 &&
                            abs(_boss.y - y) <= 70;
                        break;
                }


                if (_canHit)
                {
                    // Deal damage
                    _boss.boss_hp -= _boss.swordDamage;

                    // This sword swing has already hit
                    attackHit = true;


                    // Prevent negative HP
                    if (_boss.boss_hp <= 0)
                    {
                        _boss.boss_hp = 0;
                        _boss.dead = true;
                    }
                }
            }
        }
    }

    // =====================================================
// SWORD DAMAGE - GOD
// =====================================================

if (!attackHit)
{
    var _god = instance_nearest(x, y, oGod);

    if (_god != noone
    && variable_instance_exists(_god, "boss_hp")
    && variable_instance_exists(_god, "boss_active")
    && _god.boss_active)
    {
        var _godDistance = point_distance(x, y, _god.x, _god.y);

        if (_godDistance <= 125)
        {
            var _godCanHit = false;

            switch (attackDirection)
            {
                case 2:
                    _godCanHit =
                        _god.x < x &&
                        abs(_god.x - x) <= 125 &&
                        abs(_god.y - y) <= 70;
                    break;

                case 3:
                    _godCanHit =
                        _god.x > x &&
                        abs(_god.x - x) <= 125 &&
                        abs(_god.y - y) <= 70;
                    break;
            }

            if (_godCanHit)
            {
                var _godDamage = 25;

                if (variable_instance_exists(_god, "swordDamage"))
                {
                    _godDamage = _god.swordDamage;
                }

                _god.boss_hp = max(0, _god.boss_hp - _godDamage);

                if (variable_instance_exists(_god, "hurt_flash"))
                {
                    _god.hurt_flash = 6;
                }

                attackHit = true;
            }
        }
    }
}
   

    var _frameCount = sprite_get_number(sprite_index);

    if(localFrame >= _frameCount)
    {
        localFrame = _frameCount - 1;
    }

    image_index = floor(localFrame);

    // Finish attack
    if(localFrame >= _frameCount - 1)
    {
        facingDirection = attackDirection;

        // Return to the correct idle/facing sprite
        switch(facingDirection)
        {
            case 0:
                sprite_index = sIdle;
                break;

            case 1:
                sprite_index = sUp;
                break;

            case 2:
                sprite_index = sLeft;
                break;

            case 3:
                sprite_index = sRight;
                break;
        }

        image_index = 0;
        localFrame = 0;
        attacking = false;
        attack_timer = 0;

        state = PlayerStateFree;
    }
}