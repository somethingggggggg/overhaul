#define Collision_par_character
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with other{
if (XSpeed >= 4 )
{
YSpeed = -6
if CharacterID = CharacterSonic{
Animation = "ROTATION_1"
}
if CharacterID != CharacterSonic{
Animation = "ROLL"
}
}
}
