#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy if the Surface height is -1.
    alarm[0] = 5;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy if the Surface height is -1.
if(global.WaterSurfacePosition == -1){
   instance_destroy();
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw the Water.

 // Draw the Water below the surface:
    var water_y;
    water_y = max(global.WaterSurfacePosition-view_yview, 0);
    draw_set_blend_mode_ext(bm_dest_color, bm_src_alpha_sat);
    draw_set_color(make_color_rgb(107, 107, 148)); // < Change this if you want to use a different color.
    draw_rectangle(view_xview, view_yview+water_y-8, view_xview+view_wview, view_yview+view_hview, 0);
    draw_set_color(c_white);
    draw_set_blend_mode(bm_normal);


 // Draw the Surface:
    scr_draw_sprite_tiled_horizontal1(spr_water_surface, current_time div 80, view_xview, global.WaterSurfacePosition);
