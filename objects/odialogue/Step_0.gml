// Fade dialogue in
if (dialogue_alpha < 1)
{
    dialogue_alpha += fade_speed;
    
    if (dialogue_alpha > 1)
    {
        dialogue_alpha = 1;
    }
}


// Typewriter effect
if (!text_finished)
{
    text_position += text_speed;

    if (text_position >= string_length(text))
    {
        text_position = string_length(text);
        text_finished = true;
    }
}


// Advance dialogue with ENTER
if (keyboard_check_pressed(vk_enter))
{
    // Play dialogue blip
    audio_play_sound(sndDialogueBlip, 0, false);

    // If text is still typing, show the whole line
    if (!text_finished)
    {
        text_position = string_length(text);
        text_finished = true;
    }
    
    // Otherwise move to next line
    else
    {
        dialogue_index++;
        
        // Check if dialogue is finished
        if (dialogue_index >= array_length(dialogue_lines))
        {
            global.dialogue_active = false;
            instance_destroy();
        }
        else
        {
            text = dialogue_lines[dialogue_index];
            text_position = 0;
            text_finished = false;
        }
    }
}