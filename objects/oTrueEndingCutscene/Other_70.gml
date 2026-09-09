// ==========================================
// oTrueEnding - ASYNC VIDEO
// ==========================================

var _type = async_load[? "type"];

if (_type == "video_end")
{
    // Close video
    video_close();

    // Final BANG
    audio_play_sound(sndIntroBang, 10, false);

    // Start white flash
    flash_alpha = 1;

    // Switch to flash
    ending_phase = 1;
    ending_timer = 0;
}