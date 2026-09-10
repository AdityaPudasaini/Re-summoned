/// @description God boss initialization

boss_name = "God";
maxHealth = 1500;
health = maxHealth;
max_health = maxHealth;
solid = false;
boss_active = true;
facingDirection = 0;
hurt_flash = 0;

// Small physical body collision used by PlayerCollision().
god_collision_radius = 25;
collisionRadius = god_collision_radius;
swordDamage = 25;
fireballDamage = 20;

boss_bar_width = 500;
boss_bar_height = 22;
boss_bar_y = 55;

// =====================================================
// ATTACK THRESHOLDS
// =====================================================

// Close: player is inside this distance.
closeRangeMin = 0;
closeRangeMax = 110;

// Mid: player is between close and mid thresholds.
midRangeMin = 111;
midRangeMax = 300;

// Spread: player is farther than the mid threshold.
spreadRangeMin = 301;

// =====================================================
// CLOSE-RANGE ATTACK
// =====================================================

closeAttacking = false;
closeAttackHit = false;
closeAttackCooldown = 0;
closeAttackCooldownTime = 150;
closeAttackHitFrame = 3;
closeAttackDamage = 20;
closeAttackImageSpeed = 1;
closeAttackHitDistance = 105;
closeAttackHitWidth = 70;

// =====================================================
// MID-RANGE ATTACK
// =====================================================

midAttacking = false;
midAttackHit = false;
midAttackCooldown = 0;
midAttackCooldownTime = 210;
midAttackHitFrame = 3;
midAttackDamage = 20;
midAttackImageSpeed = 1;
midAttackHitDistance = 300;
midAttackHitWidth = 115;

// =====================================================
// SPREAD ATTACK
// =====================================================

spreadAttacking = false;
spreadFired = false;
spreadPhase = 0;
spreadWave = 0;
spreadWaveTimer = 0;
spreadCooldown = 0;
attackRecovery = 0;
contactDamage = 10;
contactDamageCooldown = 0;
contactDamageCooldownTime = 45;
spreadCooldownTime = 360;
spreadImageSpeed = 1;
spreadDamage = 10;
spreadProjectileSpeed = 6.5;
spreadProjectileCount = 8;
spreadProjectileArc = 45;
spreadWaveCount = 3;
spreadWaveDelay = 18;
spreadWaveRotation = 22.5;


image_xscale = 0.5;
image_yscale = 0.5;