// =====================================================
// oMusicController
// CREATE EVENT
// =====================================================

persistent = true;

gameMusicVolume = 0.7;

gameMusic = audio_play_sound(
    sndGameMusic,
    10,
    true
);

audio_sound_gain(
    gameMusic,
    gameMusicVolume,
    0
);