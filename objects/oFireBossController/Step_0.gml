// =====================================================
// oFireBossController
// STEP EVENT
// =====================================================


// =====================================================
// IFRIT VOICE
// =====================================================

if (intro_active && !intro_sound_played)
{
    intro_sound_played = true;

    audio_play_sound(
        sndFireBossCome,
        1,
        false
    );
}


// =====================================================
// KEEP PLAYER FROZEN ONLY DURING INTRO/DIALOGUE
// =====================================================

if (intro_active ||
    (character_dialogue_started && !boss_fight_started))
{
    if (instance_exists(oPlayer))
    {
        oPlayer.boss_intro_active = true;

        oPlayer.hSpeed = 0;
        oPlayer.vSpeed = 0;
    }
}


// =====================================================
// WAIT FOR IFRIT'S VOICE TO FINISH
// =====================================================

if (intro_active &&
    intro_sound_played &&
    !audio_is_playing(sndFireBossCome) &&
    !character_dialogue_started)
{
    intro_active = false;

    character_dialogue_started = true;


    // -------------------------------------------------
    // CREATE CHARACTER DIALOGUE
    // -------------------------------------------------

    var _dialogue = instance_create_layer(
        0,
        0,
        "Instances",
        odialogue
    );


    // -------------------------------------------------
    // CHARACTER LINES
    // -------------------------------------------------

    _dialogue.dialogue_lines = [
        "I'm sorry... I didn't mean to disturb you.",
        "Do I actually have to fight to survive?"
    ];


    _dialogue.dialogue_index = 0;

    _dialogue.text = _dialogue.dialogue_lines[0];

    _dialogue.text_position = 0;
    _dialogue.text_finished = false;

    _dialogue.dialogue_active = true;
    _dialogue.dialogue_alpha = 0;

    global.dialogue_active = true;
}


// =====================================================
// WAIT UNTIL CHARACTER DIALOGUE IS COMPLETELY DONE
// =====================================================

if (character_dialogue_started &&
    !boss_fight_started &&
    !instance_exists(odialogue))
{
    boss_fight_started = true;


    // -------------------------------------------------
    // VERY IMPORTANT:
    // UNLOCK PLAYER
    // -------------------------------------------------

    global.dialogue_active = false;

    if (instance_exists(oPlayer))
    {
        oPlayer.boss_intro_active = false;

        oPlayer.hSpeed = 0;
        oPlayer.vSpeed = 0;
    }


    // -------------------------------------------------
    // ACTIVATE IFRIT
    // -------------------------------------------------

    var _boss = instance_find(oFireBoss, 0);

    if (_boss != noone)
    {
        _boss.active = true;
    }
}

// =====================================================
// IFRIT RANDOM BOSS TAUNT
// =====================================================

if (boss_fight_started)
{
    ifrit_taunt_timer--;

    if (ifrit_taunt_timer <= 0)
    {
        // Only play if the voice isn't already playing
        if (!audio_is_playing(sndIfritTaunt1))
        {
            audio_play_sound(
                sndIfritTaunt1,
                2,
                false
            );
        }

        // Pick a new random time before the next taunt
        ifrit_taunt_timer = irandom_range(300, 600);
    }
}

// =====================================================
// BOSS DEFEATED
// =====================================================

var _boss = instance_find(oFireBoss, 0);

if (_boss != noone)
{
    if (_boss.dead)
    {
        boss_fight_started = false;

        // Keep player in FireBossRoom
        if (instance_exists(oPlayer))
        {
            oPlayer.boss_intro_active = false;
            oPlayer.hSpeed = 0;
            oPlayer.vSpeed = 0;
        }
    }
}