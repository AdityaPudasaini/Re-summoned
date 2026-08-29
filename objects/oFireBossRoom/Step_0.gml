// =====================================================
// oFireBossRoom
// STEP EVENT
// =====================================================


// -----------------------------------------------------
// If the intro dialogue is still active,
// don't allow the door interaction.
// -----------------------------------------------------

if (instance_exists(odialogue))
{
    enter_ready = false;
    exit;
}


// -----------------------------------------------------
// Once ENTER has been released after the dialogue,
// allow the door to accept a NEW press.
// -----------------------------------------------------

if (!keyboard_check(vk_enter))
{
    enter_ready = true;
}