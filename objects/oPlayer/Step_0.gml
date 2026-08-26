// --- Read input ---
var _left  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
var _right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _up    = keyboard_check(vk_up)    || keyboard_check(ord("W"));
var _down  = keyboard_check(vk_down)  || keyboard_check(ord("S"));

var _xInput = _right - _left;
var _yInput = _down - _up;


// =========================
// HURT STATE
// =========================
if (isHurt)
{
    // Stop player movement
    hSpeed = 0;
    vSpeed = 0;

    // Select hurt animation based on facing direction
    switch (facingDirection)
    {
        case 0:
            // DOWN
            sprite_index = sHurtDown;
            break;

        case 1:
            // UP
            sprite_index = sHurtUp;
            break;

        case 2:
            // LEFT
            sprite_index = sHurtLeft;
            break;

        case 3:
            // RIGHT
            sprite_index = sHurtRight;
            break;
    }

    // Play hurt animation
    image_speed = 1;

    // Stop when the final frame is reached
    if (image_index >= image_number - 1)
	{
	    isHurt = false;
	    image_speed = 0;
	    image_index = 0;

	    // Start invincibility
	    invincible = true;
	    invincibilityTimer = invincibilityTime;

	    // Return to facing sprite
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
	}

    // Prevent movement, dash and attacks while hurt
    exit;
}

// =========================
// INVINCIBILITY TIMER
// =========================

if (invincible)
{
    invincibilityTimer--;
    invincibilityFlashTimer++;

    // Flash every 5 frames
    if (invincibilityFlashTimer >= 5)
    {
        invincibilityFlashTimer = 0;
        visible = !visible;
    }

    if (invincibilityTimer <= 0)
    {
        invincible = false;
        invincibilityTimer = 0;

        // Make sure player is visible again
        visible = true;
        invincibilityFlashTimer = 0;
    }
}

if (keyboard_check_pressed(ord("H")))
{
    if (!invincible && !isHurt)
    {
        isHurt = true;
        image_index = 0;
        image_speed = 1;
    }
}

inputMagnitude = (_xInput != 0 || _yInput != 0) ? 1 : 0;

inputMagnitude = (_xInput != 0 || _yInput != 0) ? 1 : 0;
if (inputMagnitude != 0) {
    inputDirection = point_direction(0, 0, _xInput, _yInput);
}

keyAttack   = keyboard_check_pressed(vk_space);
keyActivate = keyboard_check_pressed(vk_shift);
keyMagic = keyboard_check_pressed(ord("F"));

// --- Run current state ---
state();