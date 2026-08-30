// =====================================================
// DEMON KING CUTSCENE - STEP
// =====================================================


// =====================================================
// CUTSCENE FINISHED
// =====================================================

if (dialogue_done)
{
    exit;
}


// =====================================================
// PLAY VOICE
// =====================================================

if (!voice_playing)
{
    switch (cutscene_part)
    {
        // -------------------------------------------------
        // MEMO 1
        // -------------------------------------------------

        case 0:

            current_voice = audio_play_sound(
                sndDemonKingMemo1,
                1,
                false
            );

            voice_playing = true;

            break;


        // -------------------------------------------------
        // MEMO 2
        // -------------------------------------------------

        case 2:

            current_voice = audio_play_sound(
                sndDemonKingMemo2,
                1,
                false
            );

            voice_playing = true;

            break;
    }
}


// =====================================================
// ENTER = ADVANCE DIALOGUE
// =====================================================

if (keyboard_check_pressed(vk_enter))
{
    // IMPORTANT:
    // Do NOT stop the voice here.
    // Let the voice finish naturally.


    // -------------------------------------------------
    // NEXT TEXT LINE
    // -------------------------------------------------

    text_line++;


    // -------------------------------------------------
    // CURRENT SECTION FINISHED
    // -------------------------------------------------

    if (text_line >= array_length(dialogue[cutscene_part]))
    {
        text_line = 0;

        cutscene_part++;


        // -------------------------------------------------
        // MEMO 1 → MC
        // -------------------------------------------------

        if (cutscene_part == 1)
        {
            voice_playing = false;
            current_voice = noone;
        }


        // -------------------------------------------------
        // MC → MEMO 2
        // -------------------------------------------------

        if (cutscene_part == 2)
        {
            voice_playing = false;
            current_voice = noone;
        }


        // -------------------------------------------------
        // MEMO 2 → BOSS FIGHT
        // -------------------------------------------------

        if (cutscene_part > 2)
        {
            dialogue_done = true;

            global.demon_king_fight_started = true;

            voice_playing = false;
            current_voice = noone;
        }
    }
}