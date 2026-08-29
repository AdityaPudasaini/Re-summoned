// =====================================================
// oFireBossRoom
// COLLISION WITH oPlayer
// =====================================================

if (instance_exists(odialogue))
{
    exit;
}


// -----------------------------------------------------
// Only react to a NEW ENTER press
// -----------------------------------------------------

if (enter_ready)
{
    if (keyboard_check_pressed(vk_enter))
    {
        if (instance_exists(oFireBossPrompt))
        {
            var _prompt = instance_find(oFireBossPrompt, 0);

            if (!_prompt.active)
            {
                _prompt.active = true;
                _prompt.selected = 0;

                // Prevent this same key press from
                // confirming the prompt.
                _prompt.waiting_for_enter_release = true;

                global.dialogue_active = true;

                enter_ready = false;
            }
        }
    }
}

room_goto(FireBossRoom);