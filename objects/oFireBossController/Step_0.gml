// =====================================================
// oFireBossController
// STEP EVENT
// =====================================================


// =====================================================
// IFRIT INTRO VOICE
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
// KEEP PLAYER FROZEN DURING INTRO / DIALOGUE
// =====================================================

if (
    intro_active ||
    (character_dialogue_started && !boss_fight_started) ||
    (defeat_dialogue_started && !defeat_dialogue_finished)
)
{
    if (instance_exists(oPlayer))
    {
        oPlayer.boss_intro_active = true;

        oPlayer.hSpeed = 0;
        oPlayer.vSpeed = 0;
    }
}
else
{
    // =================================================
    // NOTHING IS FREEZING PLAYER
    // =================================================

    if (instance_exists(oPlayer))
    {
        oPlayer.boss_intro_active = false;
    }
}


// =====================================================
// WAIT FOR IFRIT INTRO VOICE TO FINISH
// =====================================================

if (
    intro_active &&
    intro_sound_played &&
    !audio_is_playing(sndFireBossCome) &&
    !character_dialogue_started
)
{
    intro_active = false;

    character_dialogue_started = true;


    // =================================================
    // CREATE CHARACTER INTRO DIALOGUE
    // =================================================

    var _dialogue = instance_create_layer(
        0,
        0,
        "Instances",
        odialogue
    );


    // =================================================
    // CHARACTER INTRO LINES
    // =================================================

    _dialogue.dialogue_lines = [
        "I'm sorry... I didn't mean to disturb you.",
        "Do I actually have to fight to survive?"
    ];


    _dialogue.dialogue_index = 0;

    _dialogue.text =
        _dialogue.dialogue_lines[0];

    _dialogue.text_position = 0;
    _dialogue.text_finished = false;

    _dialogue.dialogue_active = true;
    _dialogue.dialogue_alpha = 0;

    global.dialogue_active = true;
}


// =====================================================
// WAIT UNTIL INTRO DIALOGUE IS DONE
// =====================================================

if (
    character_dialogue_started &&
    !boss_fight_started &&
    !defeat_dialogue_started &&
    !instance_exists(odialogue)
)
{
    boss_fight_started = true;


    // =================================================
    // UNLOCK PLAYER
    // =================================================

    global.dialogue_active = false;

    if (instance_exists(oPlayer))
    {
        oPlayer.boss_intro_active = false;

        oPlayer.hSpeed = 0;
        oPlayer.vSpeed = 0;

        oPlayer.isHurt = false;
        oPlayer.attacking = false;

        oPlayer.image_index = 0;
        oPlayer.image_speed = 0;

        // Return player to normal state
        oPlayer.state = PlayerStateFree;
    }


    // =================================================
    // ACTIVATE IFRIT
    // =================================================

    var _boss = instance_find(oFireBoss, 0);

    if (_boss != noone)
    {
        _boss.active = true;
        _boss.visible = true;
    }
}


// =====================================================
// CHECK FOR IFRIT DEFEAT
// =====================================================

if (
    boss_fight_started &&
    !defeat_dialogue_started
)
{
    var _boss = instance_find(oFireBoss, 0);


    // =================================================
    // IFRIT STILL EXISTS
    // =================================================

    if (_boss != noone)
    {
        if (_boss.dead)
        {
            // =========================================
            // BOSS FIGHT IS OVER
            // =========================================

            boss_fight_started = false;


            // =========================================
            // STOP ALL IFRIT TAUNTS
            // =========================================

            audio_stop_sound(sndIfritTaunt1);
            audio_stop_sound(sndIfritTaunt2);
            audio_stop_sound(sndIfritTaunt3);


            // =========================================
            // DISABLE IFRIT COMPLETELY
            // =========================================

            _boss.active = false;
            _boss.visible = false;

            _boss.tauntTimer = -1;


            // =========================================
            // FREEZE PLAYER FOR DEFEAT DIALOGUE
            // =========================================

            if (instance_exists(oPlayer))
            {
                oPlayer.boss_intro_active = true;

                oPlayer.hSpeed = 0;
                oPlayer.vSpeed = 0;
            }


            // =========================================
            // WAIT FOR DEFEAT VOICE
            // =========================================

            if (!audio_is_playing(sndIfritDefeat))
            {
                defeat_dialogue_started = true;


                // =====================================
                // CREATE DEFEAT DIALOGUE
                // =====================================

                var _defeat_dialogue =
                    instance_create_layer(
                        0,
                        0,
                        "Instances",
                        odialogue
                    );


                // =====================================
                // CHARACTER'S REACTION
                // =====================================

                _defeat_dialogue.dialogue_lines = [
                    "I... killed him.",
                    "I killed someone...",
                    "There is no going back.",
                    "I must...",
                    "I MUST SURVIVE."
                ];


                _defeat_dialogue.dialogue_index = 0;

                _defeat_dialogue.text =
                    _defeat_dialogue.dialogue_lines[0];

                _defeat_dialogue.text_position = 0;
                _defeat_dialogue.text_finished = false;

                _defeat_dialogue.dialogue_active = true;
                _defeat_dialogue.dialogue_alpha = 0;

                global.dialogue_active = true;
            }
        }
    }
}


// =====================================================
// WAIT UNTIL DEFEAT DIALOGUE IS COMPLETELY DONE
// =====================================================

if (
    defeat_dialogue_started &&
    !defeat_dialogue_finished &&
    !instance_exists(odialogue)
)
{
    defeat_dialogue_finished = true;


    // =================================================
    // CLOSE GLOBAL DIALOGUE LOCK
    // =================================================

    global.dialogue_active = false;


    // =================================================
    // COMPLETELY RELEASE PLAYER
    // =================================================

    if (instance_exists(oPlayer))
    {
        // ---------------------------------------------
        // REMOVE BOSS FREEZE
        // ---------------------------------------------

        oPlayer.boss_intro_active = false;


        // ---------------------------------------------
        // STOP MOVEMENT
        // ---------------------------------------------

        oPlayer.hSpeed = 0;
        oPlayer.vSpeed = 0;


        // ---------------------------------------------
        // CLEAR COMBAT STATE
        // ---------------------------------------------

        oPlayer.attacking = false;
        oPlayer.attack_timer = 0;


        // ---------------------------------------------
        // CLEAR HURT STATE
        // ---------------------------------------------

        oPlayer.isHurt = false;


        // ---------------------------------------------
        // CLEAR DASH
        // ---------------------------------------------

        oPlayer.moveDistanceRemaining = 0;


        // ---------------------------------------------
        // STOP INVINCIBILITY FLASH
        // ---------------------------------------------

        oPlayer.invincible = false;
        oPlayer.invincibilityTimer = 0;
        oPlayer.invincibilityFlashTimer = 0;

        oPlayer.visible = true;


        // =================================================
        // IMPORTANT
        // RETURN PLAYER TO NORMAL STATE MACHINE
        // =================================================

        oPlayer.state = PlayerStateFree;


        // =================================================
        // RETURN PLAYER TO IDLE
        // =================================================

        switch (oPlayer.facingDirection)
        {
            case 0:
                oPlayer.sprite_index = sIdle;
                break;

            case 1:
                oPlayer.sprite_index = sUp;
                break;

            case 2:
                oPlayer.sprite_index = sLeft;
                break;

            case 3:
                oPlayer.sprite_index = sRight;
                break;
        }


        // =================================================
        // RESET ANIMATION
        // =================================================

        oPlayer.image_index = 0;
        oPlayer.image_speed = 0;
        oPlayer.localFrame = 0;
    }
}


// =====================================================
// SAFETY UNLOCK
// =====================================================
//
// If the defeat sequence is completely finished,
// NEVER allow the controller to leave the player frozen.
//

if (defeat_dialogue_finished)
{
    global.dialogue_active = false;

    if (instance_exists(oPlayer))
    {
        oPlayer.boss_intro_active = false;
    }
}