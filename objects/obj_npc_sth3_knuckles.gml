#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.

    Knuckles_HP            =  8;     // How many hits it takes to defeat Knuckles.
    Knuckles_InvTime       = 60;     // How long knuckles can't be hit.
    Knuckles_State         = 'Idle'; // State of Knuckles (Idle > Punch > Spindash > Jump > Glide > Hurt)
    Knuckles_SpindashTimer =  6;     // How long the spindash lasts.
    Knuckles_GlideState    =  0;     // Used for Knuckles Jump/Glide.
    Knuckles_GlideAccel    =  0;     // Accel when Gliding.
    Knuckles_Direction     = -1;     // Direction Knuckles is facing.
    Knuckles_Ground        = -1;     // Is knuckles on the ground?
    Knuckles_XSpeed        =  0;     // Horizontal speed of knuckles.
    Knuckles_YSpeed        =  0;     // Vertical speed of knuckles.
    alarm[0]               = 200;
    _Pitch                 =  0;
    image_speed = 0;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Random Attack.

    var rAttack;
    rAttack = choose(1, 2, 3, 2, 3, 1, 1, 3, 2, 1);

//  Punch:
    if(rAttack = 1){
       Knuckles_State = 'Punch';
       exit;
    }
    else
//  Spindash:
    if(rAttack = 2){
       image_index    = 12;
       Knuckles_State = 'Spindash';
       exit;
    }
    else
//  Punch & Spindash:
    if(rAttack = 3){
       Knuckles_State = 'Spindash';
       exit;
    }
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// States.

 // Idle:
    if(Knuckles_State = 'Idle'){
       if(image_index > 6){
          image_index = 0;
       }
       image_index += 0.15;
       if(alarm[0] = -1){
          alarm[0] = choose(120, 60, 60, 120);
       }
    }

 // Punch:
    if(Knuckles_State = 'Punch'){
       if(image_index >= 12){
          Knuckles_State = 'Idle';
       }
       image_index += 0.15;
    }

 // Spindash:
    if(Knuckles_State = 'Spindash'){
       if(image_index > 19){
          PlaySound(SFX.snd_character_spindash_charge, global.SFXVolume, 1+_Pitch, 1);
          if(_Pitch < 1){
             _Pitch+=0.10;
          }
          image_index = 14;
          Knuckles_SpindashTimer-=1 ;
       }
       if(Knuckles_SpindashTimer == 0){
          Knuckles_SpindashTimer = 6;
          Knuckles_State         = 'Roll';
          Knuckles_XSpeed        = Knuckles_Direction*6;
          _Pitch                 = 0;
          image_index            = 20;
          PlaySound(SFX.snd_character_spindash_release, global.SFXVolume, 1, 1);
       }
       if(image_index < 14){
          image_index += 0.15;
       }else{
          image_index += 0.50;
       }
    }

 // Roll:
    if(Knuckles_State = 'Roll'){
       if(image_index < 20 || image_index > 27){
          image_index = 20;
       }
       image_index += 0.50;
    }

 // Glide (Jump)
    if(Knuckles_State = 'Glide'){
       if(Knuckles_GlideState < 1){
          Knuckles_GlideState += 0.05;
          if(Knuckles_GlideState == 0.25){
             image_index = 13;
          }else if(Knuckles_GlideState == 0.75){
                   image_index = 12;
          }else if(Knuckles_GlideState >= 0.95){
                   PlaySound(SFX.snd_character_jump, global.SFXVolume, 1, 1);
                   Knuckles_Ground = false;
                   Knuckles_YSpeed = -6;
          }
       }else{
         if(Knuckles_GlideState == 1 && Knuckles_YSpeed < 0){
            if(image_index < 20 || image_index > 27){
               image_index = 20;
            }
            image_index += 0.50;
         }else{
            Knuckles_GlideState  = 2;
            image_index = 29;
         }
         if(Knuckles_GlideState = 2){
            Knuckles_GlideAccel += 0.015625;
            Knuckles_XSpeed      = Knuckles_Direction*4+Knuckles_GlideAccel;
         }
         if(Knuckles_GlideState = 2 && ((Knuckles_XSpeed < 0 && x < view_xview+sprite_get_width(sprite_index)*2) || (Knuckles_XSpeed > 0 && x > view_xview+view_wview-sprite_get_width(sprite_index)*2))){
            Knuckles_State      = 'Drop';
            Knuckles_XSpeed     = Knuckles_XSpeed*0.25;
            Knuckles_GlideState = 0;
            Knuckles_GlideTimer = 60;
         }
       }
    }

 // Drop:
    if(Knuckles_State = 'Drop'){
       if(Knuckles_Ground != 1){
          if(image_index != 31){
             image_index += 0.10;
          }
       }else{
         if(image_index > 15){
            image_index = 12;
            Knuckles_XSpeed = 0;
            PlaySound(SFX.snd_character_land, global.SFXVolume, 1, 1);
         }
         if(image_index < 14){
            image_index += 0.15;
         }else{
            Knuckles_State  = 'Idle';
         }
       }
    }

 // Hurt.
    if(Knuckles_State = 'Hurt'){
       if(Knuckles_HP != 0){
          if(image_index != 28){
             image_index         = 28;
             Knuckles_Ground     = false;
             Knuckles_GlideState = 0;
             Knuckles_XSpeed     = -Knuckles_Direction*2;
             Knuckles_YSpeed     = -4;
          }
       }else if(Knuckles_HP < 1){
          if(image_index < 32){
             image_index         = 32;
             Knuckles_Ground     = false;
             Knuckles_GlideState = 0;
             Knuckles_XSpeed     = -Knuckles_Direction*2;
             Knuckles_YSpeed     = -4;
             if(CheckSound(SFX.bgm_knuckles_fight) == true){
                StopSound(SFX.bgm_knuckles_fight);
             }
          }
       }
    }

    if(Knuckles_InvTime < 60){
       Knuckles_InvTime-=1
    }
    if(Knuckles_InvTime <= 0){
       Knuckles_InvTime = 60;
    }

 // Switch Direction:
    if(Knuckles_State == 'Idle'){
       if(par_character.x > x){
          Knuckles_Direction = 1;
       }
       if(par_character.x < x){
          Knuckles_Direction = -1;
       }
    }

 // Glide Accel & Timer:
    if(Knuckles_State != 'Glide'){
       Knuckles_GlideAccel = 0;
       Knuckles_GlideTimer = 60;
    }

 // Fix Alarm:
    if(Knuckles_State != 'Idle'){
       if(alarm[0] != -1){
          alarm[0]  = -1;
       }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Collision & Horizontal & Vertical Movement.

 // Collision:
    if(place_meeting(x, y + Knuckles_YSpeed, par_collision_solid)){
       while(!place_meeting(x, y + sign(Knuckles_YSpeed), par_collision_solid)){
             y += sign(Knuckles_YSpeed);
       }
       Knuckles_YSpeed = 0;
       Knuckles_Ground = 1;
    // When hit:
       if(Knuckles_State == 'Hurt' && Knuckles_HP != 0){
          Knuckles_InvTime = 59;
          Knuckles_XSpeed  = 0;
          Knuckles_State   = 'Glide';
       }else if(Knuckles_State == 'Hurt' && Knuckles_HP = 0){
                Knuckles_XSpeed = 0;
                Knuckles_YSpeed = 0;
                if(floor(image_index) != 34){
                   image_index += 0.15;
                }else{
                   image_index = 34;
                }
       }
    }else{
     // Gravity:
       if(Knuckles_GlideState != 2){
          Knuckles_YSpeed += 0.21875
       }else{
          Knuckles_YSpeed  = 0;
       }
       Knuckles_Ground = 0;
    }
    if(Knuckles_GlideState != 2){
       y += Knuckles_YSpeed;
    }

 // Hit Borders:
    if(Knuckles_XSpeed < 0 && x < view_xview+sprite_get_width(sprite_index)/2){
       if(Knuckles_State = 'Roll'){
          Knuckles_State     = 'Idle';
          Knuckles_Direction = -Knuckles_Direction;
          Knuckles_XSpeed    = 0;
       }
       if(Knuckles_GlideState == 2){
          Knuckles_State      = 'Drop';
          Knuckles_XSpeed     = 0;
          Knuckles_Direction = -Knuckles_Direction;
          Knuckles_GlideState = 0;
          Knuckles_GlideTimer = 0;
       }
       x = view_xview+sprite_get_width(sprite_index)/2

    }
    if(Knuckles_XSpeed > 0 && x > view_xview+view_wview-sprite_get_width(sprite_index)/2){
       if(Knuckles_State = 'Roll'){
          Knuckles_State     = 'Idle';
          Knuckles_Direction = -Knuckles_Direction;
          Knuckles_XSpeed    = 0;
       }
       if(Knuckles_GlideState == 2){
          Knuckles_State      = 'Drop';
          Knuckles_XSpeed     = 0;
          Knuckles_Direction  = -Knuckles_Direction;
          Knuckles_GlideState = 0;
          Knuckles_GlideTimer = 0;
       }
       x = view_xview+view_wview-sprite_get_width(sprite_index)/2;
    }

 // Update positions:
    x += Knuckles_XSpeed;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Camera lock.

    if(Knuckles_HP != 0){
       if(bbox_right  > view_xview
    && bbox_left   < view_xview + view_wview
    && bbox_bottom > view_yview
    && bbox_top    < view_yview + view_hview)
    {
          with(obj_camera){
               Cam_Subject    = instance_nearest(x, y, obj_boss_camera);
               Cam_LeftLimit  = Cam_Subject.x-view_wview/2;
               Cam_RightLimit = Cam_Subject.x+view_wview/2;
          }

          // Loop Boss Theme.
             if(CheckSound(SFX.bgm_knuckles_fight) == false){
                LoopSound(SFX.bgm_knuckles_fight, global.SFXVolume, 1)
             }
       }
    }else{
          with(obj_camera){
               Cam_Subject    = par_character;
               Cam_LeftLimit  = 0;
               Cam_RightLimit = room_width;
          }
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Knuckles.

    if(Knuckles_InvTime != 60){
       if((global.ObjectTime div 60) mod 3){
          draw_sprite_ext(sprite_index, image_index, floor(x), floor(y), Knuckles_Direction, 1, 0, c_white, 1)
       }
    }else{
          draw_sprite_ext(sprite_index, image_index, floor(x), floor(y), Knuckles_Direction, 1, 0, c_white, 1)
          if(Knuckles_State = 'Spindash' && (image_index >= 14)){
             draw_sprite_ext(spr_spindash_dust, current_time div 40, floor(x-Knuckles_Direction*7), floor(y), Knuckles_Direction, 1, 0, c_white, 1);
          }
    }
