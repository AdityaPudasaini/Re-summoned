// =====================================================
// FIRE BOSS INTRODUCTION
// =====================================================

if (intro_active)
{
    // Make absolutely sure the player stays locked
    if (instance_exists(oPlayer))
    {
        oPlayer.boss_intro_active = true;
        oPlayer.hSpeed = 0;
        oPlayer.vSpeed = 0;
    }


    // =================================================
    // PLAY INTRO VOICE ONCE
    // =================================================

    if (!intro_sound_played)
    {
        intro_sound_played = true;

        audio_play_sound(
            sndFireBossCome,
            1,
            false
        );
    }


    // =================================================
    // WAIT FOR VOICE TO FINISH
    // =================================================

    if (intro_sound_played &&
        !audio_is_playing(sndFireBossCome))
    {
        intro_active = false;

        // Unlock player
        if (instance_exists(oPlayer))
        {
            oPlayer.boss_intro_active = false;
            oPlayer.hSpeed = 0;
            oPlayer.vSpeed = 0;
        }

		// Start boss fight
		boss_fight_started = true;

		// Activate the Fire Boss
		var _boss = instance_find(oFireBoss, 0);

		if (_boss != noone)
		{
		    _boss.active = true;
		}
    }
}