#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.

     image_alpha = 0;
     TransitionComplete = false;
     Color              = c_black;
     ColorRed           = 0;
     ColorGreen         = 0;
     ColorBlue          = 0;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Go to the previous room.
    room_goto(global.PreviousRoom);
    global.BonusStage   = false;
    global.PreviousRoom = noone;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Colors.

//  Red:
    if(ColorRed < 255){
       ColorRed += 20;
    }

//  Green:
    if(ColorGreen < 255 && ColorRed > 255/2.5){
       ColorGreen += 20;
    }

//  Red:
    if(ColorBlue < 255 && ColorGreen > 255/2.5){
       ColorBlue += 20;
    }

//  End the transition:
    if(ColorBlue == 255){
       if(image_alpha < 1){
          image_alpha += 0.050;
       }else{
         StopSound_All()
         instance_destroy()
       }
    }
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Limit Colors.

    if(ColorRed > 255){
       ColorRed = 255;
    }
    if(ColorRed < 0){
       ColorRed = 0;
    }
    if(ColorGreen > 255){
       ColorGreen = 255;
    }
    if(ColorGreen < 0){
       ColorGreen = 0;
    }
    if(ColorBlue > 255){
       ColorBlue = 255;
    }
    if(ColorBlue < 0){
       ColorBlue = 0;
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw the Fade:

    draw_set_alpha(1){
                   if(Color = c_black){
                      draw_set_blend_mode(bm_subtract)
                   }else{
                      draw_set_blend_mode(bm_add)
                   }
                   draw_set_color(make_color_rgb(ColorRed, ColorGreen, ColorBlue))
                   draw_rectangle(view_xview, view_yview, view_xview+view_wview, view_yview+view_hview, false)
                   draw_set_blend_mode(bm_normal)
                   draw_set_alpha(image_alpha)
    }
    draw_set_blend_mode(-1)
    draw_set_alpha(1)
