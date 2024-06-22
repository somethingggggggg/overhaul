///PlaySound(audio id, audio volume, audio pitch, stop duplicate);
// Script to play a sound.

   // If we don't want that the same audio is played twice, stop all instances of this audio:
      if(argument3 == true){
         StopSound(argument0);
      }
      
   // Play the audio:
      caster_play(argument0, argument1, argument2);
      
   // Set the Volume:
      caster_set_volume(argument0, argument1);
           
   // Modify the pitch:
      if(argument2 != -1){
         if(argument2 < 0) { argument2 = 0 }
         caster_set_pitch(argument0, argument2);
      }
