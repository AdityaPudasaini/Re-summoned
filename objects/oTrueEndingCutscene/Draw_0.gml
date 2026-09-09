// ==========================================
// oTrueEnding - DRAW
// ==========================================

var _gw =
    display_get_gui_width();

var _gh =
    display_get_gui_height();


// ==========================================
// VIDEO
// ==========================================

if (ending_phase == 0)
{
    draw_clear(c_black);


    var _status =
        video_get_status();


    if (_status != video_status_closed)
    {
        var _data =
            video_draw();


        if (_data[0] == 0)
        {
            var _surface =
                _data[1];


            draw_surface_stretched(
                _surface,
                0,
                0,
                _gw,
                _gh
            );
        }
    }
}


// ==========================================
// WHITE FLASH
// ==========================================

if (ending_phase == 1)
{
    draw_clear(c_white);


    draw_set_alpha(
        flash_alpha
    );


    draw_set_color(
        c_white
    );


    draw_rectangle(
        0,
        0,
        _gw,
        _gh,
        false
    );


    draw_set_alpha(1);
}


// ==========================================
// THE END
// ==========================================

if (ending_phase == 2)
{
    draw_clear(c_black);


    // ------------------------------------------
    // FADE IN
    // ------------------------------------------

    draw_set_alpha(
        ending_alpha
    );

    draw_set_color(c_white);

    draw_set_halign(fa_center);

    draw_set_valign(fa_middle);


    // ==========================================
    // USE SMOOTH ENDING FONT
    // ==========================================

    draw_set_font(fntIntro);


    // ==========================================
    // BIG THE END
    // ==========================================

    draw_text_transformed(
        _gw / 2,
        _gh / 2 - 40,
        "THE END",
        2.0,
        2.0,
        0
    );
	// ==========================================
	// FOR REAL THIS TIME
	// ==========================================

	draw_set_alpha(
	    ending_alpha * 0.55
	);

	draw_set_color(c_white);

	draw_text_transformed(
	    _gw / 2,
	    _gh / 2 + 85,
	    "(For Real This Time)",
	    0.75,
	    0.75,
	    0
	);


    // ==========================================
    // THANK YOU
    // ==========================================

    draw_set_alpha(
        ending_alpha * 0.7
    );


    draw_text_transformed(
        _gw / 2,
        _gh / 2 + 45,
        "Thank you for playing",
        1.0,
        1.0,
        0
    );


    // ==========================================
    // RESET
    // ==========================================

    draw_set_alpha(1);

    draw_set_color(c_white);

    draw_set_halign(fa_left);

    draw_set_valign(fa_top);

    draw_set_font(-1);
}