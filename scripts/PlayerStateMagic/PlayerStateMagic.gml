function PlayerStateMagic()
{
    // Stop movement while casting
    hSpeed = 0;
    vSpeed = 0;

    // Animate the casting sprite
    localFrame += animSpeed;

    var _frameCount = sprite_get_number(sprite_index);

    if(localFrame >= _frameCount)
    {
        localFrame = _frameCount - 1;
    }

    image_index = floor(localFrame);

    // Fire once when the casting animation reaches frame 4
	if(!magicFired && image_index >= 4)
	{
	    magicFired = true;

	    // Spawn at the player's position first
	    var _fireball = instance_create_layer(x, y, layer, oFireball);

	    if(magicDirection == 2)
	    {
	        // LEFT
	        _fireball.sprite_index = sFireballLeft;
	        _fireball.direction = 180;
	    }
	    else if(magicDirection == 3)
	    {
	        // RIGHT
	        _fireball.sprite_index = sFireballRight;
	        _fireball.direction = 0;
	    }

	    // Move the fireball up to the player's hand
	    _fireball.y -= 35;

	    // Spawn the projectile slightly in front of the player
	    _fireball.x += lengthdir_x(45, _fireball.direction);
	    _fireball.y += lengthdir_y(45, _fireball.direction);
	}

    // Finish the cast and return to the direction we were facing
    if(localFrame >= _frameCount - 1)
    {
        facingDirection = magicDirection;

        switch(facingDirection)
        {
            case 2:
                sprite_index = sLeft;
                break;

            case 3:
                sprite_index = sRight;
                break;
        }

        image_index = 0;
        localFrame = 0;
        magicFired = false;

        state = PlayerStateFree;
    }
}
