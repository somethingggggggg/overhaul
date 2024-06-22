#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.
    R = 5 + random(25)
    D = random(360);

    image_index = random(7);
    image_speed = 0;
    alarm[0]    = 15;

    depth       = choose(0, 0, -1)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy.
    instance_destroy();
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Position and Frames.
    if(R < 20) R+= 0.25;
       D += 5;

    image_index += 1/8;
    if(image_index >= 7.5) instance_destroy();
#define Other_59
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy.
    image_index = 7;
    instance_destroy();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Sparkle.

 // Get and Set Alpha:
    if(instance_exists(par_character)){
       var (MyAlpha) = par_character.Alpha;
    }else{
           (MyAlpha) = 0;
    }

 // Draw the Sparkle.
    draw_sprite_ext(sprite_index, image_index, x+lengthdir_x(R, D), y+lengthdir_y(R, D), 1, 1, 0, c_white, MyAlpha)
