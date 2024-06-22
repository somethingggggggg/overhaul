#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Frame speed, Sound and Character Jump lock.

    image_speed = 1.25;
    alarm[0] = 1;
    PlaySound(SFX.snd_shield_use_insta, global.SFXVolume, 1, 1);
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Disable Jump lock.
    with(Parent){
         JumpLock = false;
    }
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Stick to the Player.

    x = floor(Parent.x);
    y = floor(Parent.y);
    with(Parent){
         InvTimer = 60;
    }
#define Collision_obj_monitor
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy.
    other.DestroyParent = Parent
    with(other){
         instance_destroy();
    }
#define Collision_par_enemy
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy.

    with(other){
         instance_destroy();
    }
#define Collision_par_harmful
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// Bounce:
   var (NewSpeed) =  sqrt(sqr(other.hspeed) + sqr(other.vspeed));
   var (NewAngle) =  point_direction(id.x, id.y, other.x, other.y);
   other.hspeed =  dcos(NewAngle) * NewSpeed;
   other.vspeed = -dsin(NewAngle) * NewSpeed;
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy.

    instance_destroy();
