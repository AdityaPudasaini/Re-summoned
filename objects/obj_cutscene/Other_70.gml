// obj_cutscene - ASYNC VIDEO

var _type = async_load[? "type"];

if (_type == "video_end")
{
    // Close video
    video_close();

    // Play final BANG
    audio_play_sound(sndIntroBang, 10, false);

    // Start white flash
    flash_alpha = 1;

    // Start transition
    cutscene_finished = true;
    transition_timer = 0;
}