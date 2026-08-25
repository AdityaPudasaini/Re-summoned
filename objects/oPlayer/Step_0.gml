// --- Read input ---
var _left  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
var _right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _up    = keyboard_check(vk_up)    || keyboard_check(ord("W"));
var _down  = keyboard_check(vk_down)  || keyboard_check(ord("S"));

var _xInput = _right - _left;
var _yInput = _down - _up;

inputMagnitude = (_xInput != 0 || _yInput != 0) ? 1 : 0;
if (inputMagnitude != 0) {
    inputDirection = point_direction(0, 0, _xInput, _yInput);
}

keyAttack   = keyboard_check_pressed(vk_space);
keyActivate = keyboard_check_pressed(vk_shift);
keyMagic = keyboard_check_pressed(ord("F"));

// --- Run current state ---
state();