///LoopSound(audio id, audio volume, audio pitch);
// Script to play and loop a sound.

   // Exit if we already play the audio:
      if(caster_is_playing(argument0) == true){
         StopSound(argument0);
      }

   // Play the audio:
      global.BGMID = caster_loop(argument0, argument1, argument2);

   // Set the Volume:
      caster_set_volume(argument0, argument1);

   // Modify the pitch:
      if(argument2 != -1){
         if(argument2 < 0) { argument2 = 0 }
         caster_set_pitch(argument0, argument2);
      }
