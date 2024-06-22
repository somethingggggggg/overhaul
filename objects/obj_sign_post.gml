#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.

    Camera         = instance_create(x, y-80, obj_sign_post_camera)
    SpinActivated  = false;              // Whether or not to spin.
    SpinDuration   = 128;                // How many frames the Sign post spins.
    SpinTimer      = 2;                  // How many frames it takes to change the animation frame.
    SpinCharacter  = 0;                  // Required to correctly display the last frame.
    Drop           = 0;                  // Is the sign dropping?
    SpecialFlag    = 0;                  // Creates a different result object if true.
    XSpeed         = 0;                  // Horizontal speed of the sign post.
    YSpeed         = 0;                  // Vertical speed of the sign post.
    Finished       = 0;                  // Used when special flag is set to 1. Checks if this signpost is useless.
    image_speed    = 0;                  // You know what this does.
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Everything.

    // Exit:
       if(Finished == true){
          exit
       }

      // Set camera.
    if(bbox_right  > view_xview
    && bbox_left   < view_xview + view_wview
    && bbox_bottom > view_yview
    && bbox_top    < view_yview + view_hview)
    {
    with obj_camera{
 cam_handle = other.Camera;
limit_left  = other.Camera.x-view_wview/2;
limit_right = other.Camera.x+view_wview/2;
}
      }

    // Spin:
       if(SpinActivated){

          // Spin the Sign every 2 frames:
             if(SpinDuration != 0){
                if(SpinTimer != 0){
                   SpinTimer -= 1;
                }else{
                   SpinTimer    = 2;
                   image_index += 1;
                   if(SpinDuration mod 4 == 0){
                      scr_create_dummy_effect(spr_invincibility_sparkle, 0.6, x-24+(irandom_range(0, 3)*16), y-48+(irandom_range(0, 2)*16), 1, -1);
                   }
                }
             }

          // Spin as long as the SpinDuration variable is above 0:
             if(Drop == false){
                if(SpinDuration != 0){
                   SpinDuration -= 1;
                }else{
                   SpinDuration  = 0;
                   if(image_index != par_character.CharacterID*4){
                      image_index  = par_character.CharacterID*4;
                      with(par_character){
                           GoalState = 1;

                      }
                      if(instance_exists(obj_scoring_results) == false){
                         Tally = instance_create(x, y, obj_scoring_results);
                         if(SpecialFlag == true){
                            Tally.SpecialFlag = true;
                            Finished          = true;
                         }
                      }
                   }
                }
             }
       }

    // Drop:
       if(place_meeting(x, y + YSpeed, par_collision_solid) && YSpeed > 0){
          while(!place_meeting(x, y + sign(YSpeed), par_collision_solid)){
                y += sign(YSpeed);
          }
          Drop   = false;
          XSpeed = 0;
          YSpeed = 0;
          event_user(0);
       }
       if(Drop == true){
          YSpeed += 0.21875
          if(YSpeed > 4){
             YSpeed = 4;
          }
          y  += YSpeed;
          if(SpinActivated == false){
             SpinActivated = true;
          }
       }

    // Bounce:
       if(instance_exists(par_character) && Drop == true){
          if(place_meeting(x, y-1, par_character)){
             if(par_character.Action == ActionJump){
                YSpeed  = -6;
                XSpeed  = (x - par_character.x)/6;
                if(CheckSound(SFX.snd_object_signpost) == false){
                   PlaySound(SFX.snd_object_signpost, global.SFXVolume, 1, 1);
                }
             }
          }
       }
       if(SpecialFlag != 0 && Drop != false){
          if(x < view_xview+sprite_width/2){
             XSpeed = 2;
          }
          if(x > view_xview+view_wview-sprite_width/2){
             XSpeed = -2;
          }
          x += XSpeed;
          }

    // Update Camera position (for dropping)
       if(SpecialFlag != 0){
          Camera.y = y-80;
       }
#define Collision_par_character
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Trigger.
    if(SpinActivated == false && Drop == false){
       SpinActivated = true;
       PlaySound(SFX.snd_object_signpost, global.SFXVolume, 1, 1);
       if(obj_camera.cam_handle == par_character){
          obj_camera.cam_handle = Camera;
       }
       global.DoTime = 0;

       with(par_character){
               // Make sure that you can no longer transform after this.
                  AllowTransformation = 0;
                  scr_animation_reset()
            if(CharacterState != CharacterNormal){
               // Make sure to not run the alarm event:
                  alarm[0] = -1;
               // Reset the Characters state:
                  CharacterState = CharacterNormal;
               // Change the animation to "BLANK" to make sure that the current animation is being reloaded.
                  Animation      = "BLANK";
               // Reset the Transform Timer:
                  TransformTimer = 15;
               // Again, change the animation to "BLANK" to make sure that the current animation is being reloaded properly.
                  Animation      = "BLANK AGAIN";
               // If we're Sonic, use a little fade palette:
                  if(CharacterID = CharacterSonic){
                     TransformEnded  = 1;    
                     PalettePosition = 0;       
                  }           
            }            
       }
       
     }
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// After drop, finish everything.

    if(SpinActivated == false && Drop == false){
       SpinActivated = true;
       with(par_character){
               // Make sure that you can no longer transform after this.
                  AllowTransformation = 0;
            if(CharacterState != CharacterNormal){
               // Make sure to not run the alarm event:
                  alarm[0] = -1;
               // Reset the Characters state:
                  CharacterState = CharacterNormal;
               // Change the animation to "BLANK" to make sure that the current animation is being reloaded.
                  Animation      = "BLANK";
               // Reset the Transform Timer:
                  TransformTimer = 15;
               // Again, change the animation to "BLANK" to make sure that the current animation is being reloaded properly.
                  Animation      = "BLANK AGAIN";
               // If we're Sonic, use a little fade palette:
                  if(CharacterID = CharacterSonic){
                     TransformEnded  = 1;    
                     PalettePosition = 0;       
                  }           
            }            
       }
       
     }
     global.DoTime = 0;
