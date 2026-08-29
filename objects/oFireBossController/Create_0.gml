// =====================================================
// oFireBossController
// CREATE EVENT
// =====================================================

intro_active = true;
intro_sound_played = false;

character_dialogue_started = false;
boss_fight_started = false;


// -----------------------------------------------------
// LOCK PLAYER FOR THE INTRO
// -----------------------------------------------------

if (instance_exists(oPlayer))
{
    oPlayer.boss_intro_active = true;
    oPlayer.hSpeed = 0;
    oPlayer.vSpeed = 0;
}

// =====================================================
// IFRIT RANDOM TAUNT
// =====================================================

ifrit_taunt_timer = irandom_range(180, 360);
ifrit_taunt_playing = false;