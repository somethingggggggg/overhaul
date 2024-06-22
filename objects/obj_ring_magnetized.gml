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
       Cancelled       = false; // if the Player have shield or is super/hyper don't bounce else return to the old ring and bounce.
       
    // Disable this:
       image_speed    = 0;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create new ring.

    if(Cancelled == true)
    {
       with(instance_create(x, y, obj_ring))
       {
            RingTimer   = 256;
            InMotion  = true;
            XSpeed = other.hspeed;
            YSpeed = other.vspeed;
       }
    }
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy:
        instance_destroy();
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement.

 // Exit if player doesn't exist.
    if(!instance_exists(par_character)) exit;
 
    var player;
    player = instance_nearest(x, y, par_character);
    
    var xx, yy;
    xx = sign(player.x-x);
    yy = sign(player.y-y);
    
    hspeed += xx*(0.1875+(0.75*(sign(hspeed)!=xx)));
    vspeed += yy*(0.1875+(0.75*(sign(vspeed)!=yy))); 
    speed   = scr_clamp(speed, -64, 64);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation Speed.

      image_index = global.ObjectTime div 120;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy.
        if(!instance_exists(par_character)) exit;

    if(par_character.Shield != ShieldElectricity && par_character.CharacterState != CharacterSuper && par_character.CharacterState != CharacterHyper)
    {
       if(Cancelled == false)
       {
          Cancelled    = true;
          alarm[0]  = 5;
       }
    }
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy a ring if spilled, and outside the view.
    if(x < view_xview || x > view_xview+view_wview){
       instance_destroy();
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Rings.
    draw_sprite(spr_ring, image_index, x, y);
