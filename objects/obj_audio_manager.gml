#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Init. Audio Data.
 // This Object handles most Audio related things, make sure to change this for your game!
// Variables (do not edit this if unsure)
    ZoneBGM     =    "";
    SampleRate  = 41100;
    PitchChange =  true;
    PitchValue  =     0;
    RunStep     = false;
    ///Init Player Sounds
    zone_results = false
    ZoneMySfxVolume = global.SFXVolume

 // Effects:
    DeadFade = false;                              // Slowly fades out the music after the character dies.
    BossFade = false;
Audio = false
      fac_alarm_sep = 3;
      instance_create(0,0,obj_audio_drawer)

with obj_audio_drawer{
cur_audio = "Loading Player Sounds.";
}

  // Character Sounds:
    var sound_i;
    sound_i = 0;

    var sound_id;
    sound_id = file_find_first(working_directory+"\audio\SFX\Character\*.wav", 0);

    var sound_id_name;
    sound_id_name = "";

    var sound_count;
    sound_count = 0;

    var sound_temp;
    sound_temp  = "";

    while not(sound_id == "")
    {
              soundTemp     = AudioAdd(working_directory+"\audio\SFX\Character\"+string(sound_id));
              sound_id_name = string_replace_all(sound_id, ".wav", "");
              variable_local_set(sound_id_name, soundTemp);
              sound_id      = file_find_next();
    }

with obj_audio_drawer{
cur_audio = "Loading General Sounds.";
}

    alarm[1] = fac_alarm_sep;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Get Audio Volumes.

    global.MaxBGMV = global.BGMVolume;
    global.MaxSFXV = global.SFXVolume;
    RunStep        = true;
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// General Sounds:


    var sound_i;
    sound_i = 0;

    var sound_id;
    sound_id = file_find_first(working_directory+"\audio\SFX\General\*.wav", 0);

    var sound_id_name;
    sound_id_name = "";

    var sound_count;
    sound_count = 0;

    var sound_temp;
    sound_temp  = "";

    while not(sound_id == "")
    {
              soundTemp     = AudioAdd(working_directory+"\audio\SFX\General\"+string(sound_id));
              sound_id_name = string_replace_all(sound_id, ".wav", "");
              variable_local_set(sound_id_name, soundTemp);
              sound_id      = file_find_next();
    }

 with obj_audio_drawer{
cur_audio = "Loading Shield Sounds.";
}

    alarm[2] = fac_alarm_sep;
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Shields:

    var sound_i;
    sound_i = 0;

    var sound_id;
    sound_id = file_find_first(working_directory+"\audio\SFX\Shield\*.wav", 0);

    var sound_id_name;
    sound_id_name = "";

    var sound_count;
    sound_count = 0;

    var sound_temp;
    sound_temp  = "";

    while not(sound_id == "")
    {
              soundTemp     = AudioAdd(working_directory+"\audio\SFX\Shield\"+string(sound_id));
              sound_id_name = string_replace_all(sound_id, ".wav", "");
              variable_local_set(sound_id_name, soundTemp);
              sound_id      = file_find_next();
    }


    with obj_audio_drawer{
cur_audio = "Loading Jingles.";
}


    alarm[3] = fac_alarm_sep;
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Jingles:


    var sound_i;
    sound_i = 0;

    var sound_id;
    sound_id = file_find_first(working_directory+"\audio\SFX\Jingle\*.ogg", 0);

    var sound_id_name;
    sound_id_name = "";

    var sound_count;
    sound_count = 0;

    var sound_temp;
    sound_temp  = "";

    while not(sound_id == "")
    {
              soundTemp     = AudioAdd(working_directory+"\audio\SFX\Jingle\"+string(sound_id));
              sound_id_name = string_replace_all(sound_id, ".ogg", "");
              variable_local_set(sound_id_name, soundTemp);
              sound_id      = file_find_next();
    }

    with obj_audio_drawer{
cur_audio = "Loading Misc Songs.";
}

    alarm[4] = fac_alarm_sep;
#define Alarm_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Misc Songs:

    var sound_i;
    sound_i = 0;

    var sound_id;
    sound_id = file_find_first(working_directory+"\audio\BGM\Misc Songs\*.ogg", 0);

    var sound_id_name;
    sound_id_name = "";

    var sound_count;
    sound_count = 0;

    var sound_temp;
    sound_temp  = "";

    while not(sound_id == "")
    {
              soundTemp     = AudioAdd(working_directory+"\audio\BGM\Misc Songs\"+string(sound_id));
              sound_id_name = string_replace_all(sound_id, ".ogg", "");
              variable_local_set(sound_id_name, soundTemp);
              sound_id      = file_find_next();
    }


with obj_audio_drawer{
cur_audio = "Loading Zone Themes.";
}

    alarm[5] = fac_alarm_sep;
#define Alarm_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Zone Themes:

    var sound_i;
    sound_i = 0;

    var sound_id;
    sound_id = file_find_first(working_directory+"\audio\BGM\Zone Themes\*.ogg", 0);

    var sound_id_name;
    sound_id_name = "";

    var sound_count;
    sound_count = 0;

    var sound_temp;
    sound_temp  = "";

    while not(sound_id == "")
    {
              soundTemp     = AudioAdd(working_directory+"\audio\BGM\Zone Themes\"+string(sound_id));
              sound_id_name = string_replace_all(sound_id, ".ogg", "");
              variable_local_set(sound_id_name, soundTemp);
              sound_id      = file_find_next();
    }

    alarm[6] = fac_alarm_sep;
#define Alarm_6
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Init Misc Variables
with obj_audio_drawer{
cur_audio = "Audio Loaded!";
}

event_user(0)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Increase/Decrease Volumes.
if Audio = true{
    // Only run if allowed to:
       if(RunStep == true){

    // Lower the BGM to 0% when the Life Jingle is playing.
       if(CheckSound(SFX.snd_character_life) == true or CheckSound(Jingle_Drowning) == true or CheckSound(SFX.snd_object_emerald) == true or CheckSound(SFX.egg_billiejean) == true
       or CheckSound(SFX.bgm_knuckles_fight) == true){
          if(global.BGMVolume != 0){
             global.BGMVolume  = 0;
          }
          if(CheckSound(SFX.snd_character_life) == true){
             if(global.SFXVolume != 0){
                global.SFXVolume  = 0;
             }
          }
       }else{
          if(global.BGMVolume < global.MaxBGMV){
             global.BGMVolume+=1
          }else{
             global.BGMVolume = global.MaxBGMV;
          }
          if(global.SFXVolume != global.MaxSFXV){
             global.SFXVolume  = global.MaxSFXV;
          }
       }

    // Fade out/in Background Music:
       if(global.BGMVolume = 0){
          caster_set_volume(ZoneBGM, global.BGMVolume);
          caster_set_volume(Invincibility_Normal, global.BGMVolume);
          caster_set_volume(Invincibility_Transform, global.BGMVolume);
       }else{
          caster_set_volume(ZoneBGM, global.BGMVolume);
          caster_set_volume(Invincibility_Normal, global.BGMVolume)
          caster_set_volume(Invincibility_Transform, global.BGMVolume);
       }


    // Fade out when the character is dead:
       if(DeadFade == 1){
       if global.BonusStage = false{
          caster_set_volume(ZoneBGM, 0);
          caster_set_volume(Invincibility_Normal, 0)
          caster_set_volume(Invincibility_Transform, 0);
          caster_set_volume(bgm_knuckles_fight, 0);
       }
}

       }
       }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Invincibility Themes.
if Audio = true{
    // Only run if allowed to:
       if(RunStep == true){

    // Check if the Character is invincible:
       CharacterCheck = (par_character)

       if(instance_exists(CharacterCheck)){

          if(CharacterCheck.CharacterState = CharacterNormal && CharacterCheck.Invincibility = 1.5){
             if(Invincibility_Normal != noone){
                if(CheckSound(SFX.bgm_invincibility) == false){
                      StopSound(ZoneBGM);
                   LoopSound(SFX.bgm_invincibility, global.BGMVolume, 1);
                   }

                }

          }else{
                if(CheckSound(SFX.bgm_invincibility) == true){
                   StopSound(SFX.bgm_invincibility);
                      LoopSound(ZoneBGM, global.BGMVolume, 1);
                   }
                }
          }



    // Check if the Character transformed into it's Super or Hyper Form:
       
       CharacterCheck = (par_character)
       
       if(instance_exists(CharacterCheck)){
         
             if(CharacterCheck.CharacterState = CharacterSuper or CharacterCheck.CharacterState = CharacterHyper){
                if(Invincibility_Transform != noone){
                   if(Invincibility_Normal != noone){
                      if(CheckSound(SFX.bgm_invincibility) == true){
                         StopSound(SFX.bgm_invincibility);
                      }
                   }
                   if(CheckSound(SFX.bgm_super_sonic) == false){
                         StopSound(ZoneBGM)
                      LoopSound(SFX.bgm_super_sonic, global.BGMVolume, 1);
                   }
                }
             }else{
                   if(CheckSound(SFX.bgm_super_sonic) == true){
                      StopSound(SFX.bgm_super_sonic)
                         LoopSound(ZoneBGM, global.BGMVolume, 1);
                   }               
             }

                    
       }
       
       }       
       }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Increase Speed/Pitch for Speedshoes.
if Audio = true{
    // Only run if allowed to:
    if(RunStep == true && PitchChange == true){

       CharacterCheck = (par_character)
       if(instance_exists(CharacterCheck)){
          if(CharacterCheck.HasSpeedShoes == true && CharacterCheck.SpeedShoeTimer > 0){
             if(PitchValue!=.2){
                PitchValue+=.01
             }
             if(caster_get_pitch(ZoneBGM) != 1.2){
                caster_set_pitch(ZoneBGM, 1+PitchValue);
             }
          }else{
             if(global.GameTime < 540000 && CharacterCheck.HasSpeedShoes == false){
                if(PitchValue!=0){
                   PitchValue-=.01
                }
                if(caster_get_pitch(ZoneBGM) != 1){
                   caster_set_pitch(ZoneBGM, 1+PitchValue);
                }
             }
          }
       }

    }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Increase the pitch of music when we're about to time over (Custom, not in the original games)
if Audio = true{
    // Only run if allowed to:    
       if(RunStep == true && PitchChange == true){

       // Change the Patch once we reach 9 minutes on the timer.    
          if(global.GameTime >= 540000){
             if(PitchValue!=.2){
                PitchValue+=.01
             }
             if(caster_get_pitch(ZoneBGM) != 1.2){
                caster_set_pitch(ZoneBGM, 1+PitchValue);    
             }
          }

       }       
       }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Stop Music.
     if Audio = true{
 // Stop when the tally results appear:
    if(instance_exists(obj_scoring_results) == true) && zone_results == false{
       StopSound(ZoneBGM);
       PlaySound(SFX.snd_scoring_theme, global.BGMVolume, 1, 1);
       zone_results = true
    }

 // Stop when game over;
    if(instance_exists(obj_game_over) == true){
       StopSound(ZoneBGM);
       StopSound(Jingle_Drowning);
    }

 // Stop when the drowning theme appear:
    if(CheckSound(Jingle_Drowning) == true){
       StopSound(ZoneBGM);
    }


    }
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Play the proper Zone Theme.
    // Test Zone:
       ZoneSetTheme(rm_flicky_init, Options, 0, -1, -1);
       ZoneSetTheme(rm_test_zone, Test_Theme, 0, -1, -1);
       ZoneSetTheme(rm_test_zone_2, Test_Theme_2, 0, -1, -1);
    // Bonus Stages:
    // Gumball:
       ZoneSetTheme(rm_bonus_gumball, Gumball_Theme, 0, -1, -1);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Start Credits Theme.
 if room = rm_flicky_credits{
    ZoneSetTheme(rm_flicky_credits, Credits_Theme, 0, -1, -1)
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reset.

    DeadFade = false;
    global.BGMVolume = global.MaxBGMV;
    global.SFXVolume = global.MaxSFXV;
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Stop all sounds.

    caster_stop(all);
    DeadFade = false;
    BossFade = false;
    zone_results = false
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Init Songs and Volume

    //Volumes:
    alarm[0]    =     5;

    // Zone Music:
    Test_Theme   = (SFX.bgm_test_zone);
    Test_Theme_2 = (SFX.bgm_test_zone_2);
    Options = (SFX.music_options);

 // Bonus Stages:
    Gumball_Theme = (SFX.bgm_bonus_gumball);

 // Invincibility Themes:
    Invincibility_Normal    = (SFX.bgm_invincibility); // Default Invincibility Music.
    Invincibility_Transform =   (SFX.bgm_super_sonic); // Theme that plays when in Super form.

 // Jingles:
    Jingle_ActClear = (SFX.snd_scoring_theme);         // Theme that plays after you cleared a act.
    Jingle_Drowning = (SFX.bgm_drowning);              // Theme that plays when you're about to drown.
    Jingle_GameOver = (SFX.bgm_game_over);             // Theme that play when we game over.
    
 // Credits:
    Credits_Theme = (SFX.bgm_credits); 
    
                              // Slowly fades out the music when a boss is active.
