#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Init.
    Active      = true;
    image_speed = 0.2;
#define Collision_par_character
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Set speed of the character.
    if(Active = true){
       if(other.LockTimer <= 10 && other.Ground == true){
          Active = false;
          PlaySound(SFX.snd_object_spring, global.SFXVolume, 1, 1);
          if(other.XSpeed < abs(16)){
             other.XSpeed = image_xscale*16;
          }
          other.InputLock_S        = 1;
          other.LockTimer          = 16;
          other.AnimationDirection = image_xscale*1;
       }
       Active = true;
    }
