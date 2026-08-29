// =====================================================
// MOUSE
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
// KEYBOARD NAVIGATION
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
            show_debug_message("Options selected");
            break;

        case 2:
            // EXIT
            game_end();
            break;
    }
}