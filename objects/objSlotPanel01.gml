#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_single = choose(1,2,3,4,5,6);
CanCycle = true;
ActionTimer = 0;
Panel = -1;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_single = choose(1,2,3,4,5,6);
Cycle = false;
CanCycle = true;
ActionTimer = 0;
Panel = -1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (Cycle == true){
ActionTimer += 1;
image_speed = 1/4;
}

if (ActionTimer == 1)
{
PlaySound(SFX.snd_object_lucky,global.SFXVolume,1,1);
}

if (ActionTimer == 50)
{
alarm[0] = 50;
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Flashlight Mode.
if instance_exists(obj_flashlight){
size = 128;
draw_set_blend_mode(bm_subtract)
surface_set_target(light);
draw_ellipse_color(x-size/2-view_xview,y-size/2-view_yview,x+size/2-view_xview,y+size/2-view_yview,c_white,c_black,false)
surface_reset_target()
draw_set_blend_mode(bm_normal)
}
