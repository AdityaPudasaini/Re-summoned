boss_defeated = false;


// =====================================================
// BOSS HEALTH
// =====================================================

boss_max_hp = 500;
boss_hp = boss_max_hp;

show_debug_message(
    "IFRIT CREATED - HP = " + string(boss_hp)
);

swordDamage = 25;
fireballDamage = 30;
playerWasAttacking = false;

swordDamage = 25;
fireballDamage = 30;
playerWasAttacking = false;

// =====================================================
// FIRE BOSS - BASIC SETUP
// =====================================================

image_xscale = 0.4;
image_yscale = 0.4;

active = false;
dead = false;

// Movement tuning
moveSpeed = 1.5;
preferredDistance = 280;
minimumDistance = 220;

// Collision radius
collisionRadius = 72;

// Direction:
// 0 = down
// 1 = up
// 2 = left
// 3 = right
facingDirection = 0;

// Collision tilemap
collisionMap = noone;

if (layer_exists("Col"))
{
    collisionMap =
        layer_tilemap_get_id(
            layer_get_id("Col")
        );
}

image_speed = 0.3;
image_index = 0;

sprite_index = sFireBossIdle;

// =====================================================
// BOSS PATHFINDING
// =====================================================

var _cell_size = 32;

path_grid = mp_grid_create(
    0,
    0,
    room_width div _cell_size,
    room_height div _cell_size,
    _cell_size,
    _cell_size
);

boss_path = path_add();

path_timer = 0;
path_point = 1;


// =====================================================
// BUILD COLLISION GRID FROM "Col"
// =====================================================

if (collisionMap != noone)
{
    var _grid_width = room_width div _cell_size;
    var _grid_height = room_height div _cell_size;

    for (var _gx = 0; _gx < _grid_width; _gx++)
    {
        for (var _gy = 0; _gy < _grid_height; _gy++)
        {
            var _px = (_gx * _cell_size) + (_cell_size * 0.5);
            var _py = (_gy * _cell_size) + (_cell_size * 0.5);

            if (
                tilemap_get_at_pixel(
                    collisionMap,
                    _px,
                    _py
                ) != 0
            )
            {
                // Block this cell.
                mp_grid_add_cell(
                    path_grid,
                    _gx,
                    _gy
                );

                // Also block surrounding cells.
                // Gives Ifrit room to fit around walls.
                for (var _ox = -1; _ox <= 1; _ox++)
                {
                    for (var _oy = -1; _oy <= 1; _oy++)
                    {
                        var _bx = _gx + _ox;
                        var _by = _gy + _oy;

                        if (
                            _bx >= 0 &&
                            _bx < _grid_width &&
                            _by >= 0 &&
                            _by < _grid_height
                        )
                        {
                            mp_grid_add_cell(
                                path_grid,
                                _bx,
                                _by
                            );
                        }
                    }
                }
            }
        }
    }
}


// =====================================================
// TELEPORT SYSTEM
// =====================================================

teleportState = 0;
// 0 = normal
// 1 = escaping
// 2 = returning

teleportCooldown = 180;

teleportX = x;
teleportY = y;

image_speed = 1;


// =====================================================
// IFRIT TAUNT SYSTEM
// =====================================================

// First taunt after 5-10 seconds
tauntTimer = irandom_range(300, 600);

// Tracks which taunts have already played
tauntPlayed1 = false;
tauntPlayed2 = false;
tauntPlayed3 = false;

// =====================================================
// FIREBALL ATTACK
// =====================================================

fireballCooldown = 120;
fireballCooldownMax = 120;

// =====================================================
// DASH ATTACK
// =====================================================

dashCooldown = 180;
dashCooldownMax = 180;

dashRadius = 150;

dashSpeed = 10;
dashTimer = 0;
dashDuration = 30;

dashDirection = 0;

dashDamage = 40;

isDashing = false;