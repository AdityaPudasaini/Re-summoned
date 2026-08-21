function PlayerAnimateSprite() {
    localFrame += animSpeed;

    var _framesPerRow = sprite_get_number(sprite_index) / 4;
    if (localFrame >= _framesPerRow) localFrame = 0;

    image_index = (GetCardinalDirection() * _framesPerRow) + floor(localFrame);
}