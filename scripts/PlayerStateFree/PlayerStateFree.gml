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
		direction = inputDirection;
		sprite_index = spriteWalk;
	}
	else
	{
		sprite_index = spriteIdle;
	}


	// Restart animation when changing sprites
	if(_oldSprite != sprite_index)
	{
		localFrame = 0;
	}
	

	PlayerAnimateSprite();
}