#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.

    GamePosition = -global.ScreenWidth;
    OverPosition =  global.ScreenWidth*2;
    GameTimer    = 60*8; // 8 Seconds.

 // Play Game Over jingle.
    PlaySound(SFX.Jingle_GameOver, global.SFXVolume, 1, 1);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Move text.

    if(GamePosition != (global.ScreenWidth/2)-sprite_get_width(spr_game_over)){
       GamePosition += ((global.ScreenWidth/2)-16-sprite_get_width(spr_game_over)/2-GamePosition)*0.10;
    }
    if(OverPosition != (global.ScreenWidth/2)+sprite_get_width(spr_game_over)){
       OverPosition += ((global.ScreenWidth/2)+16+sprite_get_width(spr_game_over)/2-OverPosition)*0.10;
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Count down.

    if(GameTimer > 0){
       GameTimer-=1
    }else{
       GameTimer = 0;
       if(instance_exists(obj_fade_game_restart) == false){
          instance_create(0, 0, obj_fade_game_restart);
       }
    }

    if(GameTimer < 60*6 && keyboard_check_pressed(global.Key_ENTER)){
       GameTimer = 0;
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw text.

    draw_sprite(spr_game_over, 0, view_xview+GamePosition, view_yview+view_hview/2)
    draw_sprite(spr_game_over, 1, view_xview+OverPosition, view_yview+view_hview/2)
