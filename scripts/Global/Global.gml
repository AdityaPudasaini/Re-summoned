#macro COLLISION_TILE_SIZE 32

function GetCardinalDirection() {
    if (direction >= 45 && direction < 135) return 1;   // up
    if (direction >= 135 && direction < 225) return 2;  // left
    if (direction >= 225 && direction < 315) return 3;  // right
    return 0;                                            // down
}