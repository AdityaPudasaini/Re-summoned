#macro COLLISION_TILE_SIZE 32

function GetCardinalDirection()
{
	if(direction >= 315 || direction < 45)
		return 0; // RIGHT

	if(direction >= 45 && direction < 135)
		return 1; // DOWN

	if(direction >= 135 && direction < 225)
		return 2; // LEFT

	return 3; // UP
}