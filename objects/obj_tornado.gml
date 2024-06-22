#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if par_character.CharacterID != CharacterSonic{
sprite_index = spr_tornado_sonic
}
image_speed = 0.175
globalvar control;
control = false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if control = true{
x = floor(par_character.x);
}
if !place_meeting(x,y,par_character){
control = false
}
#define Collision_par_character
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
control = true
#define Collision_obj_player_jump
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hspeed = 13
#define KeyPress_38
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if control = true{
if y != 12
{
    vspeed = -2;
}
}
#define KeyPress_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if control = true{
if y != room_height - 60
{
    vspeed = 2;
}
else
{
    vspeed = -0.1;
}
}
#define KeyRelease_38
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if control = true{
vspeed = 0
}
#define KeyRelease_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if control = true{
vspeed = 0
}
