#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.
    image_speed = 0;
    image_index = 0;
    BumperState = 0;
    ScoreGiven  = 0;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reset state.
    BumperState = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate and give Score.

    if(BumperState == 0){
       image_index  = 0;
    }else{
       image_index = 1;
       if(alarm[0] = -1){
          alarm[0] = 5;
          PlaySound(SFX.snd_object_bumper, global.SFXVolume, 1, 1);
          // Give Score:
             if(ScoreGiven != 10){
                ScoreGiven+=1
                global.Score += 10;
             }
       }
    }
