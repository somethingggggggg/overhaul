#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.
    IconPosition       =  0;
    IconMoveTimer      = 45;
    IconDisappearTimer = 30;
    IconRewarded       = -1;
    YSpeed             = 0;
    Gravity            = 0.21875;
    Landed             = false;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Monitor Icon.

  // Move Up:
     if(IconMoveTimer != 0){
        IconPosition  -= 1;
        IconMoveTimer -= 1;
     }
  // Stop Movement:
     else if(IconMoveTimer == 0 && IconDisappearTimer != 0) {
             IconDisappearTimer -= 1;
     }

  // Do something (Reward us with Rings, Shields, etc)
     if(IconMoveTimer == 0 && IconRewarded = -1){
        IconRewarded = 1;
        event_user(0);
     }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Gravity.
    if(Landed == false){
       if(YSpeed >= 0 && place_meeting(x, y+1, par_collision_terrain)){
          YSpeed  = 0;
          Landed  = true;
          while(place_meeting(x, y, par_collision_terrain)){
                y-=1;
          }
       }else{
          YSpeed += Gravity;
       }
          y+= YSpeed;
    }
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Give us something.

    switch(IconID){
           case 0: {
                PlaySound(SFX.snd_object_ring, global.SFXVolume, 1, 0)
                global.Rings += 10
                break;
           }

           case 1: {
                PlaySound(SFX.snd_shield_get_bubble, global.SFXVolume, 1, 0)
                   if(DestroyParent.ShieldChild != 0){
                      if(instance_exists(DestroyParent.ShieldChild)){
                         with(DestroyParent.ShieldChild){
                              instance_destroy();
                         }
                      }
                   }
                   DestroyParent.Shield = ShieldBubble;
                   DestroyParent.ShieldUsable = true;
                break;
           }

           case 2: {
                PlaySound(SFX.snd_shield_get_flame, global.SFXVolume, 1, 0)
                   if(DestroyParent.ShieldChild != 0){
                      if(instance_exists(DestroyParent.ShieldChild)){
                         with(DestroyParent.ShieldChild){
                              instance_destroy();
                         }
                      }
                   }
                   DestroyParent.Shield = ShieldFlames;
                   DestroyParent.ShieldUsable = true;
                break;
           }

           case 3: {
                PlaySound(SFX.snd_shield_get_electricity, global.SFXVolume, 1, 0)
                   if(DestroyParent.ShieldChild != 0){
                      if(instance_exists(DestroyParent.ShieldChild)){
                          with(DestroyParent.ShieldChild){
                               instance_destroy();
                         }
                      }
                   }
                   DestroyParent.Shield = ShieldElectricity;
                   DestroyParent.ShieldUsable = true;
                break;
           }

           case 4: {
                global.SFXVolume = obj_audio_manager.ZoneMySfxVolume
                PlaySound(SFX.snd_character_life, global.SFXVolume, 1, 1)
                global.Lives+=1
                break;
           }

           case 5: {
                   with(DestroyParent){
                       Invincibility = 1.5;
                       InvTimer      = 900;
                   }
                break;
           }

           case 6: {
                with(DestroyParent){
                    HasSpeedShoes  = true;
                    SpeedShoeTimer = 900;
                }
                break;
           }
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw the Broken Monitor.
    draw_sprite(sprite_index, -1, x, y)

 // Draw Icon:
    if(IconDisappearTimer != 0){
       draw_sprite_ext(spr_monitor_icon, IconID, x, Y+IconPosition, 1, 1, 0, c_white, 1)
    }
