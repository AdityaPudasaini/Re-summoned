if (!variable_global_exists("dialogue_active"))
{
    global.dialogue_active = false;
}

image_xscale = 0.4;
image_yscale = 0.4;

collisionMap = noone;

if (layer_exists("Col"))
{
    collisionMap = layer_tilemap_get_id(layer_get_id("Col"));
}

// =====================================================
// BOSS INTRO LOCK
// =====================================================

boss_intro_active = false;


// =====================================================
// ABILITY TREE
// =====================================================

// Keep ability data between room changes
if (!variable_global_exists("empower_points"))
{
    global.empower_points = 10;
}

if (!variable_global_exists("ability_tree"))
{
    global.ability_tree = CreateAbilityTree();
}


// =====================================================
// BASIC PLAYER
// =====================================================

dash_cooldown = 0;

maxHealth = 100;
health = maxHealth;


// =====================================================
// SPRITES
// =====================================================

spriteIdle = sIdle;
spriteWalk = sWalkLeft;
spriteRun = sIdle;

facingDirection = 0;

dashDirection = 0;

dashDistance = 250;
dashSpeed = 16;

max_dashes = 3;
dashes_left = max_dashes;

dash_cooldown_time = 90;
dash_cooldown = 0;


moveDistanceRemaining = 0;

attackDirection = 0;


// =====================================================
// MAGIC
// =====================================================

magic = 0;
maxMagic = 100;

magicDirection = 0;
magicTimer = 0;
magicFired = false;

magicRechargeSpeed = 0.15;
magicCost = 40;


// =====================================================
// MOVEMENT
// =====================================================

hSpeed = 0;
vSpeed = 0;

direction = 0;

CARDINAL_DIRECTION = 0;

speedWalk = 3;
speedRun = 6;


// =====================================================
// INPUT STATE
// =====================================================

inputMagnitude = 0;
inputDirection = 0;

keyAttack = false;
keyRun = false;
keyActivate = false;
keyMagic = false;


// =====================================================
// ANIMATION
// =====================================================

localFrame = 0;
animSpeed = 0.15;


// =====================================================
// ATTACK STATE
// =====================================================

attacking = false;

attack_duration = 26;
attack_timer = 0;


// =====================================================
// HURT / INVINCIBILITY
// =====================================================

isHurt = false;

invincible = false;

invincibilityTime = 60;
invincibilityTimer = 0;
invincibilityFlashTimer = 0;


// =====================================================
// ABILITY MENU
// =====================================================

ability_menu_open = false;

ability_selected = 0;
ability_tier = 0;

ability_message = "";
ability_message_timer = 0;


// =====================================================
// APPLY PREVIOUSLY UNLOCKED ABILITIES
// =====================================================

// This makes unlocked abilities remain effective
// after changing/re-entering rooms.

for (var i = 0; i < array_length(global.ability_tree.children); i++)
{
    var _ability = global.ability_tree.children[i];

    if (_ability.unlocked)
    {
        switch (_ability.type)
        {
            case "health":
                maxHealth += _ability.value;
                break;

            case "magic":
                maxMagic += _ability.value;
                break;

            case "dash":
                max_dashes += _ability.value;
                break;
        }


        // Second tier
        for (var j = 0; j < array_length(_ability.children); j++)
        {
            var _child = _ability.children[j];

            if (_child.unlocked)
            {
                switch (_child.type)
                {
                    case "health":
                        maxHealth += _child.value;
                        break;

                    case "magic":
                        maxMagic += _child.value;
                        break;

                    case "dash":
                        max_dashes += _child.value;
                        break;
                }
            }
        }
    }
}


// Start with full upgraded health/magic
health = maxHealth;
magic = maxMagic;


// =====================================================
// STATE MACHINE
// =====================================================

state = PlayerStateFree;