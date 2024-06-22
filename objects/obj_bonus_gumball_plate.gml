#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.
    image_speed = 0;
    Triggered   = 0;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create Gumball.
    Triggered = false;
    alarm[1]  = 15;
    Gumball = instance_create(x, y, obj_bonus_gumball);
    Gumball.image_index = choose(0, 1, 2, 3, 4, 5, 6,7) //choose(0, 0, 1, 1, 2, 2, 4, 4, 5, 5, 6, 6, 3)
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Finish.
    if(image_index  > 0){
       image_index -= 0.25;
       alarm[1] = 1;
    }else{
       alarm[1] = -1;
    }
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate and trigger.
    if(Triggered = true){
       if(image_index < 2){
          image_index+=0.25;
       }
       if(image_index = 2 && alarm[0] = -1){
          alarm[0] = 15;
       }
    }
