/// @description God boss health bar

if (!variable_instance_exists(id, "boss_name")) boss_name = "God";
if (!variable_instance_exists(id, "max_health")) maxHealth = 1500;
if (!variable_instance_exists(id, "health")) health = maxHealth;

if (!boss_active && health <= 0)
{
    exit;
}

var _sw = display_get_gui_width();
var _bar_w = min(boss_bar_width, _sw - 80);
var _left = (_sw - _bar_w) * 0.5;
var _right = _left + _bar_w;
var _top = boss_bar_y;
var _bottom = _top + boss_bar_height;

var _ratio = 0;
if (maxHealth > 0)
{
    _ratio = clamp(health / maxHealth, 0, 1);
}

// Name
var _old_halign = draw_get_halign();
var _old_valign = draw_get_valign();
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(c_white);
draw_text(_sw * 0.5, _top - 17, boss_name);

// Background
// Draw a simple dark outline and the changing health amount.
draw_set_color(c_black);
draw_rectangle(_left - 3, _top - 3, _right + 3, _bottom + 3, false);

draw_set_color(make_color_rgb(35, 15, 45));
draw_rectangle(_left, _top, _right, _bottom, false);

// Current health
var _fill_right = _left + (_bar_w * _ratio);
draw_set_color(make_color_rgb(150, 35, 210));
draw_rectangle(_left, _top, _fill_right, _bottom, true);

// Thin highlight
if (_ratio > 0)
{
    draw_set_color(make_color_rgb(220, 120, 255));
    draw_rectangle(_left, _top, _fill_right, _top + 3, true);
}

draw_set_color(c_white);
draw_set_halign(_old_halign);
draw_set_valign(_old_valign);
