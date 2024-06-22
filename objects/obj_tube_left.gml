#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hit = 0;
sound_trigger = true;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hit = 0;
sound_trigger = true;
#define Collision_par_character
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/* Move Player */
if (other.y != self.y) then other.y = y+1;

/* Change the Action of the Player */
with (other)
{
Action = ActionTube;
Animation = "ROLL";
tube_type = 3;
AnimationDirection = 1;
tube_mov_x = -8;
tube_mov_y = 0;
}

/* Check if Hit:*/
if(hit = 0) {hit = 1};

if (hit = 1)
{
 if(sound_trigger = true)
  {
   sound_trigger = false;
PlaySound(SFX.snd_character_roll, global.SFXVolume, 1, 1);
  };
alarm[0] = 50;
}
