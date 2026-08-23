function PlayerAnimateSprite()
{
    localFrame += animSpeed;


    // =====================================================
    // WALKING + DASH ANIMATIONS
    // =====================================================

    if(
        sprite_index == sWalkDown ||
        sprite_index == sWalkUp ||
        sprite_index == sWalkLeft ||
        sprite_index == sWalkRight ||

        sprite_index == sDashDown ||
        sprite_index == sDashUp ||
        sprite_index == sDashLeft ||
        sprite_index == sDashRight
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
    // IDLE
    // =====================================================

    var _frameCount = sprite_get_number(sprite_index);

    if(localFrame >= _frameCount)
    {
        localFrame = 0;
    }

    image_index = floor(localFrame);
}