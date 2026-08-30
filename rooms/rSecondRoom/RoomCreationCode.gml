// =====================================================
// SECOND ROOM - CHARACTER DIALOGUE
// ROOM CREATION CODE
// =====================================================

// Make sure dialogue starts clean
global.dialogue_active = true;


// =====================================================
// CREATE DIALOGUE
// =====================================================

var _dialogue = instance_create_layer(
    0,
    0,
    "Instances",
    odialogue
);


// =====================================================
// SECOND ROOM DIALOGUE
// =====================================================

_dialogue.dialogue_lines = [
    "I'm back here...",
    "But something seems off.",
    "That door... it wasn't open before.",
    "It's open to somewhere...",
    "I have a bad feeling about this.",
    "Whatever is inside...",
    "I have to go in and kill it.",
    "I must survive.",
    "I MUST ESCAPE."
];


// =====================================================
// START FIRST LINE
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
_dialogue.dialogue_alpha = 0;