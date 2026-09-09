// =====================================================
// HEALTH BAR
// =====================================================

var bar_x = 40;
var bar_y = 40;
var bar_w = 280;
var bar_h = 22;

var hp = clamp(health / maxHealth, 0, 1);


// =====================================================
// HEALTH SHADOW
// =====================================================

draw_set_color(make_color_rgb(0, 0, 0));

draw_rectangle(
    bar_x + 4,
    bar_y + 5,
    bar_x + bar_w + 4,
    bar_y + bar_h + 5,
    false
);


// =====================================================
// HEALTH OUTER FRAME
// =====================================================

draw_set_color(make_color_rgb(15, 12, 14));

draw_rectangle(
    bar_x - 4,
    bar_y - 4,
    bar_x + bar_w + 4,
    bar_y + bar_h + 4,
    false
);


// =====================================================
// HEALTH BACKGROUND
// =====================================================

draw_set_color(make_color_rgb(45, 20, 24));

draw_rectangle(
    bar_x,
    bar_y,
    bar_x + bar_w,
    bar_y + bar_h,
    false
);


// =====================================================
// HEALTH
// =====================================================

if (hp > 0)
{
    draw_set_color(make_color_rgb(185, 25, 35));

    draw_rectangle(
        bar_x,
        bar_y,
        bar_x + (bar_w * hp),
        bar_y + bar_h,
        false
    );


    draw_set_color(make_color_rgb(235, 55, 65));

    draw_rectangle(
        bar_x,
        bar_y,
        bar_x + (bar_w * hp),
        bar_y + 5,
        false
    );


    draw_set_color(make_color_rgb(125, 15, 25));

    draw_rectangle(
        bar_x,
        bar_y + bar_h - 5,
        bar_x + (bar_w * hp),
        bar_y + bar_h,
        false
    );
}


// =====================================================
// HEALTH HIGHLIGHT
// =====================================================

if (hp > 0)
{
    draw_set_color(make_color_rgb(255, 120, 120));

    draw_rectangle(
        bar_x + 2,
        bar_y + 2,
        bar_x + (bar_w * hp) - 2,
        bar_y + 3,
        false
    );
}


// =====================================================
// HEALTH OUTLINE
// =====================================================

draw_set_color(make_color_rgb(220, 190, 150));

draw_rectangle(
    bar_x,
    bar_y,
    bar_x + bar_w,
    bar_y + bar_h,
    true
);

draw_set_color(c_white);


// =====================================================
// MAGIC BAR
// =====================================================

var magic_bar_x = 40;

var magic_bar_y =
    bar_y + bar_h + 12;

var magic_bar_w = 280;
var magic_bar_h = 14;

var magic_percent =
    clamp(magic / maxMagic, 0, 1);


// =====================================================
// MAGIC SHADOW
// =====================================================

draw_set_color(make_color_rgb(0, 0, 0));

draw_rectangle(
    magic_bar_x + 3,
    magic_bar_y + 4,
    magic_bar_x + magic_bar_w + 3,
    magic_bar_y + magic_bar_h + 4,
    false
);


// =====================================================
// MAGIC FRAME
// =====================================================

draw_set_color(make_color_rgb(15, 12, 14));

draw_rectangle(
    magic_bar_x - 3,
    magic_bar_y - 3,
    magic_bar_x + magic_bar_w + 3,
    magic_bar_y + magic_bar_h + 3,
    false
);


// =====================================================
// MAGIC BACKGROUND
// =====================================================

draw_set_color(make_color_rgb(25, 25, 40));

draw_rectangle(
    magic_bar_x,
    magic_bar_y,
    magic_bar_x + magic_bar_w,
    magic_bar_y + magic_bar_h,
    false
);


// =====================================================
// MAGIC
// =====================================================

if (magic_percent > 0)
{
    draw_set_color(make_color_rgb(70, 70, 200));

    draw_rectangle(
        magic_bar_x,
        magic_bar_y,
        magic_bar_x +
            (magic_bar_w * magic_percent),
        magic_bar_y + magic_bar_h,
        false
    );


    draw_set_color(make_color_rgb(120, 120, 255));

    draw_rectangle(
        magic_bar_x,
        magic_bar_y,
        magic_bar_x +
            (magic_bar_w * magic_percent),
        magic_bar_y + 4,
        false
    );


    draw_set_color(make_color_rgb(45, 45, 140));

    draw_rectangle(
        magic_bar_x,
        magic_bar_y + magic_bar_h - 4,
        magic_bar_x +
            (magic_bar_w * magic_percent),
        magic_bar_y + magic_bar_h,
        false
    );
}


// =====================================================
// MAGIC THRESHOLDS
// =====================================================

draw_set_color(make_color_rgb(15, 35, 120));

var threshold_1 =
    magic_bar_x + (magic_bar_w / 3);

draw_line(
    threshold_1,
    magic_bar_y,
    threshold_1,
    magic_bar_y + magic_bar_h
);


var threshold_2 =
    magic_bar_x + ((magic_bar_w / 3) * 2);

draw_line(
    threshold_2,
    magic_bar_y,
    threshold_2,
    magic_bar_y + magic_bar_h
);


// =====================================================
// MAGIC BORDER
// =====================================================

draw_set_color(make_color_rgb(170, 170, 210));

draw_rectangle(
    magic_bar_x,
    magic_bar_y,
    magic_bar_x + magic_bar_w,
    magic_bar_y + magic_bar_h,
    true
);

draw_set_color(c_white);


// =====================================================
// DASH INDICATORS
// =====================================================

var dash_size = 8;
var dash_spacing = 28;

var dash_start_x =
    magic_bar_x + 10;

var dash_y =
    magic_bar_y + magic_bar_h + 12;


for (var i = 0; i < max_dashes; i++)
{
    var dx =
        dash_start_x +
        (i * dash_spacing);


    // =================================================
    // AVAILABLE / EMPTY
    // =================================================

    if (i < dashes_left)
    {
        // AVAILABLE DASH
        draw_set_color(
            make_color_rgb(220, 190, 150)
        );

        draw_triangle(
            dx,
            dash_y - dash_size,
            dx + dash_size,
            dash_y,
            dx,
            dash_y + dash_size,
            false
        );

        draw_triangle(
            dx,
            dash_y - dash_size,
            dx - dash_size,
            dash_y,
            dx,
            dash_y + dash_size,
            false
        );
    }
    else
    {
        // EMPTY DASH
        draw_set_color(
            make_color_rgb(35, 35, 35)
        );

        draw_triangle(
            dx,
            dash_y - dash_size,
            dx + dash_size,
            dash_y,
            dx,
            dash_y + dash_size,
            false
        );

        draw_triangle(
            dx,
            dash_y - dash_size,
            dx - dash_size,
            dash_y,
            dx,
            dash_y + dash_size,
            false
        );
    }
}


// Reset draw color
draw_set_color(c_white);
// =====================================================
// ABILITY TREE - DRAW GUI
// =====================================================

if (!ability_menu_open)
{
    exit;
}


// =====================================================
// GUI SIZE
// =====================================================

var _gw = display_get_gui_width();
var _gh = display_get_gui_height();


// =====================================================
// COLORS
// =====================================================

var _col_bg =
    make_color_rgb(7, 14, 20);

var _col_panel =
    make_color_rgb(12, 24, 31);

var _col_panel_border =
    make_color_rgb(55, 105, 120);

var _col_text =
    make_color_rgb(225, 235, 238);

var _col_dim =
    make_color_rgb(115, 140, 150);

var _col_blue =
    make_color_rgb(70, 180, 215);

var _col_blue_bright =
    make_color_rgb(145, 225, 245);

var _col_locked =
    make_color_rgb(22, 35, 42);

var _col_unlocked =
    make_color_rgb(25, 75, 80);

var _col_green =
    make_color_rgb(100, 220, 180);

var _col_gold =
    make_color_rgb(225, 195, 105);


// =====================================================
// BACKGROUND
// =====================================================

draw_set_alpha(0.96);

draw_set_color(_col_bg);

draw_rectangle(
    0,
    0,
    _gw,
    _gh,
    false
);

draw_set_alpha(1);


// =====================================================
// MAIN PANEL
// =====================================================

var _panel_x = 20;
var _panel_y = 18;

var _panel_w = _gw - 40;
var _panel_h = _gh - 36;

var _panel_right =
    _panel_x + _panel_w;

var _panel_bottom =
    _panel_y + _panel_h;


draw_set_color(_col_panel);

draw_rectangle(
    _panel_x,
    _panel_y,
    _panel_right,
    _panel_bottom,
    false
);


draw_set_color(_col_panel_border);

draw_rectangle(
    _panel_x,
    _panel_y,
    _panel_right,
    _panel_bottom,
    true
);


// =====================================================
// TEXT ALIGNMENT
// =====================================================

draw_set_halign(fa_center);
draw_set_valign(fa_middle);


// =====================================================
// TITLE
// =====================================================

draw_set_color(_col_text);

draw_text(
    _gw * 0.50,
    _panel_y + 22,
    "ABILITY TREE"
);


// =====================================================
// EMPOWER POINTS
// =====================================================

draw_set_color(_col_blue_bright);

draw_text(
    _gw * 0.50,
    _panel_y + 47,
    "EMPOWER POINTS: " +
    string(global.empower_points)
);


// =====================================================
// TREE DATA
// =====================================================

var _branches =
    global.ability_tree.children;

var _branch_count =
    array_length(_branches);


// =====================================================
// TREE POSITIONS
// =====================================================

var _root_x =
    _gw * 0.50;

var _root_y =
    _gh * 0.17;

var _branch_y =
    _gh * 0.38;

var _child_y =
    _gh * 0.64;


// Keep original alignment
var _spacing =
    _gw * 0.25;

var _first_x =
    _gw * 0.25;


// Node size
var _node_radius = 38;


// =====================================================
// ROOT GLOW
// =====================================================

draw_set_alpha(0.06);

draw_set_color(_col_blue);

draw_circle(
    _root_x,
    _root_y,
    66,
    false
);

draw_set_alpha(0.10);

draw_circle(
    _root_x,
    _root_y,
    57,
    false
);

draw_set_alpha(1);


// =====================================================
// ROOT NODE
// =====================================================

draw_set_color(
    make_color_rgb(20, 48, 58)
);

draw_circle(
    _root_x,
    _root_y,
    43,
    false
);


draw_set_color(_col_blue);

draw_circle(
    _root_x,
    _root_y,
    43,
    true
);


draw_set_color(
    make_color_rgb(9, 21, 27)
);

draw_circle(
    _root_x,
    _root_y,
    35,
    false
);


draw_set_color(
    make_color_rgb(95, 195, 220)
);

draw_circle(
    _root_x,
    _root_y,
    35,
    true
);


// =====================================================
// ROOT ICON
// =====================================================

draw_set_color(_col_text);

draw_text(
    _root_x,
    _root_y,
    "✦"
);


// =====================================================
// ROOT LABEL
// =====================================================

draw_set_color(_col_dim);

draw_text(
    _root_x,
    _root_y + 53,
    "EMPOWER"
);


// =====================================================
// ROOT -> BRANCH CONNECTIONS
// =====================================================

for (var i = 0; i < _branch_count; i++)
{
    var _bx =
        _first_x +
        (i * _spacing);

    var _branch =
        _branches[i];


    if (_branch.unlocked)
    {
        draw_set_color(_col_blue_bright);
    }
    else
    {
        draw_set_color(
            make_color_rgb(45, 85, 100)
        );
    }


    draw_line_width(
        _root_x,
        _root_y + 43,
        _bx,
        _branch_y - _node_radius,
        2
    );
}


// =====================================================
// DRAW BRANCHES
// =====================================================

for (var i = 0; i < _branch_count; i++)
{
    var _branch =
        _branches[i];

    var _bx =
        _first_x +
        (i * _spacing);


    var _selected =
        (
            i == ability_selected &&
            ability_tier == 0
        );


    // =================================================
    // BRANCH -> CHILD CONNECTION
    // =================================================

    if (array_length(_branch.children) > 0)
    {
        var _child =
            _branch.children[0];


        if (_branch.unlocked)
        {
            draw_set_color(_col_blue_bright);
        }
        else
        {
            draw_set_color(
                make_color_rgb(45, 80, 95)
            );
        }


        draw_line_width(
            _bx,
            _branch_y + _node_radius,
            _bx,
            _child_y - _node_radius,
            2
        );
    }


    // =================================================
    // SELECTED GLOW
    // =================================================

    if (_selected)
    {
        draw_set_alpha(0.06);

        draw_set_color(_col_blue_bright);

        draw_circle(
            _bx,
            _branch_y,
            64,
            false
        );

        draw_set_alpha(0.10);

        draw_circle(
            _bx,
            _branch_y,
            54,
            false
        );

        draw_set_alpha(1);
    }


    // =================================================
    // NODE BACKGROUND
    // =================================================

    if (_branch.unlocked)
    {
        draw_set_color(_col_unlocked);
    }
    else
    {
        draw_set_color(_col_locked);
    }


    draw_circle(
        _bx,
        _branch_y,
        _node_radius,
        false
    );


    // =================================================
    // NODE BORDER
    // =================================================

    if (_selected)
    {
        draw_set_color(_col_blue_bright);
    }
    else if (_branch.unlocked)
    {
        draw_set_color(_col_blue);
    }
    else
    {
        draw_set_color(
            make_color_rgb(55, 100, 115)
        );
    }


    draw_circle(
        _bx,
        _branch_y,
        _node_radius,
        true
    );


    // =================================================
    // INNER RING
    // =================================================

    draw_set_color(
        make_color_rgb(9, 20, 26)
    );

    draw_circle(
        _bx,
        _branch_y,
        _node_radius - 7,
        false
    );


    draw_set_color(
        make_color_rgb(50, 105, 120)
    );

    draw_circle(
        _bx,
        _branch_y,
        _node_radius - 7,
        true
    );


    // =================================================
    // ICON
    // =================================================

    draw_set_color(_col_text);


    switch (_branch.type)
    {
        // =============================================
        // HEART
        // =============================================

        case "health":

            draw_circle(
                _bx - 8,
                _branch_y - 6,
                8,
                false
            );

            draw_circle(
                _bx + 8,
                _branch_y - 6,
                8,
                false
            );

            draw_triangle(
                _bx - 16,
                _branch_y - 3,

                _bx + 16,
                _branch_y - 3,

                _bx,
                _branch_y + 18,

                false
            );

        break;


        // =============================================
        // MAGIC
        // =============================================

        case "magic":

            draw_line_width(
                _bx,
                _branch_y - 18,
                _bx + 13,
                _branch_y,
                3
            );

            draw_line_width(
                _bx + 13,
                _branch_y,
                _bx,
                _branch_y + 18,
                3
            );

            draw_line_width(
                _bx,
                _branch_y + 18,
                _bx - 13,
                _branch_y,
                3
            );

            draw_line_width(
                _bx - 13,
                _branch_y,
                _bx,
                _branch_y - 18,
                3
            );

            draw_line_width(
                _bx - 20,
                _branch_y - 15,
                _bx - 27,
                _branch_y - 22,
                2
            );

            draw_line_width(
                _bx + 20,
                _branch_y + 15,
                _bx + 27,
                _branch_y + 22,
                2
            );

        break;


        // =============================================
        // DASH
        // =============================================

        case "dash":

            draw_line_width(
                _bx - 18,
                _branch_y,
                _bx + 15,
                _branch_y,
                4
            );

            draw_line_width(
                _bx + 15,
                _branch_y,
                _bx + 4,
                _branch_y - 11,
                4
            );

            draw_line_width(
                _bx + 15,
                _branch_y,
                _bx + 4,
                _branch_y + 11,
                4
            );

            draw_line_width(
                _bx - 22,
                _branch_y - 11,
                _bx - 32,
                _branch_y - 11,
                2
            );

            draw_line_width(
                _bx - 22,
                _branch_y + 11,
                _bx - 32,
                _branch_y + 11,
                2
            );

        break;
    }


    // =================================================
    // BRANCH TEXT
    // ALL TEXT ON RIGHT SIDE
    // =================================================

    var _text_x =
        _bx + _node_radius + 18;

    draw_set_halign(fa_left);


    // Name
    draw_set_color(_col_text);

    draw_text(
        _text_x,
        _branch_y - 8,
        _branch.name
    );


    // Cost / status
    if (_branch.unlocked)
    {
        draw_set_color(_col_green);

        draw_text(
            _text_x,
            _branch_y + 13,
            "UNLOCKED"
        );
    }
    else
    {
        draw_set_color(_col_dim);

        draw_text(
            _text_x,
            _branch_y + 13,
            string(_branch.cost) + " POINT"
        );
    }


    draw_set_halign(fa_center);


    // =================================================
    // CHILD NODE
    // =================================================

    if (array_length(_branch.children) > 0)
    {
        var _child =
            _branch.children[0];


        var _child_selected =
            (
                i == ability_selected &&
                ability_tier == 1
            );


        // =============================================
        // CHILD GLOW
        // =============================================

        if (_child_selected)
        {
            draw_set_alpha(0.06);

            draw_set_color(_col_blue_bright);

            draw_circle(
                _bx,
                _child_y,
                64,
                false
            );


            draw_set_alpha(0.10);

            draw_circle(
                _bx,
                _child_y,
                54,
                false
            );

            draw_set_alpha(1);
        }


        // =============================================
        // CHILD BACKGROUND
        // =============================================

        if (_child.unlocked)
        {
            draw_set_color(_col_unlocked);
        }
        else
        {
            draw_set_color(_col_locked);
        }


        draw_circle(
            _bx,
            _child_y,
            _node_radius,
            false
        );


        // =============================================
        // CHILD BORDER
        // =============================================

        if (_child_selected)
        {
            draw_set_color(_col_blue_bright);
        }
        else if (_child.unlocked)
        {
            draw_set_color(_col_blue);
        }
        else
        {
            draw_set_color(
                make_color_rgb(55, 100, 115)
            );
        }


        draw_circle(
            _bx,
            _child_y,
            _node_radius,
            true
        );


        // =============================================
        // CHILD INNER RING
        // =============================================

        draw_set_color(
            make_color_rgb(9, 20, 26)
        );

        draw_circle(
            _bx,
            _child_y,
            _node_radius - 7,
            false
        );


        draw_set_color(
            make_color_rgb(50, 105, 120)
        );

        draw_circle(
            _bx,
            _child_y,
            _node_radius - 7,
            true
        );


        // =============================================
        // CHILD ICON
        // =============================================

        draw_set_color(_col_text);


        switch (_child.type)
        {
            // =========================================
            // HEART
            // =========================================

            case "health":

                draw_circle(
                    _bx - 8,
                    _child_y - 6,
                    8,
                    false
                );

                draw_circle(
                    _bx + 8,
                    _child_y - 6,
                    8,
                    false
                );

                draw_triangle(
                    _bx - 16,
                    _child_y - 3,

                    _bx + 16,
                    _child_y - 3,

                    _bx,
                    _child_y + 18,

                    false
                );

            break;


            // =========================================
            // MAGIC
            // =========================================

            case "magic":

                draw_line_width(
                    _bx,
                    _child_y - 18,
                    _bx + 13,
                    _child_y,
                    3
                );

                draw_line_width(
                    _bx + 13,
                    _child_y,
                    _bx,
                    _child_y + 18,
                    3
                );

                draw_line_width(
                    _bx,
                    _child_y + 18,
                    _bx - 13,
                    _child_y,
                    3
                );

                draw_line_width(
                    _bx - 13,
                    _child_y,
                    _bx,
                    _child_y - 18,
                    3
                );

            break;


            // =========================================
            // DASH
            // =========================================

            case "dash":

                draw_line_width(
                    _bx - 18,
                    _child_y,
                    _bx + 15,
                    _child_y,
                    4
                );

                draw_line_width(
                    _bx + 15,
                    _child_y,
                    _bx + 4,
                    _child_y - 11,
                    4
                );

                draw_line_width(
                    _bx + 15,
                    _child_y,
                    _bx + 4,
                    _child_y + 11,
                    4
                );

                draw_line_width(
                    _bx - 22,
                    _child_y - 11,
                    _bx - 32,
                    _child_y - 11,
                    2
                );

                draw_line_width(
                    _bx - 22,
                    _child_y + 11,
                    _bx - 32,
                    _child_y + 11,
                    2
                );

            break;
        }


        // =============================================
        // CHILD TEXT
        // ALL TEXT ON RIGHT SIDE
        // =============================================

        var _child_text_x =
            _bx + _node_radius + 18;

        draw_set_halign(fa_left);


        // Child name
        draw_set_color(_col_text);

        draw_text(
            _child_text_x,
            _child_y - 8,
            _child.name
        );


        // Child status
        if (_child.unlocked)
        {
            draw_set_color(_col_green);

            draw_text(
                _child_text_x,
                _child_y + 13,
                "UNLOCKED"
            );
        }
        else
        {
            draw_set_color(_col_dim);

            draw_text(
                _child_text_x,
                _child_y + 13,
                string(_child.cost) + " POINTS"
            );
        }


        draw_set_halign(fa_center);
    }
}


// =====================================================
// SELECTED ABILITY
// =====================================================

var _selected_branch =
    _branches[ability_selected];

var _selected_ability =
    _selected_branch;


if (
    ability_tier == 1 &&
    array_length(_selected_branch.children) > 0
)
{
    _selected_ability =
        _selected_branch.children[0];
}


// =====================================================
// DESCRIPTION PANEL
// =====================================================

var _desc_w = 430;
var _desc_h = 78;

var _desc_x =
    (_gw * 0.50) -
    (_desc_w * 0.50);

var _desc_y =
    _gh - 125;


// =====================================================
// DESCRIPTION BACKGROUND
// =====================================================

draw_set_alpha(0.94);

draw_set_color(
    make_color_rgb(8, 18, 24)
);

draw_rectangle(
    _desc_x,
    _desc_y,
    _desc_x + _desc_w,
    _desc_y + _desc_h,
    false
);

draw_set_alpha(1);


// =====================================================
// DESCRIPTION BORDER
// =====================================================

draw_set_color(
    make_color_rgb(60, 125, 145)
);

draw_rectangle(
    _desc_x,
    _desc_y,
    _desc_x + _desc_w,
    _desc_y + _desc_h,
    true
);


// =====================================================
// SELECTED NAME
// =====================================================

draw_set_halign(fa_center);

draw_set_color(_col_blue_bright);

draw_text(
    _gw * 0.50,
    _desc_y + 14,
    string_upper(
        _selected_ability.name
    )
);


// =====================================================
// DESCRIPTION
// =====================================================

var _description = "";


switch (_selected_ability.type)
{
    case "health":

        _description =
            "Increase maximum health by " +
            string(_selected_ability.value);

    break;


    case "magic":

        _description =
            "Increase maximum magic by " +
            string(_selected_ability.value);

    break;


    case "dash":

        _description =
            "Gain +" +
            string(_selected_ability.value) +
            " maximum dash";

    break;


    default:

        _description =
            "Empower yourself.";

    break;
}


draw_set_color(_col_text);

draw_text(
    _gw * 0.50,
    _desc_y + 37,
    _description
);


// =====================================================
// COST
// =====================================================

if (_selected_ability.unlocked)
{
    draw_set_color(_col_green);

    draw_text(
        _gw * 0.50,
        _desc_y + 59,
        "UNLOCKED"
    );
}
else
{
    draw_set_color(_col_blue);

    draw_text(
        _gw * 0.50,
        _desc_y + 59,
        "COST: " +
        string(_selected_ability.cost)
    );
}


// =====================================================
// ABILITY MESSAGE
// =====================================================

if (ability_message_timer > 0)
{
    draw_set_color(_col_gold);

    draw_text(
        _gw * 0.50,
        _gh - 35,
        ability_message
    );
}


// =====================================================
// CONTROLS
// =====================================================

draw_set_color(_col_dim);

draw_text(
    _gw * 0.50,
    _gh - 14,
    "A / D: Select     W / S: Tier     ENTER: Unlock     TAB: Close"
);


// =====================================================
// RESET DRAW SETTINGS
// =====================================================

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_alpha(1);
draw_set_color(c_white);