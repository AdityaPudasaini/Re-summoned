// =====================================================
// FIREBALL MOVEMENT
// =====================================================

x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);


// =====================================================
// COLLISION WITH COL TILEMAP
// =====================================================

if(collisionMap != noone)
{
    if(tilemap_get_at_pixel(collisionMap, x, y) != 0)
    {
        instance_destroy();
        exit;
    }
}


// =====================================================
// DESTROY WHEN ANIMATION FINISHES
// =====================================================

if(image_index >= sprite_get_number(sprite_index) - 1)
{
    instance_destroy();
    exit;
}


// =====================================================
// DESTROY WHEN LEAVING ROOM
// =====================================================

if(x < 0 || x > room_width || y < 0 || y > room_height)
{
    instance_destroy();
    exit;
}