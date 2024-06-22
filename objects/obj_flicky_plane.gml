#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.
    x           = 0-sprite_width/2;
    image_speed = 0.25;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Move.
    if(x < room_width+sprite_width/2 && image_xscale != -0.5){
       x+= 0.64;
    }else{
       image_xscale = -0.5;
       image_yscale =  0.5;
       y = 120
       x-= 0.32;
    }
#define KeyPress_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !instance_exists(obj_fade_next){
instance_create(x,y,obj_fade_next)
}
