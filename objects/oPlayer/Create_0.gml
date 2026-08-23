image_xscale = 0.5;
image_yscale = 0.5;

collisionMap = noone;

if (layer_exists("Col")) {
    collisionMap = layer_tilemap_get_id(layer_get_id("Col"));
}


// =====================================================
// SPRITES
// =====================================================

spriteIdle   = sIdle;
spriteWalk   = sWalkLeft;
spriteRun    = sIdle;
spriteAttack = sSwordAttack;

facingDirection = 0; 

dashDirection = 0;

dashDistance = 250;
dashSpeed = 25;

moveDistanceRemaining = 0;

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
// STATE MACHINE
// =====================================================

state = PlayerStateFree;