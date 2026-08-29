function PlayerCollision()
{
    if (collisionMap == noone)
    {
        x += hSpeed;
        y += vSpeed;
        return;
    }

    // Move and resolve X and Y separately so sliding along walls works
    x += hSpeed;

    if (tilemap_get_at_pixel(collisionMap, x, y) != 0)
    {
        x -= hSpeed;
    }

    y += vSpeed;

    if (tilemap_get_at_pixel(collisionMap, x, y) != 0)
    {
        y -= vSpeed;
    }
}