// =====================================================
// DEMON LORD FIREBALL
// =====================================================

damage = 30;

speed = 5;

direction = 0;

image_speed = 0.5;
image_index = 0;


// =====================================================
// COLLISION TILEMAP
// =====================================================

collisionMap = noone;

if (layer_exists("Col"))
{
    collisionMap = layer_tilemap_get_id(layer_get_id("Col"));
}
