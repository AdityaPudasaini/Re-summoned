function PlayerAnimateSprite()
{
	// Advance animation
	localFrame += animSpeed;


	// =====================================================
	// WALK LEFT
	// =====================================================

	if(sprite_index == sWalkLeft)
	{
		var _frameCount = sprite_get_number(sWalkLeft);

		if(localFrame >= _frameCount)
		{
			localFrame = 0;
		}

		image_index = floor(localFrame);

		return;
	}


	// =====================================================
	// NORMAL 4-DIRECTION SPRITES
	// =====================================================

	var _framesPerRow = sprite_get_number(sprite_index) / 4;

	if(localFrame >= _framesPerRow)
	{
		localFrame = 0;
	}

	image_index =
		(GetCardinalDirection() * _framesPerRow)
		+ floor(localFrame);
}