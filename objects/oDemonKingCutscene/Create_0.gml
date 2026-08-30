// =====================================================
// DEMON KING CUTSCENE - CREATE
// =====================================================

cutscene_part = 0;
text_line = 0;

voice_playing = false;
current_voice = noone;

dialogue_done = false;


// =====================================================
// BOSS FIGHT FLAG
// =====================================================

global.demon_king_fight_started = false;


// =====================================================
// DIALOGUE
// =====================================================

dialogue = [

    // PART 0 - DEMON KING MEMO 1
    [
        "I see you have made it this far.",
		"tell me....",
        "How did you like my domain?",
		"Was it everything you expected?"
    ],

    // PART 1 - MC
    [
        "I'll kill you.",
        "And I'll get my freedom."
	
    ],

    // PART 2 - DEMON KING MEMO 2
    [
        "Hahahaha... Freedom?",
		"You came all this way, believing freedom is waiting for you?",
		
    ]

];