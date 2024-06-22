#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
cur_audio = "";
global.Font_Letters = font_add_sprite(spr_font_letters   , ord("!"), true , 1);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if cur_audio == "Audio Loaded!"{
obj_audio_manager.Audio = true
image_alpha -= 0.025;
}

if image_alpha<=0{
instance_destroy()
}
