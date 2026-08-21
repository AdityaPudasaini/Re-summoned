function PlayerStateAttack()
{
    attacking = true;

    // Lock movement while attacking
    hSpeed = 0;
    vSpeed = 0;

    // Keep collision active
    PlayerCollision();

    // Attack sprite
    sprite_index = spriteAttack;

    // Your sSwordAttack has exactly 5 frames
    var _totalFrames = sprite_get_number(sprite_index);

    // Increase attack timer
    attack_timer++;

    // Calculate current animation frame
    var _attackFrame = floor(
        (attack_timer / attack_duration) * _totalFrames
    );

    // Prevent going past the final frame
    _attackFrame = clamp(
        _attackFrame,
        0,
        _totalFrames - 1
    );

    // Set animation frame
    image_index = _attackFrame;

    // Finish attack
    if (attack_timer >= attack_duration)
    {
        attacking = false;
        attack_timer = 0;

        // Reset animation
        image_index = 0;

        // Return to free state
        state = PlayerStateFree;
    }
}