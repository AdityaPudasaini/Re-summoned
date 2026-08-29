// =====================================================
// BOSS INTRO LOCK
// =====================================================

if (boss_intro_active)
{
    hSpeed = 0;
    vSpeed = 0;

    exit;
}

// =====================================================
// ABILITY TREE TOGGLE
// =====================================================

if (keyboard_check_pressed(vk_tab))
{
    ability_menu_open = !ability_menu_open;

    if (ability_menu_open)
    {
        ability_selected = 0;
        ability_tier = 0;

        ability_message = "";
        ability_message_timer = 0;
    }
}


// =====================================================
// ABILITY TREE INPUT
// =====================================================

if (ability_menu_open)
{
    // Stop the player
    hSpeed = 0;
    vSpeed = 0;


    // Message timer
    if (ability_message_timer > 0)
    {
        ability_message_timer--;
    }


    // Number of branches
    var _branch_count = array_length(
        global.ability_tree.children
    );


    // =================================================
    // LEFT
    // =================================================

    if (
        keyboard_check_pressed(vk_left) ||
        keyboard_check_pressed(ord("A"))
    )
    {
        ability_selected--;

        if (ability_selected < 0)
        {
            ability_selected = _branch_count - 1;
        }

        ability_tier = 0;
    }


    // =================================================
    // RIGHT
    // =================================================

    if (
        keyboard_check_pressed(vk_right) ||
        keyboard_check_pressed(ord("D"))
    )
    {
        ability_selected++;

        if (ability_selected >= _branch_count)
        {
            ability_selected = 0;
        }

        ability_tier = 0;
    }


    // =================================================
    // UP
    // =================================================

    if (
        keyboard_check_pressed(vk_up) ||
        keyboard_check_pressed(ord("W"))
    )
    {
        ability_tier = 0;
    }


    // =================================================
    // DOWN
    // =================================================

    if (
        keyboard_check_pressed(vk_down) ||
        keyboard_check_pressed(ord("S"))
    )
    {
        var _branch =
            global.ability_tree.children[ability_selected];

        if (array_length(_branch.children) > 0)
        {
            ability_tier = 1;
        }
    }


    // =================================================
    // CURRENT ABILITY
    // =================================================

    var _selected_branch =
        global.ability_tree.children[ability_selected];

    var _selected_ability = _selected_branch;


    if (
        ability_tier == 1 &&
        array_length(_selected_branch.children) > 0
    )
    {
        _selected_ability =
            _selected_branch.children[0];
    }


    // =================================================
    // UNLOCK
    // =================================================

    if (keyboard_check_pressed(vk_enter))
    {
        if (_selected_ability.unlocked)
        {
            ability_message = "Already unlocked!";
        }
        else if (
            _selected_ability.parent != undefined &&
            !_selected_ability.parent.unlocked
        )
        {
            ability_message =
                "Unlock " +
                _selected_ability.parent.name +
                " first!";
        }
        else if (UnlockAbility(_selected_ability))
        {
            ability_message =
                _selected_ability.name +
                " unlocked!";
        }
        else
        {
            ability_message =
                "Not enough Empower Points!";
        }

        ability_message_timer = 90;
    }


    // =================================================
    // TEST EMPOWER POINT
    // =================================================

    // REMOVE THIS LATER when you have your real
    // method of earning Empower Points.

    if (keyboard_check_pressed(ord("P")))
    {
        global.empower_points++;

        ability_message = "+1 Empower Point";
        ability_message_timer = 60;
    }


    // =================================================
    // CLOSE WITH ESC
    // =================================================

    if (keyboard_check_pressed(vk_escape))
    {
        ability_menu_open = false;
    }


    // =================================================
    // DO NOT RUN NORMAL PLAYER CODE
    // =================================================

    exit;
}


// =====================================================
// READ INPUT
// =====================================================

var _left = keyboard_check(vk_left)
    || keyboard_check(ord("A"));

var _right = keyboard_check(vk_right)
    || keyboard_check(ord("D"));

var _up = keyboard_check(vk_up)
    || keyboard_check(ord("W"));

var _down = keyboard_check(vk_down)
    || keyboard_check(ord("S"));

var _xInput = _right - _left;
var _yInput = _down - _up;


// =====================================================
// DASH RECHARGE
// Recharges one dash at a time
// =====================================================

if (dashes_left < max_dashes)
{
    dash_cooldown--;

    if (dash_cooldown <= 0)
    {
        // Restore ONE dash
        dashes_left++;

        // Still missing dashes?
        if (dashes_left < max_dashes)
        {
            dash_cooldown = dash_cooldown_time;
        }
        else
        {
            dash_cooldown = 0;
        }
    }
}
else
{
    // Fully charged
    dash_cooldown = 0;
}
// =====================================================
// HEALTH
// =====================================================

health = clamp(
    health,
    0,
    maxHealth
);

if (health <= 0)
{
    room_goto(SpawnPoint);
}

health = clamp(
    health,
    0,
    maxHealth
);


// =====================================================
// MAGIC RECHARGE
// =====================================================

if (magic < maxMagic)
{
    magic += magicRechargeSpeed;

    if (magic > maxMagic)
    {
        magic = maxMagic;
    }
}


// =====================================================
// HURT STATE
// =====================================================

if (isHurt)
{
    hSpeed = 0;
    vSpeed = 0;


    switch (facingDirection)
    {
        case 0:
            sprite_index = sHurtDown;
            break;

        case 1:
            sprite_index = sHurtUp;
            break;

        case 2:
            sprite_index = sHurtLeft;
            break;

        case 3:
            sprite_index = sHurtRight;
            break;
    }


    image_speed = 1;


    if (image_index >= image_number - 1)
    {
        isHurt = false;

        image_speed = 0;
        image_index = 0;


        invincible = true;
        invincibilityTimer = invincibilityTime;


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


    exit;
}


// =====================================================
// INVINCIBILITY TIMER
// =====================================================

if (invincible)
{
    invincibilityTimer--;
    invincibilityFlashTimer++;


    if (invincibilityFlashTimer >= 5)
    {
        invincibilityFlashTimer = 0;
        visible = !visible;
    }


    if (invincibilityTimer <= 0)
    {
        invincible = false;

        invincibilityTimer = 0;

        visible = true;

        invincibilityFlashTimer = 0;
    }
}

// =====================================================
// TEST DAMAGE / HURT
// Press H to take 10 damage
// =====================================================

if (keyboard_check_pressed(ord("H")))
{
    if (!invincible && !isHurt)
    {
        health -= 10;

        isHurt = true;

        image_index = 0;
        image_speed = 1;
    }
}


// =====================================================
// INPUT VALUES
// =====================================================

inputMagnitude =
    (_xInput != 0 || _yInput != 0)
    ? 1
    : 0;


if (inputMagnitude != 0)
{
    inputDirection = point_direction(
        0,
        0,
        _xInput,
        _yInput
    );
}


// =====================================================
// ACTION INPUT
// =====================================================

keyAttack =
    keyboard_check_pressed(vk_space);

keyActivate =
    keyboard_check_pressed(vk_shift);

keyMagic =
    keyboard_check_pressed(ord("F"));


// =====================================================
// RUN CURRENT PLAYER STATE
// =====================================================

state();