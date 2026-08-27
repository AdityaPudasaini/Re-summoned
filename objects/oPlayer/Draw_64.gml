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
// DARK BACKGROUND
// =====================================================

draw_set_alpha(0.92);

draw_set_color(
    make_color_rgb(10, 8, 15)
);

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

var _panel_x = _gw * 0.08;
var _panel_y = _gh * 0.06;

var _panel_w = _gw * 0.84;
var _panel_h = _gh * 0.88;


// Shadow
draw_set_color(c_black);

draw_rectangle(
    _panel_x + 6,
    _panel_y + 6,
    _panel_x + _panel_w + 6,
    _panel_y + _panel_h + 6,
    false
);


// Panel
draw_set_color(
    make_color_rgb(20, 16, 25)
);

draw_rectangle(
    _panel_x,
    _panel_y,
    _panel_x + _panel_w,
    _panel_y + _panel_h,
    false
);


// Border
draw_set_color(
    make_color_rgb(190, 165, 130)
);

draw_rectangle(
    _panel_x,
    _panel_y,
    _panel_x + _panel_w,
    _panel_y + _panel_h,
    true
);


// =====================================================
// TEXT SETTINGS
// =====================================================

draw_set_halign(fa_center);
draw_set_valign(fa_middle);


// =====================================================
// TITLE
// =====================================================

draw_set_color(c_white);

draw_text(
    _gw * 0.50,
    _panel_y + 32,
    "ABILITY TREE"
);


// =====================================================
// EMPOWER POINTS
// =====================================================

draw_set_color(
    make_color_rgb(220, 190, 145)
);

draw_text(
    _gw * 0.50,
    _panel_y + 63,
    "Empower Points: " +
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

var _root_x = _gw * 0.50;
var _root_y = _panel_y + 115;

var _branch_y = _panel_y + 260;
var _child_y = _panel_y + 385;

var _spacing = _gw * 0.22;

var _first_x =
    _gw * 0.50 -
    _spacing;


// =====================================================
// ROOT
// =====================================================

draw_set_color(
    make_color_rgb(38, 32, 48)
);

draw_rectangle(
    _root_x - 75,
    _root_y - 30,
    _root_x + 75,
    _root_y + 30,
    false
);

draw_set_color(
    make_color_rgb(130, 110, 145)
);

draw_rectangle(
    _root_x - 75,
    _root_y - 30,
    _root_x + 75,
    _root_y + 30,
    true
);

draw_set_color(c_white);

draw_text(
    _root_x,
    _root_y,
    "EMPOWER"
);


// =====================================================
// ROOT → BRANCH LINES
// =====================================================

draw_set_color(
    make_color_rgb(90, 75, 105)
);

for (var i = 0; i < _branch_count; i++)
{
    var _bx =
        _first_x +
        (i * _spacing);

    draw_line(
        _root_x,
        _root_y + 30,
        _bx,
        _branch_y - 45
    );
}


// =====================================================
// DRAW BRANCHES
// =====================================================

for (var i = 0; i < _branch_count; i++)
{
    var _branch = _branches[i];

    var _bx =
        _first_x +
        (i * _spacing);

    var _selected =
        (i == ability_selected &&
         ability_tier == 0);


    // -------------------------------------------------
    // BRANCH → CHILD LINE
    // -------------------------------------------------

    if (array_length(_branch.children) > 0)
    {
        draw_set_color(
            make_color_rgb(90, 75, 105)
        );

        draw_line(
            _bx,
            _branch_y + 45,
            _bx,
            _child_y - 45
        );
    }


    // -------------------------------------------------
    // BRANCH BACKGROUND
    // -------------------------------------------------

    if (_branch.unlocked)
    {
        draw_set_color(
            make_color_rgb(45, 90, 55)
        );
    }
    else if (_selected)
    {
        draw_set_color(
            make_color_rgb(105, 70, 30)
        );
    }
    else
    {
        draw_set_color(
            make_color_rgb(38, 33, 48)
        );
    }


    draw_rectangle(
        _bx - 75,
        _branch_y - 40,
        _bx + 75,
        _branch_y + 40,
        false
    );


    // -------------------------------------------------
    // BRANCH BORDER
    // -------------------------------------------------

    if (_selected)
    {
        draw_set_color(
            make_color_rgb(255, 210, 90)
        );
    }
    else
    {
        draw_set_color(
            make_color_rgb(145, 125, 155)
        );
    }


    draw_rectangle(
        _bx - 75,
        _branch_y - 40,
        _bx + 75,
        _branch_y + 40,
        true
    );


    // -------------------------------------------------
    // BRANCH NAME
    // -------------------------------------------------

    draw_set_color(c_white);

    draw_text(
        _bx,
        _branch_y - 12,
        _branch.name
    );


    // -------------------------------------------------
    // BRANCH COST / STATUS
    // -------------------------------------------------

    if (_branch.unlocked)
    {
        draw_set_color(
            make_color_rgb(120, 230, 140)
        );

        draw_text(
            _bx,
            _branch_y + 15,
            "UNLOCKED"
        );
    }
    else
    {
        draw_set_color(c_white);

        draw_text(
            _bx,
            _branch_y + 15,
            string(_branch.cost) + " POINT"
        );
    }


    // =================================================
    // CHILD
    // =================================================

    if (array_length(_branch.children) > 0)
    {
        var _child =
            _branch.children[0];

        var _child_selected =
            (i == ability_selected &&
             ability_tier == 1);


        // -------------------------------------------------
        // CHILD BACKGROUND
        // -------------------------------------------------

        if (_child.unlocked)
        {
            draw_set_color(
                make_color_rgb(45, 90, 55)
            );
        }
        else if (_child_selected)
        {
            draw_set_color(
                make_color_rgb(105, 70, 30)
            );
        }
        else
        {
            draw_set_color(
                make_color_rgb(32, 29, 40)
            );
        }


        draw_rectangle(
            _bx - 75,
            _child_y - 40,
            _bx + 75,
            _child_y + 40,
            false
        );


        // -------------------------------------------------
        // CHILD BORDER
        // -------------------------------------------------

        if (_child_selected)
        {
            draw_set_color(
                make_color_rgb(255, 210, 90)
            );
        }
        else
        {
            draw_set_color(
                make_color_rgb(120, 105, 130)
            );
        }


        draw_rectangle(
            _bx - 75,
            _child_y - 40,
            _bx + 75,
            _child_y + 40,
            true
        );


        // -------------------------------------------------
        // CHILD NAME
        // -------------------------------------------------

        draw_set_color(c_white);

        draw_text(
            _bx,
            _child_y - 12,
            _child.name
        );


        // -------------------------------------------------
        // CHILD STATUS
        // -------------------------------------------------

        if (_child.unlocked)
        {
            draw_set_color(
                make_color_rgb(120, 230, 140)
            );

            draw_text(
                _bx,
                _child_y + 15,
                "UNLOCKED"
            );
        }
        else
        {
            draw_set_color(c_white);

            draw_text(
                _bx,
                _child_y + 15,
                string(_child.cost) + " POINT"
            );
        }
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
// MESSAGE AREA
// =====================================================

draw_set_color(
    make_color_rgb(190, 180, 200)
);

draw_text(
    _gw * 0.50,
    _gh - 105,
    "Selected: " +
    _selected_ability.name
);


// =====================================================
// UNLOCK MESSAGE
// =====================================================

if (ability_message_timer > 0)
{
    draw_set_color(
        make_color_rgb(255, 210, 90)
    );

    draw_text(
        _gw * 0.50,
        _gh - 78,
        ability_message
    );
}


// =====================================================
// CONTROLS
// =====================================================

draw_set_color(
    make_color_rgb(170, 165, 180)
);

draw_text(
    _gw * 0.50,
    _gh - 42,
    "TAB: Close    A/D: Branch    W/S: Tier    ENTER: Unlock    P: +1 Point"
);


// =====================================================
// RESET DRAW SETTINGS
// =====================================================

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_alpha(1);
draw_set_color(c_white);