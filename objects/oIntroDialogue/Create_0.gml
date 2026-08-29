// =====================================================
// INTRO DIALOGUE SETUP
// =====================================================

dialogue = [
    "Unfortunately... you have died.",
    "But death shall not be your end.",
    "You have been granted another chance.",
    "Defeat the foes of this realm...",
    "...and earn your freedom.",
    "Fight to survive.",
    "Fight to the bitter end...",
    "For my amusement."
];

voice = [
    sndIntro01,
    sndIntro02,
    sndIntro03,
    sndIntro04,
    sndIntro05,
    sndIntro06,
    sndIntro07,
    sndIntro08
];

// Current line
currentLine = 0;

// Typewriter settings
displayText = "";
charIndex = 0;
textSpeed = .5;

// Dialogue state
waitingForNext = false;
introFinished = false;

// Start first voice
audio_play_sound(voice[currentLine], 10, false);

displayText = "";
charIndex = 0;
textSpeed = .5;

fadeAlpha = 1;
fadeSpeed = 0.03;
fadingOut = false;

// =====================================================
// FINAL FLASH
// =====================================================

flashAlpha = 0;
flashSpeed = 0.08;
playingFlash = false;
flashStarted = false;