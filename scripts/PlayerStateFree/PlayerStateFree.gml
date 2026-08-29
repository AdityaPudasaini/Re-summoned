function PlayerStateFree()
{
    // =====================================================
    // DASH
    // =====================================================

	if(keyActivate)
{
    if (dashes_left > 0)
    {
		// DASH SOUND
        audio_play_sound(sndDash, 0, false);
        dashDirection = facingDirection;
        moveDistanceRemaining = dashDistance;

        switch(dashDirection)
        {
            case 0: sprite_index = sDashDown;  break;
            case 1: sprite_index = sDashUp;    break;
            case 2: sprite_index = sDashLeft;  break;
            case 3: sprite_index = sDashRight; break;
        }

        image_index = 1;
        localFrame = 0;

        dashes_left--;

		if (dashes_left < max_dashes)
		{
		    dash_cooldown = dash_cooldown_time;
		}

		state = PlayerStateDash;
    }
    return;
}


	// =====================================================
	// ATTACK - LEFT / RIGHT ONLY
	// =====================================================

	if(keyAttack)
	{
	    // Only allow attacking horizontally
	    if(facingDirection == 2 || facingDirection == 3)
	    {
			attacking = true;
			// SWORD SLASH SOUND
			audio_play_sound(sndSlash, 0, false);
			
	        attackDirection = facingDirection;

	        // Choose the correct melee attack animation
	        if(attackDirection == 2)
	        {
	            // LEFT
	            sprite_index = sSwordAttackLeft;
	        }
	        else
	        {
	            // RIGHT
	            sprite_index = sSwordAttackRight;
	        }

	        image_index = 0;
	        localFrame = 0;
	        attack_timer = 0;

	        state = PlayerStateAttack;
	        return;
	    }

	    // If facing UP or DOWN, do not attack
	    return;
	}


	// =====================================================
	// MAGIC ATTACK (LEFT / RIGHT ONLY)
	// =====================================================

	if(keyMagic)
	{
	    // Must have at least one full magic charge
	    if(magic >= magicCost)
	    {
	        if(facingDirection == 2 || facingDirection == 3)
	        {
	            // Consume magic
	            magic -= magicCost;

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