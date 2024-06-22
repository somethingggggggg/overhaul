#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hit = 0;
#define Collision_par_character
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/* Change the Action of the Player */
with (other)
{
JumpLock = false
tube_type = 0;
tube_mov_x = 0;
tube_mov_y = 0;
 /* Change Action if the action is still the Tube Action*/
 if(Action = ActionTube)
  {
   Action = ActionRolling;
   Animation = "ROLL";
  };
}

/* Check if Hit:*/
if(hit = 0)
{
hit = 1;
};
if (hit = 1)
{
StopSound(SFX.snd_character_spindash_release);
PlaySound(SFX.snd_character_spindash_release, global.SFXVolume, 1, 1);
hit = -1;
alarm[0] = 50;
}
