function CreateAbilityTree()
{
    // =================================================
    // ROOT
    // =================================================

    var root = new AbilityNode(
        "EMPOWER",
        0,
        "none",
        0
    );

    // Root is automatically unlocked.
    // It is not an ability the player purchases.
    root.unlocked = true;


    // =================================================
    // FIRST TIER
    // =================================================

    var healthNode = new AbilityNode(
        "Vitality",
        1,
        "health",
        10
    );


    var magicNode = new AbilityNode(
        "Arcane",
        1,
        "magic",
        20
    );


    var dashNode = new AbilityNode(
        "Momentum",
        1,
        "dash",
        1
    );


    // =================================================
    // SECOND TIER
    // =================================================

    var health2 = new AbilityNode(
        "Greater Vitality",
        2,
        "health",
        20
    );


    var magic2 = new AbilityNode(
        "Greater Arcana",
        2,
        "magic",
        30
    );


    var dash2 = new AbilityNode(
        "Swift Dash",
        2,
        "dash",
        1
    );


    // =================================================
    // PARENTS
    // =================================================

    healthNode.parent = root;
    magicNode.parent = root;
    dashNode.parent = root;

    health2.parent = healthNode;
    magic2.parent = magicNode;
    dash2.parent = dashNode;


    // =================================================
    // FIRST TIER
    // =================================================

    array_push(
        root.children,
        healthNode
    );

    array_push(
        root.children,
        magicNode
    );

    array_push(
        root.children,
        dashNode
    );


    // =================================================
    // SECOND TIER
    // =================================================

    array_push(
        healthNode.children,
        health2
    );

    array_push(
        magicNode.children,
        magic2
    );

    array_push(
        dashNode.children,
        dash2
    );


    return root;
}