#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
globalvar light;
light = surface_create(global.ScreenWidth,global.ScreenHeight)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!surface_exists(light)){
light = surface_create(global.ScreenWidth,global.ScreenHeight)
}
surface_set_target(light);
draw_set_color(c_ltgray);
draw_rectangle(0,0,global.ScreenWidth,global.ScreenHeight,false)
surface_reset_target()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_subtract);
draw_surface(light,view_xview,view_yview)
draw_set_blend_mode(bm_normal)
