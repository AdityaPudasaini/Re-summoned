// =====================================================
// DEMON LORD FIREBALL
// =====================================================

damage = 30;

speed = 3;

direction = 0;

image_speed = 0.5;
image_index = 0;

life = 90; // 2 seconds at 60 FPS

// =====================================================
// COLLISION TILEMAP
// =====================================================

collisionMap = noone;

if (layer_exists("Col"))
{
    collisionMap = layer_tilemap_get_id(layer_get_id("Col"));
}
