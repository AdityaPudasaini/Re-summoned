// =====================================================
// DEMON LORD - STEP
// =====================================================

if (dead)
{
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


// =====================================================
// DISTANCE TO PLAYER
// =====================================================

var _distance =
    point_distance(
        x,
        y,
        _player.x,
        _player.y
    );


// =====================================================
// ATTACKING
// =====================================================

if (attacking)
{
    // Stop moving during attack
    hspeed = 0;
    vspeed = 0;


    attackTimer++;


    // -------------------------------------------------
    // ATTACK ANIMATION
    // -------------------------------------------------

    image_speed = 1;
    image_speed = 1;


	show_debug_message(
	    "Demon attacking: " + string(attacking) +
	    " | image: " + string(image_index) +
	    " | distance: " + string(_distance)
	);
		
    // -------------------------------------------------
    // DAMAGE PLAYER
    // -------------------------------------------------

    // Hit once during the middle of the animation
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


    // -------------------------------------------------
    // ATTACK FINISHED
    // -------------------------------------------------

    if (image_index >= image_number - 1)
    {
        attacking = false;

        attackTimer = 0;

        attackHit = false;

        attackCooldown = attackCooldownTime;

        image_index = 0;
    }


    exit;
}


// =====================================================
// FACE THE PLAYER
// =====================================================

var _dx =
    _player.x - x;

var _dy =
    _player.y - y;


if (abs(_dx) > abs(_dy))
{
    // ---------------------------------------------
    // HORIZONTAL
    // ---------------------------------------------

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
    // ---------------------------------------------
    // VERTICAL
    // ---------------------------------------------

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
    // WALKING ANIMATION
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
// STOP WHEN CLOSE TO PLAYER
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


    // =================================================
    // SELECT SWORD ATTACK BASED ON PLAYER DIRECTION
    // =================================================

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