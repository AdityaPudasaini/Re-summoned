// =====================================================
// GOD ENDING CUTSCENE - STEP
// =====================================================


// =====================================================
// FINAL BANG / FAKE ENDING
// =====================================================

if (ending_bang)
{
    bang_timer++;


    // =================================================
    // PLAY BANG ONCE
    // =================================================

    if (bang_timer == 1)
    {
        audio_play_sound(
            sndIntroBang,
            1,
            false
        );
    }


    // =================================================
    // WHITE FLASH
    // =================================================

    if (bang_timer < 8)
    {
        fade_alpha = 0;
    }


    // =================================================
    // FADE TO BLACK
    // =================================================

    if (bang_timer >= 8)
    {
        fade_alpha += 0.08;

        fade_alpha =
            clamp(
                fade_alpha,
                0,
                1
            );
    }


    // =================================================
    // FAKE ENDING STORY
    // =================================================
    //
    // Wait until the screen is black.
    // Then begin the story.
    // =================================================

    if (bang_timer >= 55)
    {
        fake_ending_timer++;


        // =============================================
        // PHASE 0
        // THE END
        // =============================================

        if (fake_ending_phase == 0)
        {
            fake_ending_alpha = 1;


            // THE END remains for 5 seconds
            if (
                fake_ending_timer >=
                fake_end_wait
            )
            {
                fake_ending_phase = 1;

                fake_ending_timer = 0;

                fake_ending_alpha = 0;
            }
        }


        // =============================================
        // PHASE 1
        // BUT CAN A HERO'S JOURNEY END LIKE THIS?
        // =============================================

        else if (fake_ending_phase == 1)
        {
            // Fade question in

            fake_ending_alpha =
                min(
                    1,
                    fake_ending_alpha + 0.025
                );


            // Stay for 4 seconds

            if (
                fake_ending_timer >=
                fake_question_wait
            )
            {
                fake_ending_phase = 2;

                fake_ending_timer = 0;

                fake_ending_alpha = 0;
            }
        }


        // =============================================
        // PHASE 2
        // 2 YEARS LATER
        // =============================================

        else if (fake_ending_phase == 2)
        {
            // Fade in

            fake_ending_alpha =
                min(
                    1,
                    fake_ending_alpha + 0.025
                );


            // Stay for 5 seconds

            if (
                fake_ending_timer >=
                fake_years_wait
            )
            {
                fake_ending_phase = 3;

                fake_ending_timer = 0;

                fake_ending_alpha = 0;
            }
        }


        // =============================================
        // PHASE 3
        // GO TO TRUE BOSS ROOM
        // =============================================

        else if (fake_ending_phase == 3)
        {
            fake_ending_alpha += 0.08;

            fake_ending_alpha =
                clamp(
                    fake_ending_alpha,
                    0,
                    1
                );


            if (fake_ending_timer >= 15)
            {
                room_goto(
                    rTrueBossRoom
                );
            }
        }
    }


    return;
}


// =====================================================
// START GOD VOICE
// =====================================================
//
// MC sections have NO voice audio.
// =====================================================

if (
    !voice_started &&
    current_speaker == "GOD"
)
{
    voice_started = true;

    voice_start_time =
        current_time;


    switch (ending_section)
    {
        case 0:

            current_voice =
                audio_play_sound(
                    snd_god_memo1,
                    1,
                    false
                );

            break;


        case 2:

            current_voice =
                audio_play_sound(
                    snd_god_memo2,
                    1,
                    false
                );

            break;


        case 3:

            current_voice =
                audio_play_sound(
                    snd_god_memo3,
                    1,
                    false
                );

            break;


        case 4:

            current_voice =
                audio_play_sound(
                    snd_god_memo4,
                    1,
                    false
                );

            break;


        case 6:

            current_voice =
                audio_play_sound(
                    snd_god_memo5,
                    1,
                    false
                );

            break;
    }
}


// =====================================================
// MEMO 3 - STOP AT 7.50 SECONDS
// =====================================================

if (ending_section == 3)
{
    if (voice_started)
    {
        if (current_voice != noone)
        {
            if (
                current_time -
                voice_start_time >=
                7500
            )
            {
                audio_stop_sound(
                    current_voice
                );

                current_voice = noone;
            }
        }
    }
}


// =====================================================
// TYPEWRITER
// =====================================================

if (
    text_progress <
    string_length(current_text)
)
{
    text_progress +=
        text_speed;


    if (
        text_progress >=
        string_length(current_text)
    )
    {
        text_progress =
            string_length(current_text);
    }
}


// =====================================================
// ADVANCE INPUT
// =====================================================

if (
    keyboard_check_pressed(vk_enter)
    ||
    keyboard_check_pressed(vk_space)
    ||
    mouse_check_button_pressed(mb_left)
)
{
    if (current_speaker == "MC")
    {
        audio_play_sound(
            sndDialogueBlip,
            0,
            false
        );
    }


    // =================================================
    // FINISH CURRENT TEXT
    // =================================================

    if (
        text_progress <
        string_length(current_text)
    )
    {
        text_progress =
            string_length(current_text);
    }


    // =================================================
    // NEXT LINE
    // =================================================

    else
    {
        dialogue_line++;


        if (
            dialogue_line <
            array_length(
                dialogue_text[ending_section]
            )
        )
        {
            current_text =
                dialogue_text
                [ending_section]
                [dialogue_line];


            text_progress = 0;
        }


        // =================================================
        // NEXT SECTION
        // =================================================

        else
        {
            // ---------------------------------------------
            // STOP CURRENT VOICE
            // ---------------------------------------------

            if (current_voice != noone)
            {
                audio_stop_sound(
                    current_voice
                );

                current_voice = noone;
            }


            ending_section++;


            // =================================================
            // FINISHED ALL SECTIONS
            // =================================================

            if (
                ending_section >=
                array_length(dialogue_text)
            )
            {
                ending_bang = true;

                bang_timer = 0;

                fade_alpha = 0;

                fake_ending_phase = 0;

                fake_ending_timer = 0;

                fake_ending_alpha = 1;
            }


            // =================================================
            // START NEXT SECTION
            // =================================================

            else
            {
                dialogue_line = 0;


                current_text =
                    dialogue_text
                    [ending_section]
                    [dialogue_line];


                current_speaker =
                    section_speaker
                    [ending_section];


                text_progress = 0;


                voice_started = false;

                voice_start_time = 0;
            }
        }
    }
}