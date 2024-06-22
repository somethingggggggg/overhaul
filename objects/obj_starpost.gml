#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.
    image_speed = 0;
    PostFrame = 0;
    Activated = false;
    Finished  = false;
    BulbLoop  = 2;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Done.
    Finished     = true;
    sprite_index = spr_starpost_activated
    image_speed  = 1/4;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation + Position.

// Animation.
if(Activated && !Finished){
   if(BulbLoop > 0){
      PostFrame += 2;
   }else{
      image_index = 0;
      image_speed = 0;
      alarm[0]    = 1;
   }
   if(PostFrame >= image_number-1){
      BulbLoop-=1
      PostFrame = 0
   }
}
#define Collision_par_character
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Activate.
    if(Activated = false && Finished = false){

       if(global.CheckpointX != x && global.CheckpointY != y){
          Activated = true;
          PlaySound(SFX.snd_object_checkpoint, global.SFXVolume, 1, 1)
          global.CheckpointX = x;
          global.CheckpointY = y-5;
          global.CheckpointT = global.GameTime;

          // Bonus Stage:
             if(global.Rings >= 25){
                instance_create(x, y-75, obj_bonus_spark)
             }

       }else{
          Finished        = true;
          sprite_index    = spr_starpost_activated
          image_speed     = 1/4;
          global.GameTime = global.CheckpointT;
       }

    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Starpost.
    if(sprite_index = spr_starpost){
       draw_sprite(sprite_index, floor(PostFrame), x, y)
    }else{
       draw_sprite(sprite_index, -1, x, y)
    }
