function PlayerStateAttack()
{
    // Stop movement while attacking
    hSpeed = 0;
    vSpeed = 0;

    // Animate whichever directional attack sprite was selected
    localFrame += animSpeed;

    var _frameCount = sprite_get_number(sprite_index);

    if(localFrame >= _frameCount)
    {
        localFrame = _frameCount - 1;
    }

    image_index = floor(localFrame);

    // Finish attack
    if(localFrame >= _frameCount - 1)
    {
        facingDirection = attackDirection;

        // Return to the correct idle/facing sprite
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

        image_index = 0;
        localFrame = 0;
        attacking = false;
        attack_timer = 0;

        state = PlayerStateFree;
    }
}
