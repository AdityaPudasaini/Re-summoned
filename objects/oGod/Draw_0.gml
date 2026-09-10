/// @description Draw God

if (!visible)
{
    exit;
}

var _draw_x = x;
var _draw_y = y;

// The mid-attack sprites have a larger canvas and visually pull God
// backward. Compensate only the rendering position; the boss collision
// point stays at x/y.
if (midAttacking)
{
    if (facingDirection == 3) _draw_x += 18;
    if (facingDirection == 2) _draw_x -= 18;
}

if (hurt_flash > 0)
{
    draw_set_alpha(0.35);
    draw_set_color(c_white);
    draw_sprite_ext(sprite_index, image_index, _draw_x, _draw_y, image_xscale, image_yscale, image_angle, c_white, 1);
    draw_set_alpha(1);
    draw_set_color(c_white);
}
else
{
    draw_sprite_ext(sprite_index, image_index, _draw_x, _draw_y, image_xscale, image_yscale, image_angle, c_white, 1);
}
