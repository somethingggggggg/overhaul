#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.
    image_speed = .2;
    Speed       =  2;
    alarm[0]    = 21;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy.
    instance_destroy();
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update X/Y Position:
   x += lengthdir_x(Speed, Direction);
   y += lengthdir_y(Speed, Direction);
