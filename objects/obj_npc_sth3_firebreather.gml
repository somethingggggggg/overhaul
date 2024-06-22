#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.

    Boss_HP          = 6;        // How many hits it takes until defeated.
    Boss_State       = 'Normal'; // State of the boss. 'Normal' > 'Hit' > 'Destroyed'
    Boss_InvTime     = 60;       // Invuln. Frames.
    Boss_DefTime     = 60;       // How long it takes until fully destroyed. (used to spawn explosions)
    Boss_FireTime    = 180;      // When to fire.
    Boss_Direction   = -1;       // Direction the boss is facing.
    Boss_Moving      = 0;        // Movement of the boss. (0 = Idle, 1 = Down, 2 = Up, 3 = Left, 4 = Right)
    Boss_AngRadius   = 0;        // Used to float.
    Boss_AngPosition = ystart;
    image_speed      = 0;

 // Create Flame:
    instance_create(x, y, obj_npc_sth3_firebreather_flame)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Boss is hit.

    if(Boss_State == 'Hit' && Boss_HP != 0){
       if(Boss_InvTime > 0){
          Boss_InvTime -=1
          image_speed  = 1/4;
       }else{
          Boss_State   = 'Normal';
          Boss_InvTime = 60;
          image_speed  = 0;
          image_index  = 0;
       }
    }else if(Boss_State == 'Hit' && Boss_HP < 1){
             Boss_State = 'Defeated';
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Boss Fire.

    if(Boss_FireTime > 0 && Boss_Moving = 0 && (Boss_State == 'Normal' || Boss_State == 'Hit' )){
       Boss_FireTime-=1
       if(Boss_FireTime <= 18){
          if((Boss_FireTime mod 6) == 0){
             ID = instance_create(x+Boss_Direction*32, y+4, obj_npc_sth3_firebreather_projectile)
             ID.image_speed = 0.2;
             ID.XSpd        = Boss_Direction*4;
          }
       }
       if(Boss_FireTime == 18){
          if(CheckSound(SFX.snd_object_fire) == false){
             PlaySound(SFX.snd_object_fire, global.SFXVolume, 1, 1);
          }
       }
    }
    if(Boss_FireTime < 1){
       Boss_FireTime = choose(180, 240);
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Boss is defeated.

    if(Boss_State == 'Defeated'){
       if(Boss_DefTime != 0){
          if(Boss_DefTime mod 8 == 0){
             scr_create_dummy_effect(spr_boss_explosion, 0.2, x-random(50)+35, y-15+random(40), 1, -1);
             PlaySound(SFX.snd_object_destroy, global.SFXVolume, 1, 0);
             if(instance_exists(obj_npc_sth3_firebreather_flame)){
                with(obj_npc_sth3_firebreather_flame){
                     instance_destroy();
                }
             }
         }
         Boss_DefTime -=1
       }else{

       // Create Broken Parts and reset camera.
          for(i=0; i<4; i+=1){
              Part[i] = instance_create(x, y, obj_npc_sth3_firebreather_parts);
              Part[i] . image_xscale = Boss_Direction;
              Part[i] . image_index = i;
              Part[i] . Direction   = Boss_Direction;
          }

       // Reset Camera:
          with(obj_camera){
               Cam_Subject    = instance_nearest(x, y, par_character);
               Cam_LeftLimit  = 0;
               Cam_RightLimit = room_width;
          }

       // Destroy:
          instance_destroy();

       }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Boss Camera.

    if(Boss_State != 'Defeated'){
       if(bbox_right  > view_xview
    && bbox_left   < view_xview + view_wview
    && bbox_bottom > view_yview
    && bbox_top    < view_yview + view_hview)
    {
          with(obj_camera){
               Cam_Subject    = par_character;
               Cam_LeftLimit  = Cam_Subject.x-view_wview/2;
               Cam_RightLimit = Cam_Subject.x+view_wview/2;
          }
       }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Boss Float.

    if(Boss_State != 'Defeated'){
       if(Boss_Moving == 0 || Boss_Moving = 3 || Boss_Moving = 4){
          Boss_AngRadius +=3
          y = Boss_AngPosition+lengthdir_y(6, Boss_AngRadius)
       }
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Boss.

    draw_sprite_ext(sprite_index, -1, x, y, Boss_Direction, 1, 0, c_white, 1);
