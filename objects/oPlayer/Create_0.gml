image_xscale = 2;
image_yscale = 2;

collisionMap = noone;

if (layer_exists("Col")) {
    collisionMap = layer_tilemap_get_id(layer_get_id("Col"));
}


// =====================================================
// SPRITES
// =====================================================

spriteIdle   = sIdle;
spriteWalk   = sIdle;
spriteRun    = sIdle;
spriteAttack = sSwordAttack;


// =====================================================
// MOVEMENT
// =====================================================

hSpeed = 0;
vSpeed = 0;

direction = 0;

CARDINAL_DIRECTION = 0;

speedWalk = 3;
speedRun  = 6;


// =====================================================
// INPUT STATE
// =====================================================

inputMagnitude = 0;
inputDirection = 0;

keyAttack   = false;
keyRun      = false;
keyActivate = false;


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
// DASH STATE
// =====================================================

dashDistance = 64;
dashSpeed = 8;
moveDistanceRemaining = 0;


// =====================================================
// STATE MACHINE
// =====================================================

state = PlayerStateFree;