#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.

 // Bonuses:
    BonusRings = (global.Rings * 100);
    BonusTotal = (global.Score);

    Seconds = floor(global.GameTime/1000);

    if(Seconds <= 29){
        BonusTime   = 50000;
    }
    else if(Seconds > 29 && Seconds <= 44){
        BonusTime   = 10000;
    }
    else if(Seconds >= 45 && Seconds <= 59){
        BonusTime   = 5000;
        }
    else if(Seconds >= 60 && Seconds <= 89){
        BonusTime   = 4000;
        }
    else if(Seconds >= 90 && Seconds <= 119){
        BonusTime   = 3000;
        }
    else if(Seconds >= 120 && Seconds <= 179){
        BonusTime   = 2000;
        }
    else if(Seconds >= 180 && Seconds <= 239){
        BonusTime   = 1000;
        }
    else if(Seconds >= 240 && Seconds <= 299){
        BonusTime   = 500;
        }
    else if(Seconds >= 300){
        BonusTime   = 0;
        }

    ////

 // Reset Variables.
    global.CheckpointX = -1;
    global.CheckpointY = -1;

 // Allow counting:
    CanDo      = 0;
    CanCount   = 0;
    CountSound = 1;

 // Skip:
    CanSkip = 0;

 // Positions / Going out:
    GoingOut      =    0;
    GoOff         =  320;
    GoOff_2       = -320;

 // Text Positions:
    ResultGFX_Position[0] = -320;
    ResultGFX_Position[1] =  320;
    ResultGFX_Position[2] =  350;
    ResultGFX_Position[3] =  380;
    ResultGFX_Position[4] =  410;
    ResultGFX_Position_Completed = false;

 // Disappear (For Act 2)
    Act2Disappear = false;

 // Misc.
    SpecialFlag = 0;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Ring Bonus.

    if(BonusRings > 0){
       BonusRings   -= 10;
       BonusTotal   += 10;
       global.Score += 10;
       alarm[0]      =  1;
    }
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Time Bonus.

    if(BonusTime > 0){
       BonusTime    -= 10;
       BonusTotal   += 10;
       global.Score += 10;
       alarm[1]      =  1;
    }else{
       BonusTime = 0;
       alarm[1]  = -1;
    }
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Counting sounds.

    if(CountSound = 1){
       CanSkip  = 1;
       PlaySound(SFX.snd_scoring_points, global.SFXVolume, 1, 0)
       alarm[2] = 5;
    }
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Stop Counting.

    CanCount = 0
#define Alarm_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Going out.

    if(GoingOut = 0){
       if(GoOff > 0){
          GoOff -= 20;
          alarm[4] = 1;
       }else{
          alarm[5] = 1;
       }
    }else{
     alarm[5] = 1;
    }
#define Alarm_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// End it.

    if(GoingOut = 0){
       if(GoOff_2 < 0){
          GoOff_2 += 20;
          alarm[5] = 1;
       }
    }else{
       if(SpecialFlag == false){
          if(instance_exists(obj_fade_next) == false){
             instance_create(x, y, obj_fade_next);
          }
       }else{
          if(instance_exists(par_character)){
             with(par_character){
                  GoalState   = 2;
                  LockControl = 0;
             }
             global.GameTime = 0;
             global.DoTime   = 1;
          }
          Act2Disappear = true;
          global.ZoneAct+=1
          TCard = instance_create(0, 0, obj_title_card_controller)
          TCard.SpecialFlag        = true;
       }
    }
#define Alarm_6
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy.
    obj_camera.Cam_RightLimit = room_width;
    instance_destroy();
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Text Positions.

    if(GoingOut == 0){
       if(ResultGFX_Position[0] < 0){
          ResultGFX_Position[0] += 10;
       }else{
          ResultGFX_Position[0] = 0;
       }
       if(ResultGFX_Position[1] > 0){
          ResultGFX_Position[1] -= 10;
       }else{
          ResultGFX_Position[1] = 0;
       }
       if(ResultGFX_Position[2] > 0){
          ResultGFX_Position[2] -= 10;
       }else{
          ResultGFX_Position[2] = 0;
       }
       if(ResultGFX_Position[3] > 0){
          ResultGFX_Position[3] -= 10;
       }else{
          ResultGFX_Position[3] = 0;
       }
       if(ResultGFX_Position[4] > 0){
          ResultGFX_Position[4] -= 10;
       }else{
          ResultGFX_Position[4] = 0;
       }
       if(ResultGFX_Position[0] == 0 && ResultGFX_Position[1] == 0 && ResultGFX_Position[2] == 0 &&
          ResultGFX_Position[4] == 0 && ResultGFX_Position_Completed == false){
          ResultGFX_Position_Completed = true;
          // Trigger Bonuses.
             alarm[0] = 280;
             if(BonusTime > 0){
                alarm[1] = 280;
             }
             alarm[2] = 280;
             alarm[3] = 280;
             alarm[4] = 30;
       }
    }else{
       if(SpecialFlag != 0 && CanDo == 2){

       if(ResultGFX_Position[0] > -320){
          ResultGFX_Position[0] -= 10;
       }else{
          ResultGFX_Position[0] = -320;
       }
       if(ResultGFX_Position[1] < 320){
          ResultGFX_Position[1] += 10;
       }else{
          ResultGFX_Position[1] = 320;
       }
       if(ResultGFX_Position[2] < 320){
          if(ResultGFX_Position[0] > -290){
             ResultGFX_Position[2] += 10;
          }
       }else{
          ResultGFX_Position[2] = 320;
       }
       if(ResultGFX_Position[3] < 320){
          if(ResultGFX_Position[2] > 30){
             ResultGFX_Position[3] += 10;
          }
       }else{
          ResultGFX_Position[3] = 320;
       }
       if(ResultGFX_Position[4] < 320){
          if(ResultGFX_Position[3] > 30){
             ResultGFX_Position[4] += 10;
          }
       }else{
          ResultGFX_Position[4] = 320;
       }

       }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Finish counting bonuses.

    if(CanCount == 0){
       if(BonusRings == 0 && BonusTime == 0){
          if(CanDo == 0){
             CountSound = 0;
             PlaySound(SFX.snd_scoring_result, global.SFXVolume, 1, 1)
             global.Rings = 0;
             CanDo = 1;
          }
          if(CanDo = 1 && CheckSound(SFX.snd_scoring_result) == false){
             CanDo = 2;
          }
          if(GoingOut = 0 && CanDo == 2){
             if(CheckSound(obj_audio_manager.Jingle_ActClear) == false){
                GoingOut = 1
                if(SpecialFlag == 0){
                   alarm[4] = 100;
                }else{
                   alarm[4] = 30;
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
///Skip counting.
   if(keyboard_check(global.Key_ACTION) && CanSkip == 1){
      BonusTotal  += BonusTime + BonusRings;
      BonusTime    =  0;
      BonusRings   =  0;
      alarm[0]     = -1;
      alarm[1]     = -1;
      alarm[3]     =  1;
      CanSkip      =  0;
      global.Score = BonusTotal;
   }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Disappear for Act 2.

    if(Act2Disappear = true){

       if(GoOff > -320){
          GoOff -= 20
       }

       if(GoOff_2 < 320){
          GoOff_2 += 20
       }

       if(alarm[6] == -1){
          alarm[6] = 120;
       }

    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Results.

 // "Character" Got:
    draw_sprite(spr_results_name, par_character.CharacterID-1, view_xview+42+ResultGFX_Position[0], view_yview+56);

 // Through:
    draw_sprite(spr_results_through, 0, view_xview+99+ResultGFX_Position[1], view_yview+76);

 // Act Letter:
    draw_sprite(spr_title_card_acts, global.ZoneAct-1, view_xview+223+ResultGFX_Position[1], view_yview+59);

 // Time Bonus:
    draw_sprite(spr_results_time, 0, view_xview+64+ResultGFX_Position[2], view_yview+108);

 // Ring Bonus:
    draw_sprite(spr_results_rings, 0, view_xview+64+ResultGFX_Position[3], view_yview+124);

 // Total:
    draw_sprite(spr_results_total, 0, view_xview+84+ResultGFX_Position[4], view_yview+151);

 // Draw Bonuses:
    draw_set_font(global.Font_HUD)
    draw_set_color(c_white)
    draw_set_halign(fa_right)

    scr_draw_number_zero(view_xview+247+8+ResultGFX_Position[2], view_yview+113,''+ string(BonusTime),  0);
    scr_draw_number_zero(view_xview+247+8+ResultGFX_Position[3], view_yview+129,''+ string(BonusRings), 0);
    scr_draw_number_zero(view_xview+247+8+ResultGFX_Position[4], view_yview+157,    string(BonusTotal), 0);

    draw_set_halign(-1)

/*
 // Got through:
    draw_sprite(sprite_index, 0, view_xview+160+GoOff, view_yview+65);

 // Draw the Tally:
    draw_sprite(spr_results_tally, 0, view_xview+55+GoOff, view_yview+140);

 // Act Letter:
    draw_sprite(spr_title_card_acts, global.ZoneAct-1, view_xview+230+GoOff, view_yview+68);

 // Draw Bonuses:
    draw_set_font(global.Font_HUD)
    draw_set_color(c_white)
    draw_set_halign(fa_left)

    scr_draw_number_zero(view_xview+230+GoOff_2, view_yview+188,''+ string(BonusTotal), 0);
    scr_draw_number_zero(view_xview+230+GoOff_2, view_yview+147,''+ string(BonusTime),  0);
    scr_draw_number_zero(view_xview+230+GoOff_2, view_yview+162,    string(BonusRings), 0);

    draw_set_halign(-1)
