// =====================================================
// oFireBossPrompt
// STEP EVENT
// =====================================================

if (!active)
{
    exit;
}


// -----------------------------------------------------
// WAIT FOR ENTER TO BE RELEASED
// -----------------------------------------------------

if (waiting_for_enter_release)
{
    if (!keyboard_check(vk_enter))
    {
        waiting_for_enter_release = false;
    }

    exit;
}


// -----------------------------------------------------
// SELECT OPTION
// -----------------------------------------------------

if (
    keyboard_check_pressed(vk_left) ||
    keyboard_check_pressed(ord("A"))
)
{
    selected = 0;
}


if (
    keyboard_check_pressed(vk_right) ||
    keyboard_check_pressed(ord("D"))
)
{
    selected = 1;
}


// -----------------------------------------------------
// CONFIRM
// -----------------------------------------------------

if (keyboard_check_pressed(vk_enter))
{
    // =============================================
    // ENTER FIRE BOSS ROOM
    // =============================================

    if (selected == 0)
    {
        active = false;

        global.dialogue_active = false;

        room_goto(FireBossRoom);

        exit;
    }


    // =============================================
    // EXIT / CLOSE PROMPT
    // =============================================

    if (selected == 1)
    {
        active = false;

        global.dialogue_active = false;

        // Reset the door interaction
        var _door = instance_find(oFireBossRoom, 0);

        if (_door != noone)
        {
            _door.enter_ready = false;
        }

        // Close the prompt completely
        instance_destroy();

        exit;
    }
}


// -----------------------------------------------------
// ESC ALSO CLOSES PROMPT
// -----------------------------------------------------

if (keyboard_check_pressed(vk_escape))
{
    active = false;

    global.dialogue_active = false;

    instance_destroy();

    exit;
}