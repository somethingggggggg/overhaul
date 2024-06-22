#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Init. Chopper:

    YSpd        = -7;
    YGrv        = 0.2;
    image_speed = 0.1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Jump/Fall:

 // Apply Gravity:
    YSpd += YGrv

 // Check if we're in our starting position, jump again if true.
    if(y >= ystart){
       YSpd = -7;
    }    
    
 // Increase/Decrease the Y Position using YSpd.
    y += YSpd;
