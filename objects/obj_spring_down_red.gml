#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Set direction and Color/Strength.
    Direction  = 1;        // 0 = Up, 1 = Down, 2 = Left, 3 = Right;
    Strength   = 12;       // How strong is the spring?
    Frame      = 0;        // Current frame of the spring.
    FrameTimer = 15;       // How long it takes to change the frame back to 0.
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Change the springs frame.
    if(Frame == 1){
       if(FrameTimer != 0){
          FrameTimer -= 1;
       }else{
          Frame      = 0;
          FrameTimer = 15;
       }
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw the spring.
    draw_sprite(sprite_index, Frame, x, y);
