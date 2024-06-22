#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.
    image_speed = 0;
    vspeed      = -.8;
    BubblePop   = false;
    BubbleIndex = 0;
    Transition  = random(1);
    if(Transition <> 1){
       Transition = -1;
    }
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// When the Bubbles size is big, pop it, otherwise, just vanish.

    if(BubbleIndex = 6){
       scr_create_dummy_effect(spr_water_bubble_pop, 0.10, x, y, 1, -10000)
    }
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Change Frame/Size.

    if(image_index != BubbleIndex){
       image_index += 0.10;
    }else{
       image_index = BubbleIndex;
    }

    // Allow to be pop'd:
       if(image_index = 6 && BubblePop = false){
          BubblePop = true;
       }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement.

    // Transition:
       if(hspeed >= 1){
          Transition = -1;
       }else if(hspeed <= -1){
          Transition = 1;
       }

    // Set Speed.
       if(Transition = 1){
          hspeed += .06;
       }else{
          hspeed -= .06;
       }

    // Destroy if we hit the surface or collision.
       if(y <= global.WaterSurfacePosition){
          instance_destroy();
       }

    // Destroy if we hit collision.
       if(place_meeting(x, y+1, par_collision_solid)){
          instance_destroy();
       }
#define Collision_par_character
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy and give Character air.
    if(BubblePop = true && other.Shield != ShieldBubble && other.Action != ActionDie && other.CharacterState != CharacterHyper){
       other.DrownTimer = 1800;
       other.Action     = ActionBreath;
       PlaySound(SFX.snd_character_air, global.SFXVolume, 1, 1);
       with obj_water_countdown{
       instance_destroy()
       }
       instance_destroy();
    }
