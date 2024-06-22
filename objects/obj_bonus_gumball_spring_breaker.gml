#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Add Gravity to Springs.
    if(instance_exists(par_spring)){
       with(par_spring){
            gravity = 0.21875;
       }
    }
    instance_destroy()
#define Collision_par_character
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy and Break tiles.
    if(instance_exists(par_collision_collapse) && alarm[0] = -1){
       with(par_collision_collapse){
            alarm[0] = 45;
       }
    }
    alarm[0] = 60;
