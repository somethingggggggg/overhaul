#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.

    RunStep     = false;
    image_speed = 0;
    alarm[0]    = 1;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Get ID.

    RunStep                       = true;
    SwitchTriggered   [SwitchID]  = false;
    SwitchTriggerEvent[SwitchID]  = false;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Trigger switch event.

    if(RunStep == true){
       if(SwitchTriggered[SwitchID] == false){
          if(SwitchTriggerEvent[SwitchID] = true){
             SwitchTriggerEvent[SwitchID] = false;
             event_user(0);
          }
       }
       if(SwitchTriggered[SwitchID] == true){
          if(SwitchTriggerEvent[SwitchID] = false){
             SwitchTriggerEvent[SwitchID] = true;
             event_user(0);
          }
       }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Collision with Objects.

    if(place_meeting(x, y-1, par_character)){
       if(SwitchTriggered[SwitchID] == false){
          PlaySound(SFX.snd_object_switch, global.SFXVolume, 1, 1);
          SwitchTriggered[SwitchID]  = true;
          image_index                = 1;
       }
    }else
    if(place_meeting(x, y, par_collision_pushable)){
       if(SwitchTriggered[SwitchID] == false){
          PlaySound(SFX.snd_object_switch, global.SFXVolume, 1, 1);
          SwitchTriggered[SwitchID]  = true;
          image_index                = 1;
       }
    }else{
       if(SwitchTriggered[SwitchID]  = true){
          SwitchTriggered[SwitchID]  = false;
          image_index                = 0;
       }
    }
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Switch Events.

    // Open Doors in Flicky Ruins:
       rm_ruins = room_exists("rm_flicky_ruins");
       if(rm_ruins != noone){

          if(room == rm_flicky_ruins){

          // Open Door:
             if(SwitchTriggerEvent[1] == true){
                _Door = instance_nearest(x, y, obj_flicky_ruins_door);
                if(_Door != noone){
                   with(_Door){
                        if(DoorOpen == false){
                           DoorOpen = true;
                        }
                   }
                }
             }

          // Close Door:
             if(SwitchTriggerEvent[1] == false){
                _Door = instance_nearest(x, y, obj_flicky_ruins_door);
                if(_Door != noone){
                   with(_Door){
                        if(DoorOpen == true){
                           DoorOpen = false;
                        }
                   }
                }
             }

          }

       }
