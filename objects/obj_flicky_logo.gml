#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Control Variables
YOrigin     = sprite_get_height(sprite_index) / 2; // Center of the Logo sprite.
XText       = room_width / 2;
TextWidth   = sprite_get_width(spr_flicky_text); // Width of the text part of the logo.

x        = room_width / 2;         // Set the initial position of the logo to be
y        = room_height + YOrigin;  // at the bottom center of the screen.
xstart   = x;
ystart   = y;

TTimer   = 0; // Tween timer.
BGAlpha  = 0;

alarm[0] = 30; // Wait 30 frames before showing the logo.

state    = 0;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Logo Timing
switch(state)
{
    case 0: // Allow the Flicky icon to move to the center of the screen.
        state = 1;
        break;
    case 2: // Start the Flicky Engine text entrance with a bang.
        PlaySound(SFX.snd_object_destroy, global.SFXVolume, 1,1);
        state = 3;
        break;
    case 4:
        state = 5;
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Logo States
switch(state)
{
    case 1: // Move the Flick icon to the center of the screen.
    {
        y = scr_tween_quad_out(TTimer, ystart, (room_height / 2) - ystart, 45);
        if (TTimer < 45)
            TTimer +=1 ;
        else
        {   // Play the iconic(tm) flicky chrip.
             sound_play(snd_flicky);
             instance_create(0,0,obj_audio_manager)
            TTimer  = 0;
            xstart  = x;
            state   = 2;
        }
        break;
    }
    case 2:
    {   // Small pause between the chirp and the text entrance.
        if (alarm[0] <= 0)
            alarm[0] = 24;
        break;
    }
    case 3:
    {   // Start showing the Flicky Engine text.
        x = scr_tween_quad_out(TTimer, xstart, -72, 16);
        XText = scr_tween_quad_out(TTimer, x, (x + YOrigin - 4) - x, 16);
        if (TTimer < 16)
            TTimer +=1;
        else
        {   // Wrapping things up.
            TTimer   = 0;
            alarm[0] = 72;
            state    = 4;
        }
    }
}

if(state == 5){
   // Increase BG Alpha.
   if(BGAlpha != 1.5){
      BGAlpha += .010;
   }else if(BGAlpha >= 1.4) {
        x     += 16
        XText += 16
        if (TTimer < 16)
            TTimer +=1;
        else
        {   // Done
               if(instance_exists(obj_fade_next) == false){
                  instance_create(0, 0, obj_fade_next);
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
/// Render the Logo parts.

// BG:
if state == 5{
   draw_sprite_ext(spr_flicky_background, -1, 0, -224, image_xscale, image_yscale, image_angle, image_blend, BGAlpha)
   }

// Draw the text part of the logo.
   if(state >= 3) {
      draw_sprite(spr_flicky_text, 0, XText, y);
   }

// Draw the Icon
   draw_self();
