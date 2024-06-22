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
/// This does nothing. But keep it.
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate.
    if(Triggered == true){
       image_speed = 0.25;
    }
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Stop, Update Plate.

 // Set image speed back to zero.
    Triggered   = false;
    alarm[0]    = 35;
    image_speed = 0;

 // Activate Plate:
    with(obj_bonus_gumball_plate){
         Triggered = true;
    }
