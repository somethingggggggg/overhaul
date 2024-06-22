#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Camera variables.
 // Set view:
    view_object [0] = id;
    view_hborder[0] = 398/2;
    view_vborder[0] = 224/2;
    view_xhalf      = global.ScreenWidth  * 0.5;
    view_yhalf      = global.ScreenHeight * 0.5;

 // Horizontal Borders:
    border_left  = x-8;
    border_right = x+8;
    limit_right = room_width;
    limit_left  = 0;
 // Vertical Borders:
    border_top    = y-32;
    border_bottom = y+32;
    limit_top    = 0;
    limit_bottom = room_height;
 // Camera handle:
    cam_handle = par_character;
    cam_speed  = 6.5;

 // Camera position.
    cam_x       = x;
    cam_y       = y;
    cam_x_shift = 0;
    cam_y_shift = 0;
    cam_lag     = 0;
    cam_limit   = 0;

// Special functions.
    Camera_ShakeScreen   = false;              // If enabled, the screen will shake as long as _ShakeDuration is above 0.
    Camera_ShakeDuration = 0;                  // How many frames the Shaking lasts.
    Camera_ShakeForce    = 0;                  // The force of the Shake, 2 to 3 is a good number, everything above 3 is a strong shake.
    Camera_ShakeSound    = SFX.snd_object_crumble; // If not set to noone, the game will loop this sound until the shake is over.
    Camera_DebugDisplay  = false;              // Displays Debug Graphics.
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Camera Shake.

    if(Camera_ShakeScreen = true){
       if(Camera_ShakeDuration != 0){
          if(CheckSound(Camera_ShakeSound) == false){
             LoopSound(Camera_ShakeSound, global.SFXVolume, 1);
          }
          Camera_ShakeDuration-=1
       }else{
          if(CheckSound(Camera_ShakeSound) == true){
             StopSound(Camera_ShakeSound);
          }
          Camera_ShakeScreen = false;
          Camera_ShakeForce  = 0;
       }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Camera lag.
 // Used to stop the camera from moving, one example is when releasing a spindash or using a fire shield.

    if(cam_lag)
    {
       cam_lag -= 3;
    }
    if(cam_lag < 0)
    {
       cam_lag = 0;
    }
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Camera shifting.

    if(cam_handle == par_character)
    {
       // Looking up:
          if(cam_handle.Action == ActionLookup && cam_handle.TimerUp >= 120 && cam_handle.y > limit_top+view_yhalf)
          {
             cam_y_shift = max(-104, cam_y_shift-2);
          }
          else
       // Looking down:
          if(cam_handle.Action == ActionCrouch && cam_handle.TimerDown >= 120 && cam_handle.y < limit_bottom-view_yhalf)
          {
             cam_y_shift = min(104, cam_y_shift+2);
          }
          else // Center camera.
          {
             cam_y_shift = max(0, abs(cam_y_shift)-2)*sign(cam_y_shift);
          }

       // Pan the camera horizontally if the player is using the peelout move.
          if((cam_handle.Action == ActionPeelout && cam_handle.PeeloutTimer > 6) || cam_handle.PeeloutFlag == 1)
          {
             var (_xdir) = sign(cam_handle.XSpeed + cam_handle.AnimationDirection);
             if(cam_handle.AnimationDirection == 1)
             {
                cam_x_shift = scr_approach(cam_x_shift, 64, 2);
             }
             else
             if(cam_handle.AnimationDirection == -1)
             {
                cam_x_shift = scr_approach(cam_x_shift, -64, 2);
             }
          }
          else
          {
             // Sonic Cd Camera:
          if((cam_handle.XSpeed >= 6 && global.Camera = 1 && cam_handle.XSpeed != 0 || cam_handle.XSpeed <= -6 && global.Camera = 1 && cam_handle.XSpeed != 0))
          {
             var (_xdir) = sign(cam_handle.XSpeed + cam_handle.AnimationDirection);
             if(cam_handle.AnimationDirection == 1)
             {
                cam_x_shift = scr_approach(cam_x_shift, 64, 2);
             }
             else
             if(cam_handle.AnimationDirection == -1)
             {
                cam_x_shift = scr_approach(cam_x_shift, -64, 2);
             }
          }
          else
          {
             cam_x_shift = max(0, abs(cam_x_shift)-2)*sign(cam_x_shift);
          }
          }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Camera movement.

 // Update borders.
    border_left   = (cam_x-8) - (cam_lag);
    border_right  = (cam_x+8) + (cam_lag);
    border_top    = (cam_y-32);
    border_bottom = (cam_y+32);

 // Set temp view center variables:
    var centerX, centerY;
    centerX = (view_wview[0])/2;
    centerY = (view_hview[0])/2;

 // Player camera handling:
    if(cam_handle == par_character)
    {
       // Move camera to the right.
          if(cam_handle.x > border_right && cam_handle.x <= (limit_right-centerX))
          {
             cam_x += min(abs(cam_handle.x-border_right), 16);
          }
       // Move camera to the left.
          if(cam_handle.x < border_left && cam_handle.x >= (limit_top-centerX))
          {
             cam_x -= min(abs(cam_handle.x-border_left), 16);
          }

       // Move camera up or down while in the air.
         if(cam_handle.Ground == false && cam_handle.Action != ActionDie)
         {
            if(cam_handle.y > border_bottom && cam_handle.y < limit_bottom-centerY)
            {
               cam_y += cam_handle.y-border_bottom;
            }
            if(cam_handle.y < border_top && cam_handle.y > limit_top+centerY)
            {
              cam_y -= border_top-cam_handle.y;
            }
         }

       // Move camera up or down while grounde.
         if(cam_handle.Ground == true && cam_handle.Action != ActionDie)
         {
            if(cam_handle.y != cam_y)
            {
               if(abs(cam_handle.y-cam_handle.yprevious) <= 6)
               {
                  if(cam_handle.y > cam_y && cam_handle.y < limit_bottom-centerY)
                  {
                      cam_y += min(abs(cam_handle.y-cam_y), 6);
                  }
                  if(cam_handle.y < cam_y && cam_handle.y > limit_top+centerY)
                  {
                     cam_y -= min(abs(cam_y-cam_handle.y), 6);
                  }
               }
               if(abs(cam_handle.y-cam_handle.yprevious) > 6)
               {
                  if(cam_handle.y > cam_y && cam_handle.y < limit_bottom-centerY)
                  {
                     cam_y += min(abs(cam_handle.y-cam_y), 16);
                  }
                  if(cam_handle.y < cam_y && cam_handle.y > limit_top+centerY)
                  {
                     cam_y -= min(abs(cam_y-cam_handle.y), 16);
                  }
               }
            }
         }
    }

 // Target camera handling:
    if(cam_handle != noone && cam_handle != par_character)
    {
       if(cam_handle.x != cam_x)
       {
          if(cam_handle.x > cam_x && cam_x <= limit_right-centerX)
          {
             cam_x += min(abs(cam_handle.x-cam_x), cam_speed);
          }
          if(cam_handle.x < cam_x && cam_x >= limit_left-centerX)
          {
             cam_x -= min(abs(cam_x-cam_handle.x), cam_speed);
          }
       }
       if(cam_handle.y != cam_y)
       {
          if(cam_handle.y > cam_y && cam_y < limit_bottom-centerY)
          {
             cam_y += min(abs(cam_handle.y-cam_y), cam_speed);
          }
          if(cam_handle.y < cam_y && cam_y > limit_top-centerY)
          {
             cam_y -= min(abs(cam_y-cam_handle.y), cam_speed);
          }
       }
    }

 // Set position, floor the camera values to prevent jittering.
    x = floor(cam_x + cam_x_shift + random_range(-Camera_ShakeForce, Camera_ShakeForce));
    y = floor(cam_y + cam_y_shift + random_range(-Camera_ShakeForce, Camera_ShakeForce));
