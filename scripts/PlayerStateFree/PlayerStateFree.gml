function PlayerStateFree()
{
	// =====================================================
	// DASH
	// =====================================================
	
	if(keyActivate)
	{
		state = PlayerStateDash;
		moveDistanceRemaining = dashDistance;
		return;
	}


	// =====================================================
	// ATTACK
	// =====================================================
	
	if(keyAttack)
	{
		state = PlayerStateAttack;
		attack_timer = 0;
		PlayerStateAttack();
		return;
	}


	// =====================================================
	// RUN
	// =====================================================
	
	if(keyRun && inputMagnitude != 0)
	{
		state = PlayerStateRun;
		PlayerStateRun();
		return;
	}


	// =====================================================
	// WALK / IDLE
	// =====================================================

	hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

	PlayerCollision();


	// =====================================================
	// SPRITE
	// =====================================================

	var _oldSprite = sprite_index;

	if(inputMagnitude != 0)
	{
		// Remember the direction we're moving
		direction = inputDirection;

		// Use the special 4-frame walking animation
		// when moving left.
		if(direction >= 135 && direction < 225)
		{
			sprite_index = sWalkLeft;
		}
		else
		{
			// Keep your normal idle sprite for the
			// other directions for now.
			sprite_index = spriteIdle;
		}
	}
	else
	{
		sprite_index = spriteIdle;
	}


	// =====================================================
	// RESET ANIMATION WHEN SPRITE CHANGES
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