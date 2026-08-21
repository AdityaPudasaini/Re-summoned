function PlayerStateRun(){
	// Attack takes priority over movement input.
	if(keyAttack)
	{
		state = PlayerStateAttack;
		attack_timer = 0;
		PlayerStateAttack();
		exit;
	}

	// Stop running when shift is released or movement input stops.
	if(!keyRun || inputMagnitude == 0)
	{
		state = PlayerStateFree;
		PlayerStateFree();
		exit;
	}
	
	// Convert input direction into run-speed movement.
	hSpeed = lengthdir_x(inputMagnitude * speedRun, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * speedRun, inputDirection);

	PlayerCollision();

	// Choose run sprite while moving, otherwise fall back to idle.
	var _oldSprite = sprite_index;

	if(inputMagnitude != 0)
	{
		direction = inputDirection;
		sprite_index = spriteRun;
	} else sprite_index = spriteIdle;

	// Restart animation when changing between movement and idle sprites.
	if(_oldSprite != sprite_index) localFrame = 0;

	PlayerAnimateSprite();

	// Space triggers the plough action.
	if(keyActivate)
	{
		state = PlayerStatePlough;
		moveDistanceRemaining = distancePlough;
	}
}