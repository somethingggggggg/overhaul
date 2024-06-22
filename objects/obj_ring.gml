#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.

    // Default:
       IsCollected    = false; // Whether or not we collected this ring.
       IsAttracted    = false; // Whether or not this ring is getting attracted to us.

    // Motion:
       InMotion       = false; // Whether or not this ring is in motion.
       GravityForce   = 0.2;   // Gravity of this ring.
       XSpeed         = 0;     // X Speed of this ring.
       YSpeed         = 0;     // Y Speed of this ring.

    // Misc. Variables:
       RingTimer      = 0;     // Used to make the ring disappear.
       RingFlash      = 1;     // Used for the flashing effect.

    // Character variables:
       DistanceToChar = 0;     // Distance to the character.
       AngleToChar    = 0;     // Angle to the character.

    // Disable this:
       image_speed    = 0;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy.
    if(IsCollected){
       scr_create_dummy_effect(spr_ring_sparkle, 0.4, x, y, 1, 0);
    }

 // Magnetized ring.
    if(IsAttracted == true || par_character.CharacterState = CharacterSuper || par_character.CharacterState = CharacterHyper)
    {
       instance_create(x, y, obj_ring_magnetized);
    }
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement.
 // Exit if player doesn't exist.
// Exit if in motion.
    if(InMotion == true) exit;

    if(IsAttracted == false)
    {
     // Exit if player doesn't exist.
       if(!instance_exists(par_character)) exit;

       var player;
       player = instance_nearest(x, y, par_character);

       if(player != noone)
       {
          if(player.Shield == ShieldElectricity || player.CharacterState = CharacterSuper || player.CharacterState = CharacterHyper)
          {
             if(distance_to_object(player) < 64)
             {
                IsAttracted = true;
                instance_destroy();
             }
          }
       }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Motion (Dropped)
    if IsAttracted = 0{
 // Apply Motion:
    if(InMotion == true)
    {
       if(!place_meeting(x+XSpeed, y, par_collision_solid))
       {
          x += XSpeed;
       }
       else
       {
          XSpeed *= -0.25;
       }
       if(!place_meeting(x, y+YSpeed, par_collision_solid))
       {
          y += YSpeed;
       }
       else
       {
          YSpeed *= -0.75;
       }  YSpeed += 0.09375

       // Decrease timer:
          if(RingTimer > 0)
          {
             RingTimer -= 1
          }
          else instance_destroy();
    }

 // Destroy rings outside the view.
    if(InMotion == true)
    {
       if(x < view_xview-sprite_width || x > view_xview+view_wview+sprite_width || y < view_yview-sprite_height || y > view_yview+view_hview+sprite_height)
       {
          instance_destroy();
          }
       }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation Speed.
   if(InMotion == 0){
      image_index = global.ObjectTime div 120;
   }

   if(InMotion == 1 && RingTimer > 120){
      image_index = global.ObjectTime div 80;
   }

   if(InMotion && RingTimer < 120){
      image_index = global.ObjectTime div 200;
   }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Rings.

    // Draw them Flashing:
       if(InMotion && RingTimer < 90){
          if((RingTimer div 4) mod 2) draw_sprite(spr_ring, image_index, x, y);
       }else{
          // Draw them normally:
             draw_sprite(spr_ring, image_index, x, y);
       }
