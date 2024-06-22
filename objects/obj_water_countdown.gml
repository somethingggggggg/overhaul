#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.
    image_speed = 0;
    image_index = 0;
    alarm[0]    = 5;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Change Image.

 // Exit:
    if(image_index = 11) exit;

 // Everything else.
    if(image_index = 0 || image_index = 2 || image_index = 4 || image_index = 6
    || image_index = 8 || image_index = 10){
       alarm[0] = 115;
    }

    if(image_index = 1 || image_index = 3 || image_index = 5 || image_index = 7
    || image_index = 9){
       alarm[0] = 5;
    }


    image_index+=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if par_character.Underwater = false{
instance_destroy()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw.

    i = Parent;
    if(instance_exists(i)){
       if(i.Action != ActionDie){
          if(image_index = 1 || image_index = 3 || image_index = 5 || image_index = 7
          || image_index = 9 || image_index = 11){
             if((global.ObjectTime div 60) mod 3){
                draw_sprite(sprite_index, image_index, floor(i.x), floor(i.y-54));
             }
          }else{
             draw_sprite(sprite_index, image_index, floor(i.x), floor(i.y-54));
          }
       }
    }else{
       if(image_index = 1 || image_index = 3 || image_index = 5 || image_index = 7
       || image_index = 9 || image_index = 11){
          if((global.ObjectTime div 60) mod 3){
             draw_sprite(sprite_index, image_index, floor(x), floor(y));
          }
       }else{
          draw_sprite(sprite_index, image_index, floor(x), floor(y));
       }
    }
