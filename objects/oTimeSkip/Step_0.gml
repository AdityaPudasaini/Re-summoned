text_timer++;


// =====================================================
// PHASE 0 - 2 YEARS LATER
// =====================================================

if (intro_phase == 0)
{
    // Start music 3 seconds before the text
    if (!music_started && text_timer >= 0)
    {
        audio_play_sound(sndTrueFinalTheme, 1, true);
        music_started = true;
    }


    // Wait 3 seconds before showing the text
    if (text_timer >= music_delay)
    {
        var text_timer_after_delay =
            text_timer - music_delay;


        // Fade in
        if (text_timer_after_delay <= room_speed)
        {
            text_alpha += fade_in_speed;
            text_alpha = clamp(text_alpha, 0, 1);
        }


        // Fade out
        if (text_timer_after_delay >= text_duration - room_speed)
        {
            text_alpha -= fade_in_speed;
            text_alpha = clamp(text_alpha, 0, 1);
        }


        // Finish "2 YEARS LATER..."
        if (text_timer_after_delay >= text_duration)
        {
            intro_phase = 1;
            text_timer = 0;


            // =================================================
            // START EXISTING PURPLE DIALOGUE
            // =================================================

            var dlg = instance_create_layer(
                0,
                0,
                "Instances",
                odialogue
            );


            dlg.dialogue_lines = [
                "I finally found you...",
                "PREPARE TO DIEEEEE!!!"
            ];


            dlg.dialogue_index = 0;
            dlg.text = dlg.dialogue_lines[0];
            dlg.text_position = 0;
            dlg.text_finished = false;
        }
    }
}


// =====================================================
// PHASE 1 - DIALOGUE
// =====================================================

if (intro_phase == 1)
{
    if (!instance_exists(odialogue))
    {
        intro_phase = 2;

        video_open("timelapse.mp4");
        video_enable_loop(false);

        video_started = true;
    }
}


// =====================================================
// PHASE 2 - VIDEO
// =====================================================

if (intro_phase == 2)
{
    // Video handled by Async Video event
}
// =====================================================
// PHASE 3 - VIDEO FINISHED
// KEEP MUSIC PLAYING FOR 3 SECONDS
// =====================================================
if (intro_phase == 3)
{
    music_stop_timer--;

    if (music_stop_timer <= 0)
    {
        intro_phase = 4; // prevent repeated calls
        room_goto(GodBossRoom);
    }
}