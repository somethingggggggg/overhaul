#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create parts of the Level.

    // Titel Card:
       instance_create(0, 0, obj_title_card_controller);

    // Character specific:
       CharID   = 0;
       alarm[0] = 5;

    // Cheat Input
       CheatCode    = "";
       CheatTime    = 30;
       KonamiCode   = 0;
       KonamiLoaded = noone;
       KonamiSprite = noone;

    // Reset Values:
       if(global.BonusStage = false){
          global.Time         = 0;
          global.GameTime     = 0;
          global.DoTime       = 0;
          global.ObjectTime   = 0;
          global.CharControl  = 0;
          if(global.Ring100Check_Deactivate == false){
             global.Ring100Check = 1;
          }
          FrameRate           = 60;
          obj_audio_manager.DeadFade = false;
       }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Pause screen variables.
    GamePaused = false;
    GamePBG    = noone;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Character specific variables.
    CharID = par_character.CharacterID - 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Gain a life with 100 rings.

    if(global.Ring100Check < 100){

       if(global.Rings >= (global.Ring100Check * 100)) && global.BonusStage = false{

          // Gain a life:
             global.Ring100Check+=1
             global.Lives+=1

          // Play life jingle:
             PlaySound(SFX.snd_character_life, global.MaxSFXV, 1, 1)
       }

       // If we get hit and we no longer have any rings, set the check back to 1:
          if(global.Rings = 0 && global.Ring100Check != 1){
             global.Ring100Check = 1;
          }

    }
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Global Timers.

    if(global.BonusStage == false && GamePaused == false){
       if(global.DoTime > 0){
          if(global.GameTime < 599999){
             global.GameTime   += 1000/60;
          }else{
             global.GameTime = 599999
             if(instance_exists(par_character)){
                with(par_character){
                     Action = ActionDie;
                }
             }
          }
       }
    }

    if(GamePaused == false){
       global.ObjectTime += 1000/60;
    }
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy instances outside the view.

    // We don't need any of this in a Bonus Stage:
    // So only run it when we're in an actual stage.
       if(global.BonusStage == false && GamePaused == false){

    // Deactivate all objects:
       instance_deactivate_all(true);

    // Activate instances:
       instance_activate_object(par_controller);

    // Activate instances inside the view:
       for(i=0; i<8; i+= 1){
           if(view_visible[i] == false){
              break;
           }
              instance_activate_region(view_xview[0] - 64, view_yview[0] - 64, view_wview[0] + 128, view_hview[0] + 128, true)
       }

    // Activate instances in a specific region while the character is moving fast.
       if(instance_exists(par_character)){
          for(i=0; i<instance_number(par_character); i+=1){
              var _Ext, _Pl;
                  _Pl  = instance_find(par_character, i);
                  _Ext = max(abs(_Pl.XSpeed) * 3, abs(_Pl.YSpeed) * 3)
                         instance_activate_region((_Pl.x - view_wview[0] div 2) + min(-_Ext, 0),
                                                  (_Pl.y - view_hview[0] div 2) + min(-_Ext, 0),
                                                  (view_wview[0]) + max(_Ext, 0),
                                                  (view_hview[0]) + max(_Ext, 0),
                                                  true);
          }
       }

    // Special case, when instances HAVE to be loaded:
       instance_activate_object(par_bridge);
       instance_activate_object(par_collision_pushable);
       instance_activate_object(obj_sth3_switch);
       instance_activate_object(par_collision_swing);
       instance_activate_object(par_collision_collapse);
       instance_activate_object(par_collision_collapse_tiles);
       instance_activate_object(par_collision_moving);
       instance_activate_object(obj_tornado)

       }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// (Un)Pause Game.


    if(global.DoTime == true && instance_exists(par_fade) == false && !instance_exists(obj_game_over)){

       // Check if we pressed Pause:
          if(keyboard_check_pressed(global.Key_ENTER)){

             // Pause the Game:
                if(GamePaused == false && GamePBG == noone && instance_exists(obj_pause_menu) == false){
                   GamePaused = true;
                   GamePBG    = background_create_from_screen(0, 0, global.ScreenWidth, global.ScreenHeight, 0 , 0);
                   instance_deactivate_all(1);
                   if(global.BonusStage == false){
                      instance_create(0, 0, obj_pause_menu);
                      instance_activate_object(obj_pause_menu)
                   }
                   instance_activate_object(obj_global_manager)
                   exit;
                }

             // Unpause the Game:
                if(GamePaused == true && keyboard_check_pressed(global.Key_ENTER)){
                   background_delete(GamePBG);
                   GamePaused = false;
                   GamePBG    = noone;
                   instance_activate_all();
                   if(instance_exists(obj_pause_menu)){
                      with(obj_pause_menu){
                           Finished = true;
                      }
                   }
                   exit;
                }

          }

    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Pause frame.
    if (GamePBG != noone){
       draw_background(GamePBG, view_xview, view_yview);
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw the Hud.

    // Exit when the game is paused:
    if(GamePaused == true) exit;

    // Don't draw if in Bonus Stages:
    if(global.BonusStage == false){
       
    // SCORE/TIME/RINGS:
       draw_sprite(spr_main_hud, 0, view_xview[view_current]+floor(16), view_yview[view_current]+floor(9));
       if( ((global.GameTime div 8) mod 2 && global.GameTime > 540000) or global.GameTime < 540000 or global.DoTime = 0){       
       draw_sprite(spr_main_hud, 1, view_xview[view_current]+floor(16), view_yview[view_current]+floor(25));
       }
       if(((global.Rings == 0) && (global.GameTime div 8) mod 2 ) or global.Rings > 0 or instance_exists(obj_scoring_results) || global.DoTime == 0){
          draw_sprite(spr_main_hud, 2, view_xview[view_current]+floor(16), view_yview[view_current]+floor(41));
       }

    // Text for SCORE/TIME/RINGS:
       draw_set_font(global.Font_HUD){
                     draw_set_color(c_white){
                                    draw_set_halign(fa_right);
                                    draw_text(view_xview[view_current]+111, view_yview[view_current]+9, global.Score);                                                          
                                    draw_set_halign(fa_left);
                                    if( ((global.GameTime div 8) mod 2 && global.GameTime > 540000) or global.GameTime < 540000 or global.DoTime = 0){      
                                    draw_text(view_xview[view_current]+55, view_yview[view_current]+25, 
                                              string(floor(global.GameTime/60000))+" "+scr_string_number_format(floor(global.GameTime/1000) mod 60,2));
                                    }          
                                    draw_set_halign(fa_right);
                                    draw_text(view_xview[view_current]+87, view_yview[view_current]+41, global.Rings);
                                    draw_set_halign(-1);
                     }
       } 
           
    // Lives:
       draw_set_font(global.Font_Life){    
                     draw_set_halign(fa_right){
                                     draw_text(view_xview[0]+64, view_yview[0]+view_hview[0]-15, global.Lives);                     
                                     draw_sprite(spr_life_hud, CharID, view_xview[view_current]+floor(16), view_yview[view_current]+floor(200));  
                     }
                     draw_set_halign(-1)  
       }

      }else{ // Draw the Ring counter in Bonus Stages.
          draw_sprite(spr_main_hud, 2, view_xview[view_current]+floor(16), view_yview[view_current]+floor(9)); 
          draw_set_font(global.Font_HUD){
             draw_set_color(c_white){
                draw_set_halign(fa_right);          
                draw_text(view_xview[view_current]+88, view_yview[view_current]+9, global.Rings);    
                draw_set_halign(-1);                
             }
          }
      }
