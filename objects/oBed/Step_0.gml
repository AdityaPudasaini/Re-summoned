var _player = instance_nearest(x, y, oPlayer);

if (instance_exists(_player))
{
    if (point_distance(x, y, _player.x, _player.y) <= 100)
    {
        if (keyboard_check_pressed(vk_enter))
        {
            if (!global.dialogue_active)
            {
                var _dialogue = instance_create_depth(
                    0,
                    0,
                    -10000,
                    odialogue
                );

                _dialogue.dialogue_lines = [
                    "I can sleep here."
                ];

                _dialogue.dialogue_index = 0;
                _dialogue.text = _dialogue.dialogue_lines[0];
                _dialogue.text_position = 0;
                _dialogue.text_finished = false;
            }
        }
    }
}