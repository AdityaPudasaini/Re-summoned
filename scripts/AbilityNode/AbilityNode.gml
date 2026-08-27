function AbilityNode(
    _name,
    _cost,
    _type,
    _value
) constructor
{
    name = _name;

    cost = _cost;

    type = _type;

    value = _value;

    unlocked = false;

    children = [];

    parent = undefined;
}