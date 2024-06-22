#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.

    SetupProcess    = 1; // Checks the process step.
    SetupMDirection = 1; // Menu Direction (1 = Left/Right, 2 = Up/Down)
    SetupMID        = 1; // Menu Option ID.
    SetupMID_Max    = 2; // How many Menu options we have.
    SetupCanEnter   = 0; // Checks if we can enter/choose a selection.
    SetupKeyboard   = 0; // Checks if we're setting up our keyboard.
    SetupGamepad    = 0; // Checks if we're setting up our gamepad.
    SetupKeyID      = 0;
    SetupGPadID     = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Change Menu Option.

    if(!SetupKeyboard && !SetupGamepad){

    if(SetupMDirection == 1){
       if(keyboard_check_pressed(global.Key_LEFT)){
          if(SetupMID != 1){
             SetupMID -=1
          }else{
             SetupMID = SetupMID_Max
          }
          PlaySound(SFX.snd_object_switch, global.MaxSFXV, 1,1)
       }
       if(keyboard_check_pressed(global.Key_RIGHT)){
          if(SetupMID != SetupMID_Max){
             SetupMID +=1
          }else{
             SetupMID = 1
          }
          PlaySound(SFX.snd_object_switch, global.MaxSFXV, 1,1)
       }
    }

    if(SetupMDirection == 2){
       if(keyboard_check_pressed(global.Key_UP)){
          if(SetupMID != 1){
             SetupMID -=1
          }else{
             SetupMID = SetupMID_Max
          }
          PlaySound(SFX.snd_object_switch, global.MaxSFXV, 1,1)
       }
       if(keyboard_check_pressed(global.Key_DOWN)){
          if(SetupMID != SetupMID_Max){
             SetupMID +=1
          }else{
             SetupMID = 1
          }
          PlaySound(SFX.snd_object_switch, global.MaxSFXV, 1,1)
       }
    }

    }

    // Sounds in the input menu:
    if(SetupKeyboard){
       if(keyboard_check_pressed(vk_anykey)){
          PlaySound(SFX.snd_object_switch, global.MaxSFXV, 1,1)
       }
    }
    if(SetupGamepad){
       if(gamepad_get_button_pressed(global.Controller_Input_Found)){
          PlaySound(SFX.snd_object_switch, global.MaxSFXV, 1,1)
       }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Proceed to next step.

    // Make sure we can select something:
       if(SetupCanEnter != 1){
          SetupCanEnter += 0.25;
       }

    if(SetupProcess == 1){
       if(keyboard_check_pressed(global.Key_ENTER) && SetupCanEnter){
          switch(SetupMID){
                 case 1:{
                 SetupProcess    = 2;
                 SetupMDirection = 2;
                 SetupMID_Max    = 3;
                 SetupMID        = 1;
                 SetupCanEnter   = 0;
                 break;
                 }
                 case 2:{
                 SetupProcess    = 4;
                 SetupMDirection = 2;
                 SetupMID_Max    = 4;
                 SetupMID        = 1;
                 SetupCanEnter   = 0;
                 break;
                 }
          }
       }
    }

    if(SetupProcess == 2){
       if(keyboard_check_pressed(global.Key_ENTER) && SetupCanEnter){
          switch(SetupMID){
                 case 1:{
                 if(SetupKeyboard != 1){
                    SetupCanEnter  = 0;
                    SetupKeyboard  = 1;
                 }
                 break;
                 }

                 case 3:{
                 SetupProcess    = 3;
                 SetupMDirection = 2;
                 SetupMID_Max    = 3;
                 SetupMID        = 1;
                 SetupCanEnter   = 0;
                 break;
                 }
          }
       }
    }

    if(SetupProcess == 3 && SetupCanEnter){
       if(SetupMID == 1 && keyboard_check(global.Key_LEFT)){
          if(global.MaxBGMV > 0.00){
             global.MaxBGMV -= 0.01;
             global.BGMVolume = global.MaxBGMV;
          }
       }
       if(SetupMID == 1 && keyboard_check(global.Key_RIGHT)){
          if(global.MaxBGMV < 1.0){
             global.MaxBGMV += 0.01;
             global.BGMVolume = global.MaxBGMV;
          }
       }
       if(SetupMID == 2 && keyboard_check(global.Key_LEFT)){
          if(global.MaxSFXV > 0.00){
             global.MaxSFXV -= 0.01;
             global.SFXVolume = global.MaxSFXV;
          }
       }
       if(SetupMID == 2 && keyboard_check(global.Key_RIGHT)){
          if(global.MaxSFXV < 1.0){
             global.MaxSFXV += 0.01;
             global.SFXVolume = global.MaxSFXV;
          }
       }
       if(global.MaxBGMV < 0.01){
          global.MaxBGMV = 0.00;
          global.BGMVolume = global.MaxBGMV;
       }
       if(global.MaxBGMV > 1.0){
          global.MaxBGMV = 1.0;
          global.BGMVolume = global.MaxBGMV;
       }
       if(global.MaxSFXV < 0.01){
          global.MaxSFXV = 0.00;
          global.SFXVolume = global.MaxSFXV;
       }
       if(global.MaxSFXV > 1.0){
          global.MaxSFXV = 1.0;
          global.SFXVolume = global.MaxSFXV;
       }
       if(SetupMID == 3 && keyboard_check(global.Key_ENTER)){
          Flicky_SaveConfiguration()
          SetupProcess    = 4;
          SetupMDirection = 2;
          SetupMID_Max    = 4;
          SetupMID        = 1;
          SetupCanEnter   = 0;
       }
    }

    if(SetupProcess == 4){
       if(keyboard_check_pressed(global.Key_ENTER) && SetupCanEnter){
          switch(SetupMID){
                 case 1:{
                 global.Character_1 = CharacterSonic;
                 room_goto(9);
                 break;
                 }
                 case 2:{
                 global.Character_1 = CharacterTails;
                 room_goto_next();
                 break;
                 }
                 case 3:{
                 global.Character_1 = CharacterKnuckles;
                 room_goto_next();
                 break;
                 }
                 case 4:{
                 global.Character_1 = CharacterAmy;
                 room_goto_next();
                 break;
                 }
          }
       }
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw each setup & setup input.

    // Welcome Setup:
       if(SetupProcess == 1){
          draw_set_color(c_white)
          draw_set_halign(fa_center)
          draw_set_font(global.Font_Letters)

          // Ask for Setupe:
          draw_text(320/2, 32, "DO YOU WANT TO SET UP THE ENGINE?")

          // Menu Options:
          if(SetupMID == 1){
             draw_set_color(c_yellow)
          }else{
             draw_set_color(c_white)
          }  draw_text(320/2-64, 224/2, "YES")

          if(SetupMID == 2){
             draw_set_color(c_yellow)
          }else{
             draw_set_color(c_white)
          }  draw_text(320/2+64, 224/2, "NO")

          draw_set_color(c_white)
          draw_set_halign(-1)
       }

    // Keyboard/Resolution Setup:
       if(SetupProcess == 2){
          draw_set_color(c_white)
          draw_set_halign(fa_center)
          draw_set_font(global.Font_Letters)

          if(!SetupKeyboard){
             // Ask for Input settings:
             draw_text(320/2, 32, "CHANGE YOUR#KEYBOARD AND RESOLUTION SETTINGS!")

             // Menu Options:
             if(SetupMID == 1){
                draw_set_color(c_yellow)
             }else{
                draw_set_color(c_white)
             }  draw_text(320/2, 224/2, "KEYBOARD")

             if(SetupMID == 2){
                draw_set_color(c_yellow)
             }else{
                draw_set_color(c_white)
             }  draw_text(320/2, 224/2+32, "RESOLUTION")

            if(SetupMID == 3){
                draw_set_color(c_yellow)
             }else{
                draw_set_color(c_white)
             }  draw_text(320/2, 224/2 + 64, "CONTINUE")

             draw_set_color(c_white)
             draw_set_halign(-1)
          }

          // Keyboard:
          if(SetupKeyboard){

             switch(SetupKeyID){
                    case 0:{
                    draw_text(320/2, 32, "CHANGE YOUR#KEYBOARD AND RESOLUTION SETTINGS!")
                    draw_text(320/2, 224/2, "PRESS ANY KEY#FOR ( UP )")

                    if(keyboard_check_pressed(vk_anykey) && SetupCanEnter == 1){
                       global.Key_UP = keyboard_key;
                       SetupCanEnter = 0;
                       SetupKeyID+=1
                    }

                    break;
                    }

                    case 1:{
                    draw_text(320/2, 32, "CHANGE YOUR#KEYBOARD AND RESOLUTION SETTINGS!")
                    draw_text(320/2, 224/2, "PRESS ANY KEY#FOR ( DOWN )")

                    if(keyboard_check_pressed(vk_anykey) && SetupCanEnter == 1){
                       global.Key_DOWN = keyboard_key;
                       SetupCanEnter = 0;
                       SetupKeyID+=1
                    }

                    break;
                    }

                    case 2:{
                    draw_text(320/2, 32, "CHANGE YOUR#KEYBOARD AND RESOLUTION SETTINGS!")
                    draw_text(320/2, 224/2, "PRESS ANY KEY#FOR ( LEFT )")

                    if(keyboard_check_pressed(vk_anykey) && SetupCanEnter == 1){
                       global.Key_LEFT = keyboard_key;
                       SetupCanEnter = 0;
                       SetupKeyID+=1
                    }

                    break;
                    }

                    case 3:{
                    draw_text(320/2, 32, "CHANGE YOUR#KEYBOARD AND RESOLUTION SETTINGS!")
                    draw_text(320/2, 224/2, "PRESS ANY KEY#FOR ( RIGHT )")

                    if(keyboard_check_pressed(vk_anykey) && SetupCanEnter == 1){
                       global.Key_RIGHT = keyboard_key;
                       SetupCanEnter = 0;
                       SetupKeyID+=1
                    }

                    break;
                    }

                    case 4:{
                    draw_text(320/2, 32, "CHANGE YOUR#KEYBOARD AND RESOLUTION SETTINGS!")
                    draw_text(320/2, 224/2, "PRESS ANY KEY#FOR ( ACTION )")

                    if(keyboard_check_pressed(vk_anykey) && SetupCanEnter == 1){
                       global.Key_ACTION = keyboard_key;
                       SetupCanEnter = 0;
                       SetupKeyID+=1
                    }

                    break;
                    }

                    case 5:{
                    draw_text(320/2, 32, "CHANGE YOUR#KEYBOARD AND RESOLUTION SETTINGS!")
                    draw_text(320/2, 224/2, "PRESS ANY KEY#FOR ( SPECIAL )")

                    if(keyboard_check_pressed(vk_anykey) && SetupCanEnter == 1){
                       global.Key_SPECIAL = keyboard_key;
                       SetupCanEnter = 0;
                       SetupKeyID+=1
                    }

                    break;
                    }

                    case 6:{
                    draw_text(320/2, 32, "CHANGE YOUR#KEYBOARD AND RESOLUTION SETTINGS!")
                    draw_text(320/2, 224/2, "PRESS ANY KEY#FOR ( ENTER )")

                    if(keyboard_check_pressed(vk_anykey) && SetupCanEnter == 1){
                       global.Key_ENTER = keyboard_key;
                       SetupCanEnter = 0;
                       SetupKeyID+=1
                    }

                    break;
                    }

                    case 7:{
                    SetupKeyID    = 0;
                    SetupKeyboard = 0;

                    break;
                    }

             }

          }
                   if(SetupMID == 2 && keyboard_check_pressed(global.Key_RIGHT)){
          if(global.ScreenSize < 4){
             global.ScreenSize += 1;
 window_center();
          }
  else
  {
  global.ScreenSize = 1
  }
   if(global.ScreenSize != 4)
                   {
                   if(window_get_fullscreen() == true)
                   {
                      window_set_fullscreen(false);
  window_center();
                   }
                   window_set_size(global.ScreenWidth*global.ScreenSize, global.ScreenHeight*global.ScreenSize);
                   window_center();
                   }
                   else
                   {
                      window_set_fullscreen(true);
                      window_set_size(global.ScreenWidth, global.ScreenHeight);
                      window_center();
                   }
       }
   if(SetupMID == 2 && keyboard_check_pressed(global.Key_LEFT)){
          if(global.ScreenSize > 1){
             global.ScreenSize -= 1;
 window_center();
          }
  else
  {
 global.ScreenSize = 4
  }
  if(global.ScreenSize != 4)
                   {
                   if(window_get_fullscreen() == true)
                   {
                      window_set_fullscreen(false);
  window_center();
                   }
                   window_set_size(global.ScreenWidth*global.ScreenSize, global.ScreenHeight*global.ScreenSize);
                   window_center();
                   }
                   else
                   {
                      window_set_fullscreen(true);
                      window_set_size(global.ScreenWidth, global.ScreenHeight);
                      window_center();
                   }
       }
}

     // Volume Setup:
       if(SetupProcess == 3){
          draw_set_color(c_white)
          draw_set_halign(fa_center)
          draw_set_font(global.Font_Letters)

             // Ask for character.
             draw_text(320/2, 32, "CHANGE THE VOLUMES?")

             // Menu Options:
             if(SetupMID == 1){
                draw_set_color(c_yellow)
             }else{
                draw_set_color(c_white)
             }  draw_text(320/2, 224/2, "BACKGROUND MUSIC "+string( max(floor(global.MaxBGMV*100),min(0))) + "%");

             if(SetupMID == 2){
                draw_set_color(c_yellow)
             }else{
                draw_set_color(c_white)
             }  draw_text(320/2, 224/2+32, "SOUND EFFECTS "+string( max(floor(global.MaxSFXV*100),min(0))) + "%");

             if(SetupMID == 3){
                draw_set_color(c_yellow)
             }else{
                draw_set_color(c_white)
             }  draw_text(320/2, 224/2+64, "CONTINUE")


             draw_set_color(c_white)
             draw_set_halign(-1)

       }

     // Character Setup:
       if(SetupProcess == 4){
          draw_set_color(c_white)
          draw_set_halign(fa_center)
          draw_set_font(global.Font_Letters)

             // Ask for character.
             draw_text(320/2, 32, "WHICH CHARACTER WOULD#YOU LIKE TO USE?")

             // Menu Options:
             if(SetupMID == 1){
                draw_set_color(c_blue)
             }else{
                draw_set_color(c_white)
             }  draw_text(320/2, 224/2, "SONIC THE HEDGEHOG")

             if(SetupMID == 2){
                draw_set_color(c_yellow)
             }else{
                draw_set_color(c_white)
             }  draw_text(320/2, 224/2+32, "MILES TAILS PROWER")

             if(SetupMID == 3){
                draw_set_color(c_red)
             }else{
                draw_set_color(c_white)
             }  draw_text(320/2, 224/2+64, "KNUCKLES THE ECHIDNA")

             if(SetupMID == 4){
                draw_set_color(c_purple)
             }else{
                draw_set_color(c_white)
             }  draw_text(320/2, 224/2+96, "AMY ROSE")

             draw_set_color(c_white)
             draw_set_halign(-1)

       }
