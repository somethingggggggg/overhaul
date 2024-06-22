#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Flashlight Mode.
if instance_exists(obj_flashlight){
size = 230;
draw_set_blend_mode(bm_subtract)
surface_set_target(light);
draw_ellipse_color(x-size/2-view_xview,y-size/2-view_yview,x+size/2-view_xview,y+size/2-view_yview,c_red,c_black,false)
surface_reset_target()
draw_set_blend_mode(bm_normal)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw.

    draw_sprite(sprite_index, current_time div 120, x, y);
