#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Set Direction/Strength.
    Direction  = 3;         // 0 = Up Right, 1 = Up Left, 2 = Down Right, 3 = Down Left;
    Strength   = 7.0703125; // How strong is the spring?
    Frame      = 0;         // Current frame of the spring.
    FrameTimer = 0 ;        // How long it takes to change the frame back to 0.
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update frames.
    if(Frame < 2){
       Frame+=1
       alarm[0] = 5;
    }else{
       FrameTimer = 10;
    }
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Change the springs frame.
    if(Frame != 0 && FrameTimer != 0){
       if(FrameTimer != 0){
          FrameTimer -= 1;
       }
       if(FrameTimer == 5){
          Frame      = 1;
       }else if(FrameTimer == 0){
                Frame       = 0;
                FrameTimer  = 0;
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
