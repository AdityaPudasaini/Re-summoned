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


	// Save the sprite before changing it
	var _oldSprite = sprite_index;


	// =====================================================
	// PLAYER IS MOVING
	// =====================================================

	if(inputMagnitude != 0)
	{
		direction = inputDirection;

		switch(GetCardinalDirection())
		{
			case 0:
				// RIGHT
				facingDirection = 3;
				sprite_index = sWalkRight;
				break;


			case 1:
				// DOWN
				facingDirection = 0;
				sprite_index = sWalkDown;
				break;


			case 2:
				// LEFT
				facingDirection = 2;
				sprite_index = sWalkLeft;
				break;


			case 3:
				// UP
				facingDirection = 1;
				sprite_index = sWalkUp;
				break;
		}
	}


	// =====================================================
	// PLAYER IS NOT MOVING
	// =====================================================

	else
	{
		switch(facingDirection)
		{
			case 0:
				// Facing down/front
				sprite_index = sIdle;
				break;


			case 1:
				// Facing up/back
				sprite_index = sUp;
				break;


			case 2:
				// Facing left
				sprite_index = sLeft;
				break;


			case 3:
				// Facing right
				sprite_index = sRight;
				break;
		}
	}


	// =====================================================
	// RESET ANIMATION ONLY WHEN SPRITE CHANGES
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