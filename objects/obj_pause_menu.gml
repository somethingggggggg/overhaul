#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.

    image_speed = 0;
    _alpha      = 0;
    _x          = global.ScreenWidth;
    Option_ID   = 1;
    Finished    = 0;
    Restart     = 0;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Restart the level.
    if(Restart == true){
    global.CheckpointX = -1
    global.CheckpointY = -1
       instance_create(0, 0, obj_fade_restart);
    }
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Slide to the center of the view and darken the background.

    if(Finished == false){
        _alpha += (0.5-_alpha)*0.05;
       _x      += (global.ScreenWidth/2-_x)*0.25;
    }else{
       _alpha += (0-_alpha)*0.10;
       _x     += (global.ScreenWidth+100-_x)*0.10;
       if(_x >= global.ScreenWidth+64){
          instance_destroy();
       }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Change and select options.

 // Change Options:
    if(keyboard_check_pressed(global.Key_DOWN) && Option_ID != 3){
       Option_ID+=1
    }else if(keyboard_check_pressed(global.Key_DOWN) && Option_ID == 3){
       Option_ID = 1;
    }
    if(keyboard_check_pressed(global.Key_UP) && Option_ID != 1){
       Option_ID-=1
    }else if(keyboard_check_pressed(global.Key_UP) && Option_ID == 1){
       Option_ID = 3;
    }

 // Choose Options:
    if(keyboard_check_pressed(global.Key_ACTION)){
       if(Option_ID == 1){
          keyboard_key_press(global.Key_ENTER);
       }
       if(Option_ID == 2){
          if(instance_exists(par_fade) == false){
             keyboard_key_press(global.Key_ENTER);
             Restart = true;
          }
       }
       if(Option_ID == 3){
          if(instance_exists(par_fade) == false){
             instance_create(0, 0, obj_fade_end);
          }
       }
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Menu.

 // BG Alpha:
    draw_set_color(c_black);
    draw_set_alpha(_alpha);
    draw_rectangle(view_xview, view_yview, view_xview+view_wview, view_yview+view_hview, false);
    draw_set_alpha(1);
    draw_set_color(c_white);

 // Menu:
    draw_sprite(sprite_index, Option_ID-1, view_xview+floor(_x), view_yview+global.ScreenHeight/2)
