// =====================================================
// GOD ENDING CUTSCENE
// =====================================================


ending_section = 0;


// =====================================================
// LINE
// =====================================================

dialogue_line = 0;


// =====================================================
// DIALOGUE TEXT
// =====================================================

dialogue_text = [

    // -------------------------------------------------
    // SECTION 0 - GOD MEMO 1
    // -------------------------------------------------

    [
        "You defeated the Demon King.",
        "But...",
        "This is only the beginning."
    ],


    // -------------------------------------------------
    // SECTION 1 - MC
    // -------------------------------------------------

    [
        "Let me out.",
        "I earned my freedom."
    ],


    // -------------------------------------------------
    // SECTION 2 - GOD MEMO 2
    // -------------------------------------------------

    [
        "Freedom?",
        "That was never promised.",
        "You fought beautifully.",
        "You struggled."
    ],


    // -------------------------------------------------
    // SECTION 3 - GOD MEMO 3
    // -------------------------------------------------

    [
        "You survived.",
        "And you entertained me.",
        "So fight more.",
        "Go further.",
        "Entertain me more."
    ],


    // -------------------------------------------------
    // SECTION 4 - GOD MEMO 4
    // -------------------------------------------------

    [
        "ENTERTAIN ME MORE!"
    ],


    // -------------------------------------------------
    // SECTION 5 - MC
    // -------------------------------------------------

    [
        "I'll find you.",
        "And I'll kill you."
    ],


    // -------------------------------------------------
    // SECTION 6 - GOD MEMO 5
    // -------------------------------------------------

    [
        "Then come and find me."
    ]
];


// =====================================================
// SPEAKERS
// =====================================================

section_speaker = [
    "GOD",
    "MC",
    "GOD",
    "GOD",
    "GOD",
    "MC",
    "GOD"
];


// =====================================================
// CURRENT TEXT
// =====================================================

current_text =
    dialogue_text[ending_section][dialogue_line];

current_speaker =
    section_speaker[ending_section];


// =====================================================
// TYPEWRITER
// =====================================================

text_progress = 0;

text_speed = 0.7;


// =====================================================
// VOICE
// =====================================================

voice_started = false;

voice_start_time = 0;

current_voice = noone;


// =====================================================
// ENDING
// =====================================================

ending_bang = false;

bang_timer = 0;

fade_alpha = 0;


// =====================================================
// FAKE ENDING STORY
// =====================================================
//
// 0 = THE END
// 1 = HERO QUESTION
// 2 = 2 YEARS LATER
// 3 = TRANSITION TO TRUE BOSS
// =====================================================

fake_ending_phase = 0;

fake_ending_timer = 0;


// THE END stays for 5 seconds

fake_end_wait =
    room_speed * 5;


// Question stays for 4 seconds

fake_question_wait =
    room_speed * 4;


// "2 YEARS LATER" stays for 5 seconds

fake_years_wait =
    room_speed * 5;


// Fade values

fake_ending_alpha = 1;

fake_ending_target_alpha = 1;