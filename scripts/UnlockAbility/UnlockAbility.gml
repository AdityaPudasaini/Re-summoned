function UnlockAbility(_ability)
{
    // =================================================
    // ALREADY UNLOCKED
    // =================================================

    if (_ability.unlocked)
    {
        return false;
    }


    // =================================================
    // PARENT REQUIREMENT
    // =================================================

    if (
        _ability.parent != undefined &&
        !_ability.parent.unlocked
    )
    {
        return false;
    }


    // =================================================
    // CHECK POINTS
    // =================================================

    if (global.empower_points < _ability.cost)
    {
        return false;
    }


    // =================================================
    // SPEND POINTS
    // =================================================

    global.empower_points -= _ability.cost;


    // =================================================
    // UNLOCK
    // =================================================

    _ability.unlocked = true;


    // =================================================
    // APPLY EFFECT
    // =================================================

    switch (_ability.type)
    {
        case "health":

            maxHealth += _ability.value;
            health += _ability.value;

            break;


        case "magic":

            maxMagic += _ability.value;
            magic += _ability.value;

            break;


        case "dash":

		    max_dashes += _ability.value;

		    dashes_left = min(
		        dashes_left + _ability.value,
		        max_dashes
		    );

		    break;
    }


    return true;
}