function PlayerStateDash()
{
    // =====================================================
    // DASH MOVEMENT
    // =====================================================

    var _step = min(dashSpeed, moveDistanceRemaining);

    var _dashX = 0;
    var _dashY = 0;


    // =====================================================
    // DASH DIRECTION
    // =====================================================

    switch (dashDirection)
    {
        case 0:
            // DOWN
            _dashY = 1;
            break;

        case 1:
            // UP
            _dashY = -1;
            break;

        case 2:
            // LEFT
            _dashX = -1;
            break;

        case 3:
            // RIGHT
            _dashX = 1;
            break;
    }


    // =====================================================
    // MOVE
    // =====================================================

    hSpeed = _dashX * _step;
    vSpeed = _dashY * _step;

    PlayerCollision();

    moveDistanceRemaining -= _step;


    // =====================================================
    // DASH ANIMATION
    // =====================================================

    var _dashProgress =
        1 - (moveDistanceRemaining / dashDistance);

    var _dashFrame =
        1 + floor(_dashProgress * 4);

    _dashFrame = clamp(
        _dashFrame,
        1,
        4
    );

    image_index = _dashFrame;


    // =====================================================
    // DASH FINISHED
    // =====================================================

    if (moveDistanceRemaining <= 0)
    {
        hSpeed = 0;
        vSpeed = 0;

        facingDirection = dashDirection;


        // =================================================
        // RETURN TO IDLE
        // =================================================

        switch (facingDirection)
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

        state = PlayerStateFree;
    }
}