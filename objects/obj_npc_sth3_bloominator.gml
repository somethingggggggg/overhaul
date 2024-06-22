#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.

    image_speed = 0    // Disable GM's default image speed.
    ShootTimer  = 80;  // Counts down the frames required to start the shooting.
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animations.
    if(image_index != 2){
       image_index+=1
       alarm[0] = 6;
    }else{
       image_index = 0;
    }
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Shoot and everything else.

    CharCheck = instance_exists(par_character);
    CharNear  = instance_nearest(x, y, par_character);
    if(CharCheck != false){
       if(distance_to_object(instance_nearest(x, y, CharNear) < 80)){
          if(ShootTimer > 0){
             ShootTimer-=1 ;
          }else{
             ShootTimer  = 80;
             alarm[0]    = 1;
             PlaySound(SFX.snd_object_projectile, global.SFXVolume, 1, 1);
             Spike = instance_create(x, y-10, obj_npc_sth3_bloominator_spike){
                  if(CharNear.x < x) with(Spike) { hspeed = -1;             vspeed = -6; gravity = 0.3}
                  else
                  if(CharNear.x > x) with(Spike) { hspeed =  1;             vspeed = -6; gravity = 0.3}
                  else
                  if(CharNear.x = x) with(Spike) { hspeed = choose(1, -1);  vspeed = -6; gravity = 0.3}
             }
          }
       }
    }
