///scr_character_action_tubes();
if (Action = ActionDie){exit}
if(Action = ActionTube)
{
 /* Increase Timer and Set Ground to false: */
 tube_timer += 0.1;
 Ground  = false;
 JumpLock = true; /* Use this variable to lock the Jumping */

/* Check the Tube type and then move!*/
if ( (tube_type == 1) || (tube_type == 3) )
      {
     XSpeed = tube_mov_x;
     YSpeed = tube_mov_y;
      };
     };
     else
     tube_timer = 0;

     /* Play Rolling Sound: */
     if ( tube_timer = 0.2 )
     {
     if ((tube_type == 1) || (tube_type == 2))
        {
        PlaySound(SFX.snd_character_roll, global.SFXVolume, 1, 1);
        };
     };
     if (tube_timer > 0.5){
     tube_timer = 0.5

};
