// =====================================================
// OPTIONS MENU
// =====================================================

if (options_open)
{
    // -------------------------------------------------
    // KEYBOARD NAVIGATION
    // -------------------------------------------------

    if (keyboard_check_pressed(vk_up))
    {
        options_selected--;

        if (options_selected < 0)
        {
            options_selected = array_length(options_items) - 1;
        }
    }


    if (keyboard_check_pressed(vk_down))
    {
        options_selected++;

        if (options_selected >= array_length(options_items))
        {
            options_selected = 0;
        }
    }


    // -------------------------------------------------
    // CHANGE SETTINGS
    // -------------------------------------------------

    if (keyboard_check_pressed(vk_left))
    {
        switch (options_selected)
        {
            case 0:
                music_volume -= 0.1;
                break;

            case 1:
                sfx_volume -= 0.1;
                break;

            case 2:
                master_volume -= 0.1;
                break;
        }
    }


    if (keyboard_check_pressed(vk_right))
    {
        switch (options_selected)
        {
            case 0:
                music_volume += 0.1;
                break;

            case 1:
                sfx_volume += 0.1;
                break;

            case 2:
                master_volume += 0.1;
                break;
        }
    }


    // -------------------------------------------------
    // KEEP VOLUME BETWEEN 0 AND 1
    // -------------------------------------------------

    music_volume = clamp(music_volume, 0, 1);
    sfx_volume = clamp(sfx_volume, 0, 1);
    master_volume = clamp(master_volume, 0, 1);


    // -------------------------------------------------
    // FULLSCREEN
    // -------------------------------------------------

    if (options_selected == 3)
    {
        if (keyboard_check_pressed(vk_left) ||
            keyboard_check_pressed(vk_right) ||
            keyboard_check_pressed(vk_enter) ||
            keyboard_check_pressed(vk_space))
        {
            window_set_fullscreen(!window_get_fullscreen());
        }
    }


    // -------------------------------------------------
    // BACK WITH ESCAPE
    // -------------------------------------------------

    if (keyboard_check_pressed(vk_escape))
    {
        options_open = false;
        options_selected = 0;
    }


    // -------------------------------------------------
    // SELECT
    // -------------------------------------------------

    if (keyboard_check_pressed(vk_enter) ||
        keyboard_check_pressed(vk_space))
    {
        if (options_selected == 4)
        {
            options_open = false;
            options_selected = 0;
        }
    }


    // -------------------------------------------------
    // STOP NORMAL MENU FROM RUNNING
    // -------------------------------------------------

    return;
}


// =====================================================
// ORIGINAL MAIN MENU MOUSE
// =====================================================

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

menu_hovered = -1;

for (var i = 0; i < array_length(menu_items); i++)
{
    if (point_in_rectangle(
        mx,
        my,
        button_x1,
        button_y[i],
        button_x2,
        button_y[i] + button_h
    ))
    {
        menu_hovered = i;
        menu_selected = i;
    }
}


// =====================================================
// ORIGINAL MAIN MENU KEYBOARD
// =====================================================

if (keyboard_check_pressed(vk_up))
{
    menu_selected--;

    if (menu_selected < 0)
    {
        menu_selected = array_length(menu_items) - 1;
    }
}


if (keyboard_check_pressed(vk_down))
{
    menu_selected++;

    if (menu_selected >= array_length(menu_items))
    {
        menu_selected = 0;
    }
}


// =====================================================
// SELECT
// =====================================================

var mouse_selected =
    menu_hovered != -1 &&
    mouse_check_button_pressed(mb_left);


var keyboard_selected =
    keyboard_check_pressed(vk_enter) ||
    keyboard_check_pressed(vk_space);


if (mouse_selected || keyboard_selected)
{
    switch (menu_selected)
    {
        case 0:

            // START GAME
            room_goto(intro);

            break;


        case 1:

            // OPTIONS
            options_open = true;
            options_selected = 0;

            break;


        case 2:

            // EXIT
            game_end();

            break;
    }
}