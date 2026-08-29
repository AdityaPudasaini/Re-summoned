// =====================================================
// MAIN ROOM INTRO DIALOGUE
// =====================================================

var _dialogue = instance_create_layer(
    0,
    0,
    "Instances",
    odialogue
);


// =====================================================
// DIALOGUE LINES
// =====================================================

_dialogue.dialogue_lines = [
    "This room feels different...",
    "It feels... eerie.",
    "What is that door?",
    "The energy feels off...",
    "Let me go inside."
];


// =====================================================
// START FROM FIRST LINE
// =====================================================

_dialogue.dialogue_index = 0;

_dialogue.text =
    _dialogue.dialogue_lines[
        _dialogue.dialogue_index
    ];

_dialogue.text_position = 0;
_dialogue.text_finished = false;


// =====================================================
// ACTIVATE DIALOGUE
// =====================================================

_dialogue.dialogue_active = true;

global.dialogue_active = true;