/// @description God spread-attack void projectile

speed = 6.5;
direction = 0;
damage = 15;
image_index = 0;
image_speed = 0.6;

collisionMap = noone;

if (layer_exists("Col"))
{
    collisionMap = layer_tilemap_get_id(layer_get_id("Col"));
}
