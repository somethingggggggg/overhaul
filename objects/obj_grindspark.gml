#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0.5
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x = par_character.x
y = par_character.y
image_angle = par_character.Angle
image_xscale = par_character.AnimationDirection

if par_character.Action != ActionRail{
with self{
instance_destroy()
}
}
