#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Gravity.
    YSpd = 0;
    YGrv = 0.21875;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Move Gumball Machine.
    if(place_meeting(x, y + YSpd, obj_bonus_gumball_bumper)){
       while not(place_meeting(x, y + sign(YSpd), obj_bonus_gumball_bumper)){
                 y += sign(YSpd)
                 if(instance_exists(obj_bonus_gumball_rod)){
                    obj_bonus_gumball_rod.  y += sign(YSpd)
                 }
                 if(instance_exists(obj_bonus_gumball_plate)){
                    obj_bonus_gumball_plate.y += sign(YSpd)
                 }
       }
       YSpd   = 0;
    }
        if(place_meeting(x, y + YSpd, object276)){
       while not(place_meeting(x, y + sign(YSpd), object276)){
                 y += sign(YSpd)
                 if(instance_exists(obj_bonus_gumball_rod)){
                    obj_bonus_gumball_rod.  y += sign(YSpd)
                 }
                 if(instance_exists(obj_bonus_gumball_plate)){
                    obj_bonus_gumball_plate.y += sign(YSpd)
                 }
       }
       YSpd   = 0;
    }

    y    += YSpd;
    if(instance_exists(obj_bonus_gumball_rod)){
       obj_bonus_gumball_rod.  y += YSpd;
    }
    if(instance_exists(obj_bonus_gumball_plate)){
       obj_bonus_gumball_plate.y += YSpd;
    }
    YSpd += YGrv;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Keep Character in air until the Fade is gone.
    if(instance_exists(par_character)){
       if(instance_exists(obj_title_card_controller)){
          if(obj_title_card_controller.Backdrop_Alpha > 0){
             with(par_character){
                  Allow_XMovement = false;
                  Allow_YMovement = false;
             }
          }else{
             with(par_character){
                  Allow_XMovement = true;
                  Allow_YMovement = true;
             }
          }
       }
    }
