// =====================================================
// FIRE BOSS INTRODUCTION
// =====================================================

intro_active = true;
intro_sound_played = false;
boss_fight_started = false;

// Lock the player
if (instance_exists(oPlayer))
{
    oPlayer.boss_intro_active = true;
    oPlayer.hSpeed = 0;
    oPlayer.vSpeed = 0;
}