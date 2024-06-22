#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Init. Variables.
    draw = true;
    mtn_back = bg_ghz_parallax_mountain_1;
    sea_back = bg_ghz_parallax_water_1;
    cl_speed = 0;

    alarm[0] = 3.75;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=objGHZBG
*/
/// Update BG.
    switch ( sea_back )
    {
        case bg_ghz_parallax_water_1:
        mtn_back = bg_ghz_parallax_mountain_2;
        sea_back = bg_ghz_parallax_water_2;
        break;

        case bg_ghz_parallax_water_2:
        mtn_back = bg_ghz_parallax_mountain_3;
        sea_back = bg_ghz_parallax_water_3;
        break;

        case bg_ghz_parallax_water_3:
        mtn_back = bg_ghz_parallax_mountain_4;
        sea_back = bg_ghz_parallax_water_4;
        break;

        case bg_ghz_parallax_water_4:
        mtn_back = bg_ghz_parallax_mountain_1;
        sea_back = bg_ghz_parallax_water_1;
        break;
    }

 // Repeat:
    alarm[0] = 3.75;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Move Clouds.
    if ( draw == true ) cl_speed -= 0.5;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw the GHZ Background.

 // Draw the Colored Background (Doing it this way saves up more memory than drawing the color in the room, which fills the entire room.)
    draw_set_color(make_color_rgb(32, 0, 160) );
    draw_rectangle(view_xview[view_current], view_yview[view_current], view_xview[view_current]+view_wview, view_yview[view_current] + view_hview, false);
    draw_set_color(make_color_rgb(32, 0, 160) );

 // Draw the Ocean (The heights are all the same, so a for-loop is highly recommended.)
    for(a = 0; a < 7; a += 1){
        ax = 0.875 - (a * 0.05);
        ay = 0.125 + (a * 0.05);
        scr_draw_background_tiled_area(sea_back, 0, a * 16, view_xview[view_current] * ax, view_yview[view_current] + (a * 16) + 144, view_xview[view_current] * ay + view_wview, 16);
    }

 // Draw the Clouds (A speed variable is used to help it move separately from the others.)
    scr_draw_background_tiled_area(bg_ghz_parallax_clouds, 0,  0, view_xview[view_current] + (cl_speed * 0.75), view_yview[view_current] + 0 , view_wview - (cl_speed * 0.75), 32);
    scr_draw_background_tiled_area(bg_ghz_parallax_clouds, 0, 32, view_xview[view_current] + (cl_speed * 0.50), view_yview[view_current] + 32, view_wview - (cl_speed * 0.50), 16);
    scr_draw_background_tiled_area(bg_ghz_parallax_clouds, 0, 48, view_xview[view_current] + (cl_speed * 0.25), view_yview[view_current] + 48, view_wview - (cl_speed * 0.25), 16);

 // Draw the Mountains (This is the most basic one; this outlines what you're basically supposed to do.)
    scr_draw_background_tiled_area(mtn_back, 0,  0, view_xview[view_current] * 0.875, view_yview[view_current] + 64 , view_xview[view_current] * 0.125 + view_wview, 50);
    scr_draw_background_tiled_area(mtn_back, 0, 50, view_xview[view_current] * 0.850, view_yview[view_current] + 114, view_xview[view_current] * 0.150 + view_wview, 50);
