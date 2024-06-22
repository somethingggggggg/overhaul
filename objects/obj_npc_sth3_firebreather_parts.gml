#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.
    image_speed = 0;
    alarm[0]    = 5;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement.

    if(image_index == 0){
       hspeed = Direction*2;
       vspeed = -2;
    }
    if(image_index == 1){
       hspeed = -Direction*2;
       vspeed = -2;
    }
    if(image_index == 2){
       hspeed = Direction*2;
    }
    if(image_index == 3){
       hspeed = -Direction*2;
    }

    gravity = 0.241;
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy.

    instance_destroy();
