#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.

     image_alpha = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Colors.

    if(image_alpha > 0){
       image_alpha -= .10;
    }else{
       instance_destroy()
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw the Fade:

    draw_set_alpha(image_alpha)
    draw_set_color(c_white)
    draw_rectangle(view_xview, view_yview, view_xview+view_wview, view_yview+view_hview, false)
    draw_set_alpha(1)
