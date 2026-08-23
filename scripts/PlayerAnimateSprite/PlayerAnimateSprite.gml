function PlayerAnimateSprite()
{
	localFrame += animSpeed;


	// =====================================================
	// WALKING ANIMATIONS
	// =====================================================

	if(
		sprite_index == sWalkDown ||
		sprite_index == sWalkUp ||
		sprite_index == sWalkLeft ||
		sprite_index == sWalkRight
	)
	{
		var _frameCount = sprite_get_number(sprite_index);

		if(localFrame >= _frameCount)
		{
			localFrame = 0;
		}

		image_index = floor(localFrame);

		return;
	}


	// =====================================================
	// IDLE SPRITES
	// =====================================================

	var _frameCount = sprite_get_number(sprite_index);

	if(localFrame >= _frameCount)
	{
		localFrame = 0;
	}

	image_index = floor(localFrame);
}