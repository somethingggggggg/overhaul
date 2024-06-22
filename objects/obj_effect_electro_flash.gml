#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Set Alpha.
    Alpha    = 1;
    alarm[0] = 1;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Change Alpha.
    if(Alpha > 0){
       Alpha   -= .1;
       alarm[0] =  1;
    }else{
       instance_destroy();
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Flash.
    draw_set_alpha(Alpha)
    draw_set_color(c_white)
    draw_rectangle(view_xview, global.WaterSurfacePosition-5, view_xview+view_wview, global.WaterSurfacePosition-5+view_hview, false)
    draw_set_alpha(1)
