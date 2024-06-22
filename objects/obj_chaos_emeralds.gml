#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.

    image_speed = 0;
    image_index = 0;
    alarm[0]    = 5;
    Collected   = false;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update frame.
    image_index = EmeraldID-1;
#define Collision_par_character
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Collect Chaos emerald.

    if(other.Action != ActionDie){
       if(Collected = false){
          Collected = true;
          global.Emeralds+=1;
          PlaySound(SFX.snd_object_emerald, global.SFXVolume, 1, 1);
          instance_destroy();
       }
    }
