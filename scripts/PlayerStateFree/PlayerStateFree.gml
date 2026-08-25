function PlayerStateFree()
{
    // =====================================================
    // DASH
    // =====================================================

	if(keyActivate)
	{
	    // Remember the direction we're facing
	    dashDirection = facingDirection;

	    // Set dash distance
	    moveDistanceRemaining = dashDistance;

	    // Choose dash animation
	    switch(dashDirection)
	    {
	        case 0:
	            // DOWN
	            sprite_index = sDashDown;
	            break;

	        case 1:
	            // UP
	            sprite_index = sDashUp;
	            break;

	        case 2:
	            // LEFT
	            sprite_index = sDashLeft;
	            break;

	        case 3:
	            // RIGHT
	            sprite_index = sDashRight;
	            break;
	    }

		// Start directly with the forward dash frame.
		// Frame 0 is the anticipation/backwards frame.
		image_index = 1;
		localFrame = 0;

	    state = PlayerStateDash;
	    return;
	}


    // =====================================================
    // ATTACK
    // =====================================================

    if(keyAttack)
    {
        // Remember the direction the player is facing
        attackDirection = facingDirection;

        // Choose the correct melee attack animation
        switch(attackDirection)
        {
            case 0:
                // DOWN
                sprite_index = sSowrdAttackDown;
                break;

            case 1:
                // UP
                sprite_index = sSwordAttackUp;
                break;

            case 2:
                // LEFT
                sprite_index = sSwordAttackLeft;
                break;

            case 3:
                // RIGHT
                sprite_index = sSwordAttackRight;
                break;
        }

        image_index = 0;
        localFrame = 0;
        attack_timer = 0;

        state = PlayerStateAttack;
        return;
    }


    // =====================================================
    // MAGIC ATTACK (LEFT / RIGHT ONLY)
    // =====================================================

    if(keyMagic)
    {
        if(facingDirection == 2 || facingDirection == 3)
        {
            magicDirection = facingDirection;
            magicTimer = 0;
            magicFired = false;

            if(magicDirection == 2)
            {
                sprite_index = sMagicLeft;
            }
            else
            {
                sprite_index = sMagicRight;
            }

            image_index = 0;
            localFrame = 0;

            state = PlayerStateMagic;
            return;
        }
    }


    // =====================================================
    // MOVEMENT
    // =====================================================

    if(inputMagnitude != 0)
    {
        hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
        vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);
    }
    else
    {
        hSpeed = 0;
        vSpeed = 0;
    }

    PlayerCollision();


    // =====================================================
    // SAVE OLD SPRITE
    // =====================================================

    var _oldSprite = sprite_index;


    // =====================================================
    // CHOOSE WALKING / FACING DIRECTION
    // =====================================================

    if(inputMagnitude != 0)
    {
        if(abs(hSpeed) > abs(vSpeed))
        {
            if(hSpeed > 0)
            {
                // RIGHT
                facingDirection = 3;
                sprite_index = sWalkRight;
            }
            else
            {
                // LEFT
                facingDirection = 2;
                sprite_index = sWalkLeft;
            }
        }
        else
        {
            if(vSpeed > 0)
            {
                // DOWN
                facingDirection = 0;
                sprite_index = sWalkDown;
            }
            else
            {
                // UP
                facingDirection = 1;
                sprite_index = sWalkUp;
            }
        }
    }
    else
    {
        // =================================================
        // NOT MOVING
        // KEEP LAST FACING DIRECTION
        // =================================================

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
    }


    // =====================================================
    // RESET ANIMATION IF SPRITE CHANGED
    // =====================================================

    if(_oldSprite != sprite_index)
    {
        localFrame = 0;
        image_index = 0;
    }


    // =====================================================
    // ANIMATE
    // =====================================================

    PlayerAnimateSprite();
}