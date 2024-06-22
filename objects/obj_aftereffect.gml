#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.

    image_alpha = 0.5;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Change alpha and destroy.

    image_alpha -= 0.05;
    if (image_alpha <= 0) instance_destroy();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw After Effect.

   // Draw the After effect:
      draw_sprite_ext(sprite_index, floor(AnimationFrame), floor(x), floor(y),
                      AnimationDirection, 1, AnimationAngle, c_white, image_alpha);
