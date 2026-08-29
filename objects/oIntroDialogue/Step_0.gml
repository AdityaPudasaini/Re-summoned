// =====================================================
// FADE IN
// =====================================================

if (!fadingOut && !playingFlash && fadeAlpha > 0)
{
    fadeAlpha -= fadeSpeed;
    fadeAlpha = max(0, fadeAlpha);
}


// =====================================================
// TYPEWRITER EFFECT
// =====================================================

if (!waitingForNext && !playingFlash && !fadingOut)
{
    var _fullText = dialogue[currentLine];

    if (charIndex < string_length(_fullText))
    {
        charIndex += textSpeed;

        if (charIndex > string_length(_fullText))
        {
            charIndex = string_length(_fullText);
        }

        displayText = string_copy(
            _fullText,
            1,
            floor(charIndex)
        );
    }
    else
    {
        // Wait until voice finishes
        if (!audio_is_playing(voice[currentLine]))
        {
            waitingForNext = true;
        }
    }
}
// =====================================================
// SKIP INTRO
// =====================================================

var _skipX = room_width - 80;
var _skipY = room_height * 0.88;

if (mouse_check_button_pressed(mb_left))
{
    if (
        point_distance(
            mouse_x,
            mouse_y,
            _skipX,
            _skipY
        ) < 70
    )
    {
        // Stop current voice
        if (audio_is_playing(voice[currentLine]))
        {
            audio_stop_sound(voice[currentLine]);
        }

        // Skip directly to final sequence
        currentLine = array_length(dialogue);

        introFinished = true;

        playingFlash = true;
        flashAlpha = 1;

        audio_play_sound(
            sndIntroBang,
            10,
            false
        );

        exit;
    }
}

// =====================================================
// ADVANCE DIALOGUE
// =====================================================

if (waitingForNext && !playingFlash && !fadingOut)
{
    if (keyboard_check_pressed(vk_space) ||
        keyboard_check_pressed(vk_enter))
    {
        currentLine++;

        // =================================================
        // FINAL LINE FINISHED
        // =================================================

        if (currentLine >= array_length(dialogue))
        {
            introFinished = true;

            // Start white flash
            playingFlash = true;
            flashAlpha = 1;

            // Play bang
            audio_play_sound(
                sndIntroBang,
                10,
                false
            );

            exit;
        }


        // =================================================
        // NEXT LINE
        // =================================================

        displayText = "";
        charIndex = 0;
        waitingForNext = false;

        audio_play_sound(
            voice[currentLine],
            10,
            false
        );
    }
}


// =====================================================
// WHITE FLASH
// =====================================================

if (playingFlash)
{
    flashAlpha -= flashSpeed;

    if (flashAlpha <= 0)
    {
        flashAlpha = 0;
        playingFlash = false;

        // Start fade to black
        fadingOut = true;
    }
}


// =====================================================
// FADE OUT → GAME
// =====================================================

if (fadingOut)
{
    fadeAlpha += fadeSpeed;
    fadeAlpha = min(1, fadeAlpha);

    if (fadeAlpha >= 1)
    {
        room_goto(SpawnPoint);
        exit;
    }
}