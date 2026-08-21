function PlayerStateDash()
{
    var _step = min(dashSpeed, moveDistanceRemaining);

    hSpeed = lengthdir_x(_step, direction);
    vSpeed = lengthdir_y(_step, direction);

    PlayerCollision();

    moveDistanceRemaining -= _step;

    if(moveDistanceRemaining <= 0)
    {
        hSpeed = 0;
        vSpeed = 0;

        state = PlayerStateFree;
    }
}