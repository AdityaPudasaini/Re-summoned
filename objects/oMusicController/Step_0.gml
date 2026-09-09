if (room == SpawnPoint || room == MainRoom || room == rSecondRoom)
{
    if (!audio_is_playing(music_id))
    {
        music_id = audio_play_sound(sndGameMusic, 0, true);
    }
}
else
{
    if (audio_is_playing(music_id))
    {
        audio_stop_sound(music_id);
        music_id = -1;
    }
}