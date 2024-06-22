#define Collision_par_character
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with other{
AnimationDirection = 1
PlaySound(SFX.snd_character_jump_ramp, global.SFXVolume, 1, 1);
XSpeed = 8
YSpeed = -(dsin(RelativeAngle) * GSpeed) - (dcos(RelativeAngle) * -6);
YSpeed = -6
Animation = "SPRING"
}
