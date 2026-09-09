var video_type = async_load[? "type"];


if (video_type == "video_end")
{
    video_close();

    // Keep music playing for 3 more seconds
    music_stop_timer = music_stop_delay;

    intro_phase = 3;
}