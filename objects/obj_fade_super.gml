#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.

     image_alpha = 0;
     TransitionComplete = false;
     Color              = c_red;
     ColorRed           = 0;
     ColorGreen         = 0;
     ColorBlue          = 0;
     Scale              = -15;
     State              = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Colors.

//  Red:
    if(ColorRed < 255){
       ColorRed += 15;
    }

//  Green:
    if(ColorGreen < 255 && ColorRed > 255/2.5){
       ColorGreen += 15;
    }

//  Red:
    if(ColorBlue < 255 && ColorGreen > 255/2.5){
       ColorBlue += 15;
    }

//  End the transition:
    if(ColorBlue == 255 && State == 1){
       if(image_alpha < 1){
          image_alpha += 0.1;
       }else{
          State = 2;
       }
    }

    if(State = 2){
       if(image_alpha != 0){
          image_alpha -= 0.025;
       }else{
          instance_destroy();
       }
    }

    Scale += 5;
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
/// Draw the Fade.

    if(State == 1){
    draw_set_alpha(1){
                   if(Color = c_black){
                      draw_set_blend_mode_ext(bm_inv_src_color, bm_inv_dest_color)
                   }else{
                      draw_set_blend_mode(bm_add)
                   }
                   draw_set_color(make_color_rgb(ColorRed, ColorGreen, ColorBlue))
                   draw_circle(Parent.x, Parent.y, 16+Scale, false)
                   draw_set_blend_mode(bm_normal)
                   draw_set_alpha(image_alpha)
    }
    draw_set_blend_mode(-1)
    draw_set_alpha(1)
    }else{
                   if(Color = c_black){
                      draw_set_blend_mode(bm_subtract)
                   }else{
                      draw_set_blend_mode(bm_add)
                   }

                   draw_set_color(make_color_rgb(ColorRed, ColorGreen, ColorBlue))
                   draw_set_alpha(image_alpha)
                   draw_circle(Parent.x, Parent.y, 16+Scale, false)
                   draw_set_blend_mode(-1)
    }
    draw_set_blend_mode(-1)
    draw_set_alpha(1)
