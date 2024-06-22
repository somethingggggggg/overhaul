#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.

    // The following variables have to be in the monitor preset!
    // MonitorID    =  -1; // Unique ID for this monitor (1 - Rings, 2 - shield, ...)
    // MonitorIcon  =  -1; // What icon the monitor uses.

    image_speed   = 0.3;     // Obvious.
    YSpeed        = 0;       // Vertical speed.
    Gravity       = 0.21875; // Gravitation.
    Bump          = false;   // Check if bumped.
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create the destroyed monitor:
    ID = instance_create(x, y, obj_monitor_destroyed);
    ID.  DestroyParent = DestroyParent;
    ID.  IconID = MonitorIcon;
    ID.  Y      = y-2;
    ID.  DestroyParent = DestroyParent;

 // Dummy Effect:
    scr_create_dummy_effect(spr_explosion, 0.2, x, y, 1, 0);

 // Play Sound:
    PlaySound(SFX.snd_object_break, global.SFXVolume, 1, 0);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Gravity.
    if(Bump == true){
       if(YSpeed >= 0 && place_meeting(x, y+1, par_collision_terrain)){
          YSpeed  = 0;
          while(place_meeting(x, y, par_collision_terrain)){
                y-=1;
          }
       }else{
          YSpeed += Gravity;
       }
          y+= YSpeed;
    }
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Flashlight Mode.
if instance_exists(obj_flashlight){
size = 128;
draw_set_blend_mode(bm_subtract)
surface_set_target(light);
draw_ellipse_color(x-size/2-view_xview,y-size/2-view_yview,x+size/2-view_xview,y+size/2-view_yview,c_white,c_black,false)
surface_reset_target()
draw_set_blend_mode(bm_normal)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw the Monitor.

    draw_sprite(sprite_index, -1, x, y);
    if(global.GameTime div 4 mod 2 != 0 ){
       draw_sprite(spr_monitor_icon, MonitorIcon, x, y-5);
    }
