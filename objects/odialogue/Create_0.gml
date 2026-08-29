// =====================================================
// DEFAULT DIALOGUE
// =====================================================

dialogue_lines = [
    "Whoa... what happened to me?",
    "I... I died.",
    "But I'm still alive...",
    "Where am I?",
    "Why do I have to fight?",
    "I need to find a way out of here.",
    "First... I need to look around."
];


// =====================================================
// CURRENT LINE
// =====================================================

dialogue_index = 0;


// =====================================================
// TYPEWRITER SETTINGS
// =====================================================

text = dialogue_lines[dialogue_index];

text_position = 0;
text_speed = 0.5;


// =====================================================
// DIALOGUE STATE
// =====================================================

dialogue_active = true;
text_finished = false;


// =====================================================
// FADE
// =====================================================

dialogue_alpha = 0;
fade_speed = 0.08;


// =====================================================
// FREEZE PLAYER
// =====================================================

global.dialogue_active = true;