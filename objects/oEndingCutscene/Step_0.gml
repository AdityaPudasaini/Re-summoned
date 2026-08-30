// =====================================================
// GOD ENDING CUTSCENE
// =====================================================


// =====================================================
// FINAL BANG
// =====================================================

if (ending_bang)
{
    bang_timer++;
    
    
    // -------------------------------------------------
    // PLAY EXISTING BANG
    // -------------------------------------------------
    
    if (bang_timer == 1)
    {
        audio_play_sound(sndIntroBang, 1, false);
    }
    
    
    // -------------------------------------------------
    // FADE TO BLACK
    // -------------------------------------------------
    
    if (bang_timer >= 8)
    {
        fade_alpha += 0.08;
        
        fade_alpha = clamp(fade_alpha, 0, 1);
    }
    
    
    return;
}


// =====================================================
// START GOD VOICE
// =====================================================
//
// MC sections have NO voice audio.
// =====================================================

if (!voice_started && current_speaker == "GOD")
{
    voice_started = true;
    
    voice_start_time = current_time;
    
    
    switch (ending_section)
    {
        case 0:
            
            current_voice = audio_play_sound(
                snd_god_memo1,
                1,
                false
            );
            
            break;
        
        
        case 2:
            
            current_voice = audio_play_sound(
                snd_god_memo2,
                1,
                false
            );
            
            break;
        
        
        case 3:
            
            current_voice = audio_play_sound(
                snd_god_memo3,
                1,
                false
            );
            
            break;
        
        
        case 4:
            
            current_voice = audio_play_sound(
                snd_god_memo4,
                1,
                false
            );
            
            break;
        
        
        case 6:
            
            current_voice = audio_play_sound(
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
            if (current_time - voice_start_time >= 7500)
            {
                audio_stop_sound(current_voice);
                
                current_voice = noone;
            }
        }
    }
}


// =====================================================
// TYPEWRITER
// =====================================================

if (text_progress < string_length(current_text))
{
    text_progress += text_speed;
    
    if (text_progress >= string_length(current_text))
    {
        text_progress = string_length(current_text);
    }
}


// =====================================================
// ADVANCE INPUT
// =====================================================

if (keyboard_check_pressed(vk_enter)
|| keyboard_check_pressed(vk_space)
|| mouse_check_button_pressed(mb_left))
{
    
    // -------------------------------------------------
    // FINISH CURRENT TEXT
    // -------------------------------------------------
    
    if (text_progress < string_length(current_text))
    {
        text_progress = string_length(current_text);
    }
    
    else
    {
        
        // -------------------------------------------------
        // NEXT LINE
        // -------------------------------------------------
        
        dialogue_line++;
        
        
        if (dialogue_line < array_length(dialogue_text[ending_section]))
        {
            current_text =
                dialogue_text[ending_section][dialogue_line];
            
            text_progress = 0;
        }
        
        
        // -------------------------------------------------
        // NEXT SECTION
        // -------------------------------------------------
        
        else
        {
            
            // Stop current voice
            
            if (current_voice != noone)
            {
                audio_stop_sound(current_voice);
                
                current_voice = noone;
            }
            
            
            ending_section++;
            
            
            // =================================================
            // FINISHED ALL SECTIONS
            // =================================================
            
            if (ending_section >= array_length(dialogue_text))
            {
                ending_bang = true;
                
                bang_timer = 0;
                
                fade_alpha = 0;
            }
            
            
            // =================================================
            // START NEXT SECTION
            // =================================================
            
            else
            {
                dialogue_line = 0;
                
                current_text =
                    dialogue_text[ending_section][dialogue_line];
                
                current_speaker =
                    section_speaker[ending_section];
                
                text_progress = 0;
                
                voice_started = false;
                
                voice_start_time = 0;
            }
        }
    }
}