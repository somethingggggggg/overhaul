#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.
    Frame   =  0;
    XSpeed  =  0;
    YSpeed  = -5;
    Gravity = 0.21875;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate.
    if(Frame < 2){
       Frame+=1
    }else{
       Frame-=1
    }

    alarm[0] = 8;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Add Gravity.

    // Everything:
       if(YSpeed >= 0 && place_meeting(x, y - YSpeed , par_collision_solid)){
          YSpeed  = choose(-3.5, -4.5);
          if(XSpeed = 0){
             randomize();
             image_xscale = choose(1, -1);
             XSpeed       = image_xscale*2;
             alarm[0]     = 1;
          }
          while(place_meeting(x, y + sign(YSpeed), par_collision_solid)){
                y-=1 ;
          }
       }else{
          YSpeed += Gravity;
       }
       x += XSpeed;
       y += YSpeed;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Change direction.
    if(place_meeting(x + XSpeed, y, par_collision_solid)){
       while(!place_meeting(x + sign(XSpeed), y, par_collision_solid)){
             x += sign(XSpeed);
       }
       image_xscale *= -1;
       XSpeed       *= -1;
    }
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy.
    instance_destroy();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw.
    draw_sprite_ext(sprite_index, Frame, x, y, image_xscale, image_yscale, 0, c_white, 1);
