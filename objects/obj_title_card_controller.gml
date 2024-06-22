#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.

      Position_State = 1;  // How a position should change (see step event)

      Zone_Position_X[1] = view_wview;  // X Position of the Zone name.
      Zone_Position_X[2] = view_wview;  // X Position of the "Zone" below the zone name.
      Zone_Position_Y    = 90;          // Y Position of the Zone name.

      Act_Position_X = view_wview;                                   // X Position of the act letter.
      Act_Position_Y = 90+sprite_get_height(spr_title_card_acts)*2;  // Y Position of the act letter.

      Banner_Position_X = 0 + sprite_get_width(spr_title_card_banner);  // X Position of the Banner.
      Banner_Position_Y = 0 - sprite_get_height(spr_title_card_banner); // Y Position of the Banner.

      Stop_Timer     = 60;  // How long we stop after we show the zone details.
      Backdrop_Alpha = 1;   // Alpha of the black backdrop.

      SpecialFlag    = 0;
      Completed      = 0;   // Checks if the object did it's work.
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy.
    if(Completed == 0){
       Completed  = 1;
       alarm[0] = 60*4;
    }else{
       instance_destroy();
    }
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Move Positions.

    // Banner:
    // Appear:
       if(Position_State == 1){
          if(Banner_Position_Y != 0){
             Banner_Position_Y = min(0, Banner_Position_Y+10);
          }else{
             Banner_Position_Y  = 0;
             Position_State     = 2;
          }
       }

    // Zone Name:
       if(Position_State == 2){
          if(global.BonusStage == false){
             if(Zone_Position_X[1] != 320 - 16 - string_width(string(global.ZoneName))){
                Zone_Position_X[1] = max(320 - 16 - string_width(string(global.ZoneName)), Zone_Position_X[1]-10);
             }
          }else{
             if(Zone_Position_X[1] != 260 - string_width(string(global.ZoneName))){
                Zone_Position_X[1] = max(260 - string_width(string(global.ZoneName)), Zone_Position_X[1]-10);
             }
          }
       }

    // "ZONE" below the actual zone name:
       if(global.BonusStage == false){
          if(Position_State == 2 && Zone_Position_X[1] = max(320 - 16 - string_width(string(global.ZoneName)), Zone_Position_X[1]-10)){
             if(Zone_Position_X[2] != 320 - 16 - string_width(string("ZONE"))){
                Zone_Position_X[2] = max(320 - 16 - string_width(string("ZONE")), Zone_Position_X[2]-10);
             }
          }
       }else{
          if(Position_State == 2 && Zone_Position_X[1] = max(260 - string_width(string(global.ZoneName)), Zone_Position_X[1]-10)){
             if(Zone_Position_X[2] != 320 - 16 - string_width(string("ZONE"))){
                Zone_Position_X[2] = max(320 - 16 - string_width(string("ZONE")), Zone_Position_X[2]-10);
             }
          }
       }


    // Act Number:
       if(Position_State == 2 && Zone_Position_X[2] = max(320 - 16 - string_width(string("ZONE")), Zone_Position_X[2]-10)){
          if(Act_Position_X != 320 - 24 - sprite_get_width(spr_title_card_acts)){
             Act_Position_X = max(320 - 24 - sprite_get_width(spr_title_card_acts), Act_Position_X -10);
          }else{
             Position_State = 3;
          }
       }

   // Count up to 60 frames until we continue...
      if(Position_State == 3){
         if(Stop_Timer != 0){
            Stop_Timer -= 1;
         }else{
           if(Backdrop_Alpha != -2){
              Backdrop_Alpha -= 0.10;
           }else{
              Position_State = 4;
           }
         }
      }

    // Disappear:
       if(Position_State == 4){
          if(Banner_Position_Y != 0 - sprite_get_height(spr_title_card_banner)){
             Banner_Position_Y = max(0 - sprite_get_height(spr_title_card_banner), Banner_Position_Y-15);
          }
          if(Zone_Position_X[1] != view_wview){
             Zone_Position_X[1] = max(0 - 16 - string_width(string(global.ZoneName)), Zone_Position_X[1]+15);
          }
          if(Zone_Position_X[2] != view_wview){
             Zone_Position_X[2] = max(0 - 16 - string_width(string("ZONE")), Zone_Position_X[2]+15);
          }
          if(Act_Position_X != view_wview){
             Act_Position_X = max(0 - 24 - sprite_get_width(spr_title_card_acts), Act_Position_X+15);
          }
       }

    // Enable Movement for each character and enable game timers:
       if(Backdrop_Alpha < 1){
          if(instance_exists(par_character)){
             with(par_character){
                  LockControl = 0;
             }
                if(Completed = 0 && alarm[0] = -1){
                   global.DoTime = 1;
                   alarm[0]      = 60;
                   if(SpecialFlag == true){
                      if(obj_camera.Cam_Subject != par_character){
                         obj_camera.Cam_Subject  = par_character;
                      }
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
/// Draw the Title Card.

    // Black Backdrop:
       if(SpecialFlag == false){
       draw_set_color(c_black);
       draw_set_alpha(Backdrop_Alpha);
       draw_rectangle(view_xview+0, view_yview+0, view_xview+view_wview, view_yview+view_hview, 0);
       draw_set_alpha(1);
       draw_set_color(c_white);
       }

    // Banner:
       if(global.BonusStage == false){
          draw_sprite(spr_title_card_banner, -1, floor(view_xview+Banner_Position_X), floor(view_yview+Banner_Position_Y));
       }

    // Zone Name:
       draw_set_font(global.Font_Card)
       if(global.BonusStage == false){
          draw_text(view_xview+Zone_Position_X[1], view_yview+Zone_Position_Y, string(global.ZoneName));
          draw_text(view_xview+Zone_Position_X[2], view_yview+Zone_Position_Y, string("#ZONE"));
       }else{
          draw_text(view_xview+Zone_Position_X[1], view_yview+224/2 -16, string(global.ZoneName));
       }

    // Zone Act:
       if(global.BonusStage == false){
          draw_sprite(spr_title_card_acts, global.ZoneAct-1, view_xview+Act_Position_X, view_yview+Act_Position_Y);
       }
